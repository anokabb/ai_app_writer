part of 'writer_cubit.dart';

@freezed
class WriterState with _$WriterState {
  const factory WriterState.initial() = WriterStateInitial;
  const factory WriterState.analyzing() = WriterStateAnalyzing;
  const factory WriterState.analysisComplete(TextAnalysisResult result) = WriterStateAnalysisComplete;
  const factory WriterState.analysisError(AppError error) = WriterStateAnalysisError;
  const factory WriterState.humanizing() = WriterStateHumanizing;
  const factory WriterState.humanizationProgress(HumanizationResult result) = WriterStateHumanizationProgress;
  const factory WriterState.humanizationComplete(HumanizationResult result) = WriterStateHumanizationComplete;
  const factory WriterState.humanizationError(AppError error) = WriterStateHumanizationError;
}
