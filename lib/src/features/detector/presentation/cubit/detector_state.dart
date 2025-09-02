part of 'detector_cubit.dart';

@freezed
class DetectorState with _$DetectorState {
  const factory DetectorState.initial() = DetectorStateInitial;
  const factory DetectorState.loading() = DetectorStateLoading;
  const factory DetectorState.loaded(TextAnalysisResult result) = DetectorStateLoaded;
  const factory DetectorState.error(AppError error) = DetectorStateError;
}
