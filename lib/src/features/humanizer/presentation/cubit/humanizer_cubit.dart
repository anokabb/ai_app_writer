import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';

part 'humanizer_state.dart';
part 'gen/humanizer_cubit.freezed.dart';

class HumanizerCubit extends Cubit<HumanizerState> {
  HumanizerCubit() : super(const HumanizerState.initial());
}
