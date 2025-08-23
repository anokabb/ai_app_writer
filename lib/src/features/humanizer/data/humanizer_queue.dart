import 'dart:convert';

import 'package:flutter_app_template/src/core/constants/hive_config.dart';
import 'package:flutter_app_template/src/features/humanizer/domain/humanizer_options.dart';

class HumanizerRequest {
  final String input;
  final HumanizerOptions options;
  final int attempts;
  final DateTime nextRetryAt;

  HumanizerRequest({required this.input, required this.options, this.attempts = 0, DateTime? nextRetryAt})
      : nextRetryAt = nextRetryAt ?? DateTime.now();

  HumanizerRequest copyWith({int? attempts, DateTime? nextRetryAt}) => HumanizerRequest(
        input: input,
        options: options,
        attempts: attempts ?? this.attempts,
        nextRetryAt: nextRetryAt ?? this.nextRetryAt,
      );

  Map<String, dynamic> toJson() => {
        'input': input,
        'options': options.toJson(),
        'attempts': attempts,
        'nextRetryAt': nextRetryAt.toIso8601String(),
      };

  factory HumanizerRequest.fromJson(Map<String, dynamic> json) => HumanizerRequest(
        input: json['input'] as String,
        options: HumanizerOptions(
          tone: HumanizerTone.values.firstWhere((e) => e.name == (json['options']['tone'] as String? ?? 'neutral'), orElse: () => HumanizerTone.neutral),
          temperature: (json['options']['temperature'] as num?)?.toDouble() ?? 0.7,
          targetLength: TargetLength.values.firstWhere((e) => e.name == (json['options']['targetLength'] as String? ?? 'same'), orElse: () => TargetLength.same),
          keepKeywords: ((json['options']['keepKeywords'] as List?)?.map((e) => e.toString()).toList()) ?? const [],
        ),
        attempts: (json['attempts'] as num?)?.toInt() ?? 0,
        nextRetryAt: DateTime.parse(json['nextRetryAt'] as String),
      );
}

class HumanizerQueue {
  static const String _key = 'humanizerQueue';

  List<HumanizerRequest> load() {
    final raw = cacheBox.get(_key, defaultValue: '[]') as String;
    final list = (json.decode(raw) as List).map((e) => HumanizerRequest.fromJson(e as Map<String, dynamic>)).toList();
    return list;
  }

  Future<void> save(List<HumanizerRequest> items) async {
    await cacheBox.put(_key, json.encode(items.map((e) => e.toJson()).toList()));
  }

  Future<void> enqueue(HumanizerRequest request) async {
    final items = load();
    items.add(request);
    await save(items);
  }

  Future<List<HumanizerRequest>> dequeueDue() async {
    final now = DateTime.now();
    final items = load();
    final due = items.where((r) => r.nextRetryAt.isBefore(now)).toList();
    items.removeWhere((r) => due.contains(r));
    await save(items);
    return due;
  }
}