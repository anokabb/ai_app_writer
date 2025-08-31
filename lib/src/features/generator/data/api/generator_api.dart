import 'package:flutter_app_template/src/core/network/models/api_response.dart';
import 'package:flutter_app_template/src/features/generator/data/models/generator_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'gen/generator_api.g.dart';

@RestApi()
abstract class GeneratorApi {
  factory GeneratorApi(Dio dio) = _GeneratorApi;

  @GET('/generator')
  Future<ApiResponse<GeneratorModel>> fetchSomething();
}
