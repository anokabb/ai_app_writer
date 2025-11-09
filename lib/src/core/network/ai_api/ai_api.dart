import 'package:dio/dio.dart';

abstract class AiApi {
  final Dio dio;

  AiApi(this.dio);

  Future<Map<String, dynamic>> analyzeText(String authorization, Map<String, dynamic> request);

  Future<Map<String, dynamic>> humanizeText(String authorization, Map<String, dynamic> request);

  Future<Map<String, dynamic>> generateContent(String authorization, Map<String, dynamic> request);
}
