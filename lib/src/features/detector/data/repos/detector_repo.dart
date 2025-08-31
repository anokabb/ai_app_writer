import 'package:fpdart/fpdart.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/detector/data/models/detector_model.dart';

abstract class DetectorRepo {
  Future<Either<AppError, DetectorModel>> fetchSomething();
}
