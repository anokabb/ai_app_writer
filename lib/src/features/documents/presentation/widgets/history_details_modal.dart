import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/extensions/extensions.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/documents/data/models/history_item.dart';
import 'package:phrasly_ai_tools/src/features/export/presentation/widgets/export_modal.dart';

class HistoryDetailsModal extends StatelessWidget {
  final HistoryItem item;

  const HistoryDetailsModal({
    super.key,
    required this.item,
  });

  static void show(BuildContext context, {required HistoryItem item}) {
    SlideUpPopUp.show(
      context: context,
      child: HistoryDetailsModal(item: item),
    );
  }

  Color _getSourceColor(TextSource source) {
    switch (source) {
      case TextSource.ai:
        return Colors.red;
      case TextSource.human:
        return Colors.green;
      case TextSource.mixed:
        return Colors.orange;
    }
  }

  Color _getTypeColor(HistoryItemType type) {
    switch (type) {
      case HistoryItemType.humanized:
        return Colors.green;
      case HistoryItemType.generated:
        return Colors.blue;
    }
  }

  Widget _buildHighlightedText(BuildContext context, String fullText, List<String> highlightedSentences) {
    if (highlightedSentences.isEmpty) {
      return Text(
        fullText,
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }

    // Simple approach: highlight each sentence that contains any highlighted phrase
    final List<TextSpan> textSpans = [];
    String currentText = fullText;

    for (final highlightedSentence in highlightedSentences) {
      final trimmedHighlighted = highlightedSentence.trim();
      if (trimmedHighlighted.isEmpty) continue;

      // Find the highlighted sentence in the text (case insensitive)
      final lowerText = currentText.toLowerCase();
      final lowerHighlighted = trimmedHighlighted.toLowerCase();
      final index = lowerText.indexOf(lowerHighlighted);

      if (index != -1) {
        // Add text before the highlighted part
        if (index > 0) {
          textSpans.add(TextSpan(
            text: currentText.substring(0, index),
            style: context.theme.appTextTheme.body3.copyWith(),
          ));
        }

        // Add the highlighted part
        textSpans.add(TextSpan(
          text: currentText.substring(index, index + trimmedHighlighted.length),
          style: context.theme.appTextTheme.body3.copyWith(
            backgroundColor: Colors.red.withValues(alpha: 0.3),
            fontWeight: FontWeight.w500,
          ),
        ));

        // Update current text to continue with remaining text
        currentText = currentText.substring(index + trimmedHighlighted.length);
      }
    }

    // Add any remaining text
    if (currentText.isNotEmpty) {
      textSpans.add(TextSpan(
        text: currentText,
        style: Theme.of(context).textTheme.bodyMedium,
      ));
    }

    // If no highlighting was applied, fall back to simple text
    if (textSpans.isEmpty) {
      return Text(
        fullText,
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }

    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: textSpans,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                item.type == HistoryItemType.humanized ? Icons.person : Icons.auto_awesome,
                color: _getTypeColor(item.type).withValues(alpha: 0.6),
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.displayTitle,
                      style: context.theme.appTextTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item.displaySubtitle,
                      style: context.theme.appTextTheme.body3.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getTypeColor(item.type).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.type == HistoryItemType.humanized ? 'Humanized' : 'Generated',
                  style: context.theme.appTextTheme.body3.copyWith(
                    fontSize: 12,
                    color: _getTypeColor(item.type).withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Content Section (Humanized or Generated)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getTypeColor(item.type).withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _getTypeColor(item.type).withValues(alpha: 0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      item.type == HistoryItemType.humanized ? Icons.person : Icons.auto_awesome,
                      color: _getTypeColor(item.type).withValues(alpha: 0.6),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.type == HistoryItemType.humanized ? 'Humanized Text' : 'Generated Content',
                      style: context.theme.appTextTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getTypeColor(item.type).withValues(alpha: 0.6),
                      ),
                    ),
                    const Spacer(),
                    if (item.type == HistoryItemType.humanized && item.humanizationResult != null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getTypeColor(item.type).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${(item.humanizationResult!.humanLike * 100).toStringAsFixed(0)}% human-like',
                          style: context.theme.appTextTheme.body3.copyWith(
                            fontSize: 12,
                            color: _getTypeColor(item.type).withValues(alpha: 0.7),
                          ),
                        ),
                      ),
                    ] else if (item.type == HistoryItemType.generated && item.wordCount != null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getTypeColor(item.type).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${item.wordCount} words',
                          style: context.theme.appTextTheme.body3.copyWith(
                            fontSize: 12,
                            color: _getTypeColor(item.type).withValues(alpha: 0.7),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  item.type == HistoryItemType.humanized ? (item.humanizedText ?? '') : (item.generatedContent ?? ''),
                  style: context.theme.appTextTheme.body3,
                ),
                const SizedBox(height: 16),
                // Export button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final content = item.type == HistoryItemType.humanized
                          ? (item.humanizedText ?? '')
                          : (item.generatedContent ?? '');
                      ExportModal.show(
                        context,
                        text: content,
                      );
                    },
                    icon: const Icon(Icons.share, size: 16),
                    label: Text('Export ${item.type == HistoryItemType.humanized ? 'Humanized' : 'Generated'} Content'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getTypeColor(item.type),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Generation Details (for generated content)
          if (item.type == HistoryItemType.generated &&
              (item.typeOfWriting != null || item.tone != null || item.language != null)) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.indigo.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.settings, color: Colors.indigo[600], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Generation Details',
                        style: context.theme.appTextTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (item.typeOfWriting != null) ...[
                    _buildDetailRow('Type', item.typeOfWriting!.enumCapitalize()),
                  ],
                  if (item.tone != null) ...[
                    _buildDetailRow('Tone', item.tone!.enumCapitalize()),
                  ],
                  if (item.wordCount != null) ...[
                    _buildDetailRow('Word Count', '${item.wordCount} words'),
                  ],
                  if (item.language != null) ...[
                    _buildDetailRow('Language', item.language!),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],

          // Original Text Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.article, color: Colors.grey[600], size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Original Text',
                      style: context.theme.appTextTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildHighlightedText(
                  context,
                  item.originalText,
                  item.analysisResult?.highlightedSentences ?? [],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Analysis Details
          if (item.analysisResult?.explanation != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.insights, color: Colors.orange[600], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Analysis Details',
                        style: context.theme.appTextTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.analysisResult!.explanation ?? '',
                    style: context.theme.appTextTheme.body3.copyWith(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],

          // Suggestions
          if (item.analysisResult?.suggestions != null && item.analysisResult!.suggestions!.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.purple[600], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Suggestions',
                        style: context.theme.appTextTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...item.analysisResult!.suggestions!.map((suggestion) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ', style: TextStyle(color: Colors.purple[600])),
                            Expanded(
                              child: Text(
                                suggestion,
                                style: context.theme.appTextTheme.body3.copyWith(),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.indigo[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
