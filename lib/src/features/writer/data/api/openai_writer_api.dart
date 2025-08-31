import 'package:dio/dio.dart';

class OpenAIWriterApi {
  final Dio _dio;
  final String baseUrl;

  OpenAIWriterApi(this._dio, {this.baseUrl = 'https://api.openai.com/v1'});

  Future<Map<String, dynamic>> analyzeText(String authorization, Map<String, dynamic> request) async {
    final response = await _dio.post(
      '$baseUrl/chat/completions',
      data: request,
      options: Options(headers: {'Authorization': authorization}),
    );
    return response.data as Map<String, dynamic>;
  }

  Future<ResponseBody> streamHumanizeText(String authorization, Map<String, dynamic> request) async {
    final response = await _dio.post(
      '$baseUrl/chat/completions',
      data: request,
      options: Options(
        headers: {'Authorization': authorization},
        responseType: ResponseType.stream,
      ),
    );

    // Return the ResponseBody directly for streaming
    return response.data as ResponseBody;
  }
}
