import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phrasly_ai_tools/src/core/extensions/extensions.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/models/generator_model.dart';

part 'gen/history_item.freezed.dart';
part 'gen/history_item.g.dart';

enum HistoryItemType {
  humanized,
  generated,
}

@freezed
class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    required String id,
    required DateTime timestamp,
    required String originalText,
    required HistoryItemType type,
    // Title field (AI-generated or fallback)
    String? title,
    // Humanization fields (optional for generated content)
    String? humanizedText,
    HumanizationResult? humanizationResult,
    // Generation fields (optional for humanized content)
    String? generatedContent,
    GeneratorModel? generatorResult,
    // Common fields
    TextAnalysisResult? analysisResult,
    String? typeOfWriting,
    String? tone,
    int? wordCount,
    String? language,
  }) = _HistoryItem;

  factory HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);

  const HistoryItem._();

  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'now';
    }

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
    final content = type == HistoryItemType.humanized ? humanizedText : generatedContent;
    if (content == null || content.length <= maxLength) return content ?? '';
    return '${content.substring(0, maxLength)}...';
  }

  String get displayTitle {
    switch (type) {
      case HistoryItemType.humanized:
        return 'Humanized Text';
      case HistoryItemType.generated:
        return 'Generated Content';
    }
  }

  String get displaySubtitle {
    switch (type) {
      case HistoryItemType.humanized:
        return 'AI Humanization';
      case HistoryItemType.generated:
        if (typeOfWriting != null && tone != null) {
          return '${typeOfWriting!.enumCapitalize()} • ${tone!.enumCapitalize()}';
        }
        return 'Content Generation';
    }
  }

  String get formattedTitle {
    return cleanTitle(type == HistoryItemType.generated ? generatedContent ?? '' : humanizedText ?? '');
  }

  static String cleanTitle(String rawTitle) {
    String title = rawTitle.trim();

    // Remove common prefixes that AI might still add
    title = title.replaceAll(RegExp('Title: ', caseSensitive: false), '');
    title = title.replaceAll(RegExp('Generated: ', caseSensitive: false), '');
    title = title.replaceAll(RegExp('Humanized: ', caseSensitive: false), '');

    // Remove quotes - use simpler approach
    if (title.startsWith('"') || title.startsWith("'")) {
      title = title.substring(1);
    }
    if (title.endsWith('"') || title.endsWith("'")) {
      title = title.substring(0, title.length - 1);
    }

    // Remove markdown formatting
    title = title.replaceAll(RegExp(r'\*\*.*?\*\*'), ''); // Remove **bold** text
    title = title.replaceAll(RegExp(r'\*.*?\*'), ''); // Remove *italic* text
    title = title.replaceAll(RegExp(r'`.*?`'), ''); // Remove `code` text

    // Clean up extra whitespace
    title = title.replaceAll(RegExp(r'\s+'), ' ').trim();

    return title;
  }
}
