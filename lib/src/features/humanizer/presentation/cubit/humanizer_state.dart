part of 'humanizer_cubit.dart';

class HumanizerState {
  final bool isLoading;
  final String? error;
  final String? input;
  final String? output;
  final List<Diff>? diffs;

  const HumanizerState._({
    required this.isLoading,
    this.error,
    this.input,
    this.output,
    this.diffs,
  });

  const HumanizerState.initial() : this._(isLoading: false);
  const HumanizerState.loading() : this._(isLoading: true);
  const HumanizerState.error(String e) : this._(isLoading: false, error: e);
  const HumanizerState.success({required String input, required String output, required List<Diff> diffs})
      : this._(isLoading: false, input: input, output: output, diffs: diffs);
}