import 'package:flutter_app_template/src/core/network/models/api_response.dart';
import 'package:flutter_app_template/src/features/detector/data/models/detector_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'gen/detector_api.g.dart';

@RestApi()
abstract class DetectorApi {
  factory DetectorApi(Dio dio) = _DetectorApi;

  @GET('/detector')
  Future<ApiResponse<DetectorModel>> fetchSomething();
}
