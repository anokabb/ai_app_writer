import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';

abstract class HumanizerRepo {
  Stream<Either<AppError, HumanizationResult>> humanizeText(String text, {double? humanLike, double? creativity});
}
