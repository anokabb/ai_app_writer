import 'package:dio/dio.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';

import 'ai_api.dart';

class OpenAIApi extends AiApi {
  OpenAIApi(super.dio);

  final baseUrl = locator<RemoteConfigService>().data.api.openaiBaseUrl;

  @override
  Future<Map<String, dynamic>> analyzeText(String authorization, Map<String, dynamic> request) async {
    final response = await dio.post(
      '$baseUrl/chat/completions',
      data: request,
      options: Options(headers: {'Authorization': authorization}),
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<ResponseBody> streamHumanizeText(String authorization, Map<String, dynamic> request) async {
    final response = await dio.post(
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

  @override
  Future<ResponseBody> streamGenerateContent(String authorization, Map<String, dynamic> request) async {
    final response = await dio.post(
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

  @override
  Future<Response<Map<String, dynamic>>> generateTitle(String authorization, Map<String, dynamic> request) async {
    final response = await dio.post(
      '$baseUrl/chat/completions',
      data: request,
      options: Options(headers: {'Authorization': authorization}),
    );
    return response as Response<Map<String, dynamic>>;
  }
}
