import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/models/generator_model.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/repos/generator_repo.dart';
import 'package:phrasly_ai_tools/src/features/settings/presentation/cubit/settings_cubit.dart';

part 'gen/generator_cubit.freezed.dart';
part 'generator_state.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  final GeneratorRepo _generatorRepo;
  GeneratorCubit(this._generatorRepo) : super(const GeneratorState.initial());

  bool firstLoaded = false;

  Future<void> generateContent({
    required String text,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
    Function()? onFirstLoad,
  }) async {
    firstLoaded = false;

    if (text.trim().isEmpty) {
      emit(GeneratorState.error(AppError.server(message: 'Please enter some text to generate content')));
      return;
    }

    emit(const GeneratorState.loading());

    await for (final result in _generatorRepo.generateContent(
      text: text,
      typeOfWriting: typeOfWriting,
      tone: tone,
      wordCount: wordCount,
      language: language,
    )) {
      result.fold(
        (error) => emit(GeneratorState.error(error)),
        (generatorResult) {
          emit(GeneratorState.loaded(generatorResult));
          if (!firstLoaded) {
            onFirstLoad?.call();
            firstLoaded = true;
          }
        },
      );
    }

    if (state is GeneratorStateLoaded && locator<SettingsCubit>().state.settings.autoSaveEnabled) {
      final result = (state as GeneratorStateLoaded).result;
      if (locator<SettingsCubit>().state.settings.autoSaveEnabled) {
        locator<HistoryCubit>().saveGeneratedContent(result: result, originalText: result.originalText);
      }
    }
  }

  void reset() {
    emit(const GeneratorState.initial());
    firstLoaded = false;
  }
}
