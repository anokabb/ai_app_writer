import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/documents/data/models/history_item.dart';
import 'package:flutter_app_template/src/features/export/presentation/widgets/export_modal.dart';
import 'package:flutter_app_template/src/features/writer/data/models/text_analysis_model.dart';

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          // Header
          Row(
            children: [
              if (item.analysisResult != null) ...[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getSourceColor(item.analysisResult!.source).withValues(alpha: 0.1),
                  ),
                  child: Center(
                    child: Text(
                      '${item.analysisResult!.aiPercentage}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _getSourceColor(item.analysisResult!.source),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.formattedDate,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Analysis Summary
          if (item.analysisResult != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.analytics, color: Colors.blue[600], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Analysis Results',
                        style: context.theme.appTextTheme.subtitle2.copyWith(
                          color: Colors.blue[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.analysisResult!.displayTitle,
                    style: context.theme.appTextTheme.body2.copyWith(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.analysisResult!.displaySummary ?? 'AI analysis completed',
                    style: context.theme.appTextTheme.body3.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 20),

          // Humanized Text Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.green[600], size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Humanized Text',
                      style: context.theme.appTextTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[600],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${(item.humanizationResult.humanLike * 100).toStringAsFixed(0)}% human-like',
                        style: context.theme.appTextTheme.body3.copyWith(
                          fontSize: 12,
                          color: Colors.green[700],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(item.humanizedText, style: context.theme.appTextTheme.body3),
                const SizedBox(height: 16),
                // Export button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ExportModal.show(
                        context,
                        text: item.humanizedText,
                        title: item.title,
                      );
                    },
                    icon: const Icon(Icons.share, size: 16),
                    label: const Text('Export Humanized Text'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

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
}
