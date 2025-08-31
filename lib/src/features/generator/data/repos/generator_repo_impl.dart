import 'package:fpdart/fpdart.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/generator/data/api/generator_api.dart';
import 'package:flutter_app_template/src/features/generator/data/models/generator_model.dart';
import 'generator_repo.dart';

class GeneratorRepoImpl implements GeneratorRepo {
  final GeneratorApi _api;

  GeneratorRepoImpl(this._api);

  @override
  Future<Either<AppError, GeneratorModel>> fetchSomething() async {
    try {
      final response = await _api.fetchSomething();
      return right(response.data!);
    } catch (e) {
      return left(AppError.fromException(e));
    }
  }
}
