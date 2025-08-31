import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/writer/data/models/text_analysis_model.dart';

class AnalysisResultModal {
  static void show(
    BuildContext context, {
    required TextAnalysisResult result,
    required String scannedText,
    required VoidCallback onHumanize,
  }) {
    FocusScope.of(context).unfocus();
    SlideUpPopUp.show(
      context: context,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getSourceColor(result.source).withValues(alpha: 0.1),
                  ),
                  child: Center(
                    child: Text(
                      '${result.aiPercentage}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _getSourceColor(result.source),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Title and summary
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        result.displayTitle,
                        style: context.theme.appTextTheme.subtitle1,
                      ),
                      if (result.displaySummary?.isNotEmpty == true)
                        Text(
                          result.displaySummary!,
                          style: context.theme.appTextTheme.body2,
                        ),
                    ],
                  ),
                ),
                // Humanize button
              ],
            ),
            const SizedBox(height: 16),
            if (result.source == TextSource.ai || result.source == TextSource.mixed)
              ElevatedButton.icon(
                onPressed: () {
                  onHumanize();
                },
                icon: const Icon(Icons.school, size: 16),
                label: const Text('Humanize Text'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            const SizedBox(height: 16),

            // Scanned text with highlights
            if (result.highlightedSentences != null && result.highlightedSentences!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scanned Text:',
                    style: context.theme.appTextTheme.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: _buildHighlightedText(scannedText, result.highlightedSentences!, context),
                  ),
                ],
              ),

            const SizedBox(height: 16),

            // Explanation
            if (result.explanation != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Analysis:',
                    style: context.appTextTheme.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    result.explanation!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

            const SizedBox(height: 16),

            // Suggestions
            if (result.suggestions != null && result.suggestions!.isNotEmpty && result.source == TextSource.ai)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suggestions:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...result.suggestions!.map((suggestion) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ', style: TextStyle(color: Colors.grey[600])),
                            Expanded(child: Text(suggestion)),
                          ],
                        ),
                      )),
                ],
              ),
          ],
        ),
      ),
    );
  }

  static Color _getSourceColor(TextSource source) {
    switch (source) {
      case TextSource.ai:
        return Colors.red;
      case TextSource.human:
        return Colors.green;
      case TextSource.mixed:
        return Colors.orange;
    }
  }

  static Widget _buildHighlightedText(String fullText, List<String> highlightedSentences, BuildContext context) {
    if (highlightedSentences.isEmpty) {
      return Text(
        fullText,
        style: context.theme.appTextTheme.body2,
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
            style: context.theme.appTextTheme.body2,
          ));
        }

        // Add the highlighted part
        textSpans.add(TextSpan(
          text: currentText.substring(index, index + trimmedHighlighted.length),
          style: context.theme.appTextTheme.body2.copyWith(
            backgroundColor: Colors.red.withValues(alpha: 0.3),
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
        style: context.theme.appTextTheme.body2,
      ));
    }

    // If no highlighting was applied, fall back to simple text
    if (textSpans.isEmpty) {
      return Text(
        fullText,
        style: context.theme.appTextTheme.body2,
      );
    }

    return RichText(
      text: TextSpan(
        style: context.theme.appTextTheme.body2,
        children: textSpans,
      ),
    );
  }
}
