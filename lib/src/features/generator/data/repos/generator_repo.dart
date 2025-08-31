import 'package:fpdart/fpdart.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/generator/data/models/generator_model.dart';

abstract class GeneratorRepo {
  Future<Either<AppError, GeneratorModel>> fetchSomething();
}
