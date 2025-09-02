part of 'humanizer_cubit.dart';

@freezed
class HumanizerState with _$HumanizerState {
  const factory HumanizerState.initial() = HumanizerStateInitial;
  const factory HumanizerState.loading() = HumanizerStateLoading;
  const factory HumanizerState.loaded(HumanizationResult result) = HumanizerStateLoaded;
  const factory HumanizerState.error(AppError error) = HumanizerStateError;
}
