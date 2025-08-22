import 'package:dio/dio.dart';

class Classification {
  final String label;
  final double confidence; // 0..1
  final List<String> reasons;

  const Classification({required this.label, required this.confidence, required this.reasons});
}

abstract class LlmClient {
  Future<String> complete({String? system, required String prompt, Map<String, dynamic>? params, CancelToken? cancelToken});

  Future<Classification> classify({required String prompt, List<String>? labels, CancelToken? cancelToken});

  Stream<String> streamComplete({String? system, required String prompt, Map<String, dynamic>? params, CancelToken? cancelToken});
}