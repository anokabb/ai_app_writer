import 'package:dio/dio.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/backend_responses.dart';
import 'package:retrofit/retrofit.dart';

part 'gen/backend_api.g.dart';

@RestApi()
abstract class BackendApi {
  factory BackendApi(Dio dio, {String baseUrl}) = _BackendApi;

  @POST('/api/phrasly/detect')
  Future<BackendDetectResponse> detect(
    @Body() Map<String, dynamic> request,
    @Header('X-Backend-API-Key') String apiKey,
  );

  @POST('/api/phrasly/humanize')
  Future<BackendHumanizeResponse> humanize(
    @Body() Map<String, dynamic> request,
    @Header('X-Backend-API-Key') String apiKey,
  );

  @POST('/api/phrasly/generate')
  Future<BackendGenerateResponse> generate(
    @Body() Map<String, dynamic> request,
    @Header('X-Backend-API-Key') String apiKey,
  );
}
