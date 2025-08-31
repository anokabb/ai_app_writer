import 'package:fpdart/fpdart.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/detector/data/api/detector_api.dart';
import 'package:flutter_app_template/src/features/detector/data/models/detector_model.dart';
import 'detector_repo.dart';

class DetectorRepoImpl implements DetectorRepo {
  final DetectorApi _api;

  DetectorRepoImpl(this._api);

  @override
  Future<Either<AppError, DetectorModel>> fetchSomething() async {
    try {
      final response = await _api.fetchSomething();
      return right(response.data!);
    } catch (e) {
      return left(AppError.fromException(e));
    }
  }
}
