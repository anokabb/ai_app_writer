import 'package:flutter_app_template/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:fpdart/fpdart.dart';

abstract class HumanizerRepo {
  Stream<Either<AppError, HumanizationResult>> humanizeText(String text, {double? humanLike, double? creativity});
}
