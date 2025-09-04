import 'package:dio/dio.dart';
import 'package:phrasly_ai_tools/src/core/network/models/api_response.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/models/generator_model.dart';
import 'package:retrofit/retrofit.dart';

part 'gen/generator_api.g.dart';

@RestApi()
abstract class GeneratorApi {
  factory GeneratorApi(Dio dio) = _GeneratorApi;

  @GET('/generator')
  Future<ApiResponse<GeneratorModel>> fetchSomething();
}
