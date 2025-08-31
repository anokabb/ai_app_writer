import 'package:fpdart/fpdart.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/humanizer/data/models/humanizer_model.dart';

abstract class HumanizerRepo {
  Future<Either<AppError, HumanizerModel>> fetchSomething();
}
