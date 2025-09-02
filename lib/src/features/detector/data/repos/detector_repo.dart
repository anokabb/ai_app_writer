import 'package:flutter_app_template/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/detector/presentation/pages/detector_page.dart';
import 'package:fpdart/fpdart.dart';

abstract class DetectorRepo {
  Future<Either<AppError, TextAnalysisResult>> analyzeText({required String text, required DetectorModes mode});
}
