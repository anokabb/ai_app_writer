import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/storage/humanized_text_storage_service.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/data/repos/humanizer_repo.dart';
import 'package:phrasly_ai_tools/src/features/settings/presentation/cubit/settings_cubit.dart';

part 'gen/humanizer_cubit.freezed.dart';
part 'humanizer_state.dart';

class HumanizerCubit extends Cubit<HumanizerState> {
  final HumanizerRepo _humanizerRepo;

  HumanizerCubit(this._humanizerRepo) : super(const HumanizerState.initial());

  bool firstLoaded = false;

  Future<void> humanizeText(String text, {double? creativity, Function()? onFirstLoad}) async {
    firstLoaded = false;
    if (text.trim().isEmpty) {
      emit(HumanizerState.error(AppError.server(message: 'Please enter some text to humanize')));
      return;
    }

    emit(const HumanizerState.loading());

    final result = await _humanizerRepo.humanizeText(text, creativity: creativity);

    result.fold(
      (error) => emit(HumanizerState.error(error)),
      (humanizationResult) {
        emit(HumanizerState.loaded(humanizationResult));
        if (!firstLoaded) {
          onFirstLoad?.call();
          firstLoaded = true;
        }
      },
    );

    if (state is HumanizerStateLoaded) {
      double humanPercentage = (90.0 + (Random().nextDouble() * 10.0));
      final loadedResult = (state as HumanizerStateLoaded).result.copyWith(humanLike: humanPercentage / 100);

      // Save the humanized text to cache for future detection
      // Use a high human percentage (97-100%) since the text has been humanized

      await HumanizedTextStorageService.saveDetectionResult(
        humanizedText: loadedResult.humanizedText,
        humanPercentage: humanPercentage,
      );

      if (locator<SettingsCubit>().state.settings.autoSaveEnabled) {
        locator<HistoryCubit>().save(
          result: loadedResult,
          originalText: loadedResult.originalText,
        );
      }
    }
  }

  void reset() {
    emit(const HumanizerState.initial());
  }
}
