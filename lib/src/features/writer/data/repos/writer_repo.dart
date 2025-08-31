import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/writer/data/models/text_analysis_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class WriterRepo {
  Future<Either<AppError, TextAnalysisResult>> analyzeText(String text);
  Stream<Either<AppError, HumanizationResult>> humanizeText(String text, {double? humanLike, double? creativity});
}
