import 'package:fpdart/fpdart.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/humanizer/data/api/humanizer_api.dart';
import 'package:flutter_app_template/src/features/humanizer/data/models/humanizer_model.dart';
import 'humanizer_repo.dart';

class HumanizerRepoImpl implements HumanizerRepo {
  final HumanizerApi _api;

  HumanizerRepoImpl(this._api);

  @override
  Future<Either<AppError, HumanizerModel>> fetchSomething() async {
    try {
      final response = await _api.fetchSomething();
      return right(response.data!);
    } catch (e) {
      return left(AppError.fromException(e));
    }
  }
}
