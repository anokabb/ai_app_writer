import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/detector_model.freezed.dart';
part 'gen/detector_model.g.dart';

@freezed
class DetectorModel with _$DetectorModel {
  const factory DetectorModel({
    required String id,
    required String name,
  }) = _DetectorModel;

  factory DetectorModel.fromJson(Map<String, dynamic> json) => _$DetectorModelFromJson(json);
}
