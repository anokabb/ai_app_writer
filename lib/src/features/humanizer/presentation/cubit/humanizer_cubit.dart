import 'package:flutter_app_template/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:flutter_app_template/src/features/humanizer/data/repos/humanizer_repo.dart';
import 'package:flutter_app_template/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/humanizer_cubit.freezed.dart';
part 'humanizer_state.dart';

class HumanizerCubit extends Cubit<HumanizerState> {
  final HumanizerRepo _humanizerRepo;

  HumanizerCubit(this._humanizerRepo) : super(const HumanizerState.initial());

  bool firstLoaded = false;

  Future<void> humanizeText(String text, {double? humanLike, double? creativity, Function()? onFirstLoad}) async {
    firstLoaded = false;
    if (text.trim().isEmpty) {
      emit(HumanizerState.error(AppError.server(message: 'Please enter some text to humanize')));
      return;
    }

    emit(const HumanizerState.loading());

    await for (final result in _humanizerRepo.humanizeText(text, humanLike: humanLike, creativity: creativity)) {
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
    }

    if (state is HumanizerStateLoaded && locator<SettingsCubit>().state.settings.autoSaveEnabled) {
      final result = (state as HumanizerStateLoaded).result;
      if (locator<SettingsCubit>().state.settings.autoSaveEnabled) {
        locator<HistoryCubit>().save(result: result, originalText: result.originalText);
      }
    }
  }

  void reset() {
    emit(const HumanizerState.initial());
  }
}
