import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/repos/ai_repo.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/pages/detector_page.dart';

import 'detector_repo.dart';

class DetectorRepoImpl implements DetectorRepo {
  final AiRepo repo;

  DetectorRepoImpl(this.repo);

  @override
  Future<Either<AppError, TextAnalysisResult>> analyzeText({required String text, required DetectorModes mode}) async {
    return repo.analyzeText(text: text, mode: mode);
  }
}
