import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/generator/data/models/generator_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class GeneratorRepo {
  Stream<Either<AppError, GeneratorModel>> generateContent({
    required String text,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
  });
}
