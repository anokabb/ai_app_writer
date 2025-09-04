import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/features/detector/data/repos/detector_repo.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/pages/detector_page.dart';

part 'detector_state.dart';
part 'gen/detector_cubit.freezed.dart';

class DetectorCubit extends Cubit<DetectorState> {
  final DetectorRepo _detectorRepo;

  DetectorCubit(this._detectorRepo) : super(const DetectorState.initial());

  Future<void> analyzeText(String text, {required DetectorModes mode}) async {
    if (text.trim().isEmpty) {
      emit(DetectorState.error(AppError.server(message: 'Please enter some text to analyze')));
      return;
    }

    emit(const DetectorState.loading());

    final result = await _detectorRepo.analyzeText(text: text, mode: mode);

    result.fold(
      (error) => emit(DetectorState.error(error)),
      (analysisResult) => emit(DetectorState.loaded(analysisResult)),
    );
  }

  void reset() {
    emit(const DetectorState.initial());
  }
}
