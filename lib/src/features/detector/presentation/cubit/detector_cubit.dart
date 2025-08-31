import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';

part 'detector_state.dart';
part 'gen/detector_cubit.freezed.dart';

class DetectorCubit extends Cubit<DetectorState> {
  DetectorCubit() : super(const DetectorState.initial());
}
