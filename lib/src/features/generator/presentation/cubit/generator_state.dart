part of 'generator_cubit.dart';

@freezed
class GeneratorState with _$GeneratorState {
  const factory GeneratorState.initial() = GeneratorStateInitial;
  const factory GeneratorState.loading() = GeneratorStateLoading;
  const factory GeneratorState.loaded() = GeneratorStateLoaded;
  const factory GeneratorState.error(AppError error) = GeneratorStateError;
}
