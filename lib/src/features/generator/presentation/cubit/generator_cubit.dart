import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';

part 'generator_state.dart';
part 'gen/generator_cubit.freezed.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  GeneratorCubit() : super(const GeneratorState.initial());
}
