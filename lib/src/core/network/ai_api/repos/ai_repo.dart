import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/pages/detector_page.dart';
import 'package:fpdart/fpdart.dart';

abstract class AiRepo {
  Future<Either<AppError, TextAnalysisResult>> analyzeText({required String text, required DetectorModes mode});
  Stream<Either<AppError, HumanizationResult>> humanizeText(String text, {double? humanLike, double? creativity});
  Stream<Either<AppError, ContentGenerationResult>> generateContent({
    required String text,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
  });
  Future<Either<AppError, String>> generateTitle(String prompt);
}
