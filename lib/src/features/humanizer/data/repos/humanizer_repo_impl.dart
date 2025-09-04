import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/repos/ai_repo.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';

import 'humanizer_repo.dart';

class HumanizerRepoImpl implements HumanizerRepo {
  final AiRepo repo;

  HumanizerRepoImpl(this.repo);

  @override
  Stream<Either<AppError, HumanizationResult>> humanizeText(String text, {double? humanLike, double? creativity}) {
    return repo.humanizeText(text, humanLike: humanLike, creativity: creativity);
  }
}
