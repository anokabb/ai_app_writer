import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/models/generator_model.dart';

abstract class GeneratorRepo {
  Stream<Either<AppError, GeneratorModel>> generateContent({
    required String text,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
  });
}
