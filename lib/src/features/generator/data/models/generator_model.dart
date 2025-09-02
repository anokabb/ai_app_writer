import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/generator_model.freezed.dart';
part 'gen/generator_model.g.dart';

@freezed
class GeneratorModel with _$GeneratorModel {
  const factory GeneratorModel({
    required String id,
    required String originalText,
    required String generatedContent,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
    List<String>? suggestions,
    String? explanation,
    DateTime? createdAt,
  }) = _GeneratorModel;

  factory GeneratorModel.fromJson(Map<String, dynamic> json) => _$GeneratorModelFromJson(json);
}
