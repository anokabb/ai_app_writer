import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';

import '../models/text_analysis_model.dart';

abstract class WriterRepo {
  Future<Either<AppError, TextAnalysisResult>> analyzeText(String text);
  Stream<Either<AppError, HumanizationResult>> humanizeText(String text, {double? humanLike, double? creativity});
}
