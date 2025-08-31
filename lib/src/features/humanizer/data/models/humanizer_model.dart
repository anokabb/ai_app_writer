import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/humanizer_model.freezed.dart';
part 'gen/humanizer_model.g.dart';

@freezed
class HumanizerModel with _$HumanizerModel {
  const factory HumanizerModel({
    required String id,
    required String name,
  }) = _HumanizerModel;

  factory HumanizerModel.fromJson(Map<String, dynamic> json) => _$HumanizerModelFromJson(json);
}
