import 'package:dio/dio.dart';

abstract class AiApi {
  final Dio dio;

  AiApi(this.dio);

  Future<Map<String, dynamic>> analyzeText(String authorization, Map<String, dynamic> request);

  Future<ResponseBody> streamHumanizeText(String authorization, Map<String, dynamic> request);

  Future<ResponseBody> streamGenerateContent(String authorization, Map<String, dynamic> request);

  Future<Response<Map<String, dynamic>>> generateTitle(String authorization, Map<String, dynamic> request);
}
