import 'package:flutter_app_template/src/features/writer/data/models/text_analysis_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/history_item.freezed.dart';
part 'gen/history_item.g.dart';

@freezed
class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    required String id,
    required DateTime timestamp,
    required String title,
    required String originalText,
    required String humanizedText,
    required TextAnalysisResult? analysisResult,
    required HumanizationResult humanizationResult,
  }) = _HistoryItem;

  factory HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);

  const HistoryItem._();

  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  String get shortPreview {
    const maxLength = 100;
    if (humanizedText.length <= maxLength) return humanizedText;
    return '${humanizedText.substring(0, maxLength)}...';
  }
}
