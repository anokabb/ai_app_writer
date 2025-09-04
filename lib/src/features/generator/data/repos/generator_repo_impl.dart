import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/repos/ai_repo.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/models/generator_model.dart';

import 'generator_repo.dart';

class GeneratorRepoImpl implements GeneratorRepo {
  final AiRepo _aiRepo;

  GeneratorRepoImpl(this._aiRepo);

  @override
  Stream<Either<AppError, GeneratorModel>> generateContent({
    required String text,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
  }) {
    return _aiRepo
        .generateContent(
          text: text,
          typeOfWriting: typeOfWriting,
          tone: tone,
          wordCount: wordCount,
          language: language,
        )
        .map((result) => result.fold(
              (error) => left(error),
              (contentResult) => right(GeneratorModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                originalText: contentResult.originalText,
                generatedContent: contentResult.generatedContent,
                typeOfWriting: contentResult.typeOfWriting,
                tone: contentResult.tone,
                wordCount: contentResult.wordCount,
                language: contentResult.language,
                suggestions: contentResult.suggestions,
                explanation: contentResult.explanation,
                createdAt: DateTime.now(),
              )),
            ));
  }
}
