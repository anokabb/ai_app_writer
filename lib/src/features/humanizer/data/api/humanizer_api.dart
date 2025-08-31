import 'package:flutter_app_template/src/core/network/models/api_response.dart';
import 'package:flutter_app_template/src/features/humanizer/data/models/humanizer_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'gen/humanizer_api.g.dart';

@RestApi()
abstract class HumanizerApi {
  factory HumanizerApi(Dio dio) = _HumanizerApi;

  @GET('/humanizer')
  Future<ApiResponse<HumanizerModel>> fetchSomething();
}
