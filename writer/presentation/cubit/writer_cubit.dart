import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';

import '../../data/models/text_analysis_model.dart';
import '../../data/repos/writer_repo.dart';

part 'gen/writer_cubit.freezed.dart';
part 'writer_state.dart';

class WriterCubit extends Cubit<WriterState> {
  final WriterRepo _writerRepo;

  WriterCubit(this._writerRepo) : super(const WriterState.initial());

  Future<void> analyzeText(String text) async {
    emit(const WriterState.analyzing());
    final result = await _writerRepo.analyzeText(text);

    result.match(
      (error) {
        log('Error analyzing text: ${error.message}');
        emit(WriterState.analysisError(error));
      },
      (analysisResult) {
        emit(WriterState.analysisComplete(analysisResult));
      },
    );
  }

  Future<void> humanizeText(String text, {double? humanLike, double? creativity}) async {
    emit(const WriterState.humanizing());

    HumanizationResult? finalResult;
    List<HumanizationResult> allResults = [];

    await for (final result in _writerRepo.humanizeText(text, humanLike: humanLike, creativity: creativity)) {
      result.match(
        (error) {
          log('Error humanizing text: ${error.message}');
          emit(WriterState.humanizationError(error));
          return;
        },
        (humanizationResult) {
          finalResult = humanizationResult;
          allResults.add(humanizationResult);
          emit(WriterState.humanizationProgress(humanizationResult));
        },
      );
    }

    // Stream completed - emit final state with completion flag
    if (finalResult != null) {
      log('Humanization stream completed. Total results: ${allResults.length}');
      log('Final result - Human-like: ${finalResult!.humanLike}, Explanation: ${finalResult!.explanation}');

      // Emit a special completion state
      emit(WriterState.humanizationComplete(finalResult!));
    } else {
      log('Humanization completed with no results');
      emit(const WriterState.initial());
    }
  }

  void reset() {
    emit(const WriterState.initial());
  }
}
