import 'package:dio/dio.dart';

class GeminiWriterApi {
  final Dio _dio;
  final String baseUrl;

  GeminiWriterApi(this._dio, {this.baseUrl = 'https://generativelanguage.googleapis.com/v1beta'});

  Future<Map<String, dynamic>> analyzeText(String apiKey, Map<String, dynamic> request) async {
    final response = await _dio.post(
      '$baseUrl/models/gemini-1.5-flash:generateContent?key=$apiKey',
      data: request,
    );
    return response.data as Map<String, dynamic>;
  }

  Future<ResponseBody> streamHumanizeText(String apiKey, Map<String, dynamic> request) async {
    final response = await _dio.post(
      '$baseUrl/models/gemini-1.5-flash:streamGenerateContent?key=$apiKey',
      data: request,
      options: Options(
        responseType: ResponseType.stream,
      ),
    );

    // Return the ResponseBody directly for streaming
    return response.data as ResponseBody;
  }
}
