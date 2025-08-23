import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/data/llm/llm_client.dart';

class OpenAiLlmClient implements LlmClient {
  final Dio _dio;
  final String _model;

  OpenAiLlmClient({required Dio dio, String model = 'gpt-4o-mini'})
      : _dio = dio,
        _model = model;

  Map<String, dynamic> _buildBody({String? system, required String prompt, Map<String, dynamic>? params, bool stream = false}) {
    final messages = <Map<String, dynamic>>[];
    if ((system ?? '').trim().isNotEmpty) {
      messages.add({
        'role': 'system',
        'content': system,
      });
    }
    messages.add({
      'role': 'user',
      'content': prompt,
    });

    return {
      'model': params?['model'] ?? _model,
      'messages': messages,
      'temperature': params?['temperature'] ?? 0.7,
      'max_tokens': params?['max_tokens'] ?? 1024,
      if (stream) 'stream': true,
      if (params?['response_format'] != null) 'response_format': params!['response_format'],
    };
  }

  @override
  Future<String> complete({String? system, required String prompt, Map<String, dynamic>? params, CancelToken? cancelToken}) async {
    try {
      final body = _buildBody(system: system, prompt: prompt, params: params, stream: false);
      final res = await _dio.post('/v1/chat/completions', data: body, cancelToken: cancelToken);
      final choices = res.data['choices'] as List?;
      final content = choices != null && choices.isNotEmpty
          ? choices.first['message']?['content']?.toString() ?? ''
          : '';
      return content;
    } on DioException catch (e) {
      throw Exception(_errorMessage(e));
    }
  }

  @override
  Stream<String> streamComplete({String? system, required String prompt, Map<String, dynamic>? params, CancelToken? cancelToken}) async* {
    final body = _buildBody(system: system, prompt: prompt, params: params, stream: true);
    Response<ResponseBody> res;
    try {
      res = await _dio.post<ResponseBody>(
        '/v1/chat/completions',
        data: body,
        options: Options(responseType: ResponseType.stream),
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw Exception(_errorMessage(e));
    }

    final stream = res.data!.stream.transform(utf8.decoder).transform(const LineSplitter());
    // OpenAI streams SSE lines starting with 'data: {json}' and a final '[DONE]'.
    await for (final line in stream) {
      if (!line.startsWith('data:')) continue;
      final data = line.replaceFirst('data:', '').trim();
      if (data == '[DONE]') break;
      try {
        final Map<String, dynamic> jsonLine = json.decode(data);
        final delta = jsonLine['choices']?[0]?['delta'];
        final token = delta?['content']?.toString();
        if (token != null && token.isNotEmpty) {
          yield token;
        }
      } catch (_) {
        // ignore malformed line
      }
    }
  }

  @override
  Future<Classification> classify({required String prompt, List<String>? labels, CancelToken? cancelToken}) async {
    final system = 'You are a text classifier. Respond with strict JSON: {"label": string, "confidence": number between 0 and 1, "reasons": string[]}.';
    final jsonFormat = {'type': 'json_object'}; // supported by OpenAI-compatible providers
    try {
      final body = _buildBody(system: system, prompt: prompt, params: {
        'response_format': jsonFormat,
        'temperature': 0,
        'max_tokens': 512,
      }, stream: false);
      final res = await _dio.post('/v1/chat/completions', data: body, cancelToken: cancelToken);
      final content = res.data['choices']?[0]?['message']?['content']?.toString() ?? '{}';
      final map = json.decode(content) as Map<String, dynamic>;
      return Classification(
        label: map['label']?.toString() ?? 'unknown',
        confidence: (map['confidence'] is num) ? (map['confidence'] as num).toDouble() : 0.0,
        reasons: (map['reasons'] as List?)?.map((e) => e.toString()).toList() ?? const [],
      );
    } on DioException catch (e) {
      // fallback: try to parse if provider ignored response_format
      final msg = _errorMessage(e);
      if (kDebugMode) {
        debugPrint('classify error: $msg');
      }
      rethrow;
    }
  }

  String _errorMessage(DioException e) {
    final status = e.response?.statusCode;
    final detail = e.response?.data is Map ? (e.response?.data['error']?.toString()) : e.message;
    return 'LLM error${status != null ? ' ($status)' : ''}: ${detail ?? 'Unknown'}';
  }
}