import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText({super.key, required this.fullText, required this.highlightedSentences});
  final String fullText;
  final List<String> highlightedSentences;

  @override
  Widget build(BuildContext context) {
    if (highlightedSentences.isEmpty) {
      return Text(
        fullText,
        style: context.theme.appTextTheme.body3,
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
            style: context.theme.appTextTheme.body3,
          ));
        }

        // Add the highlighted part
        textSpans.add(TextSpan(
          text: currentText.substring(index, index + trimmedHighlighted.length),
          style: context.theme.appTextTheme.body3.copyWith(
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
        style: context.theme.appTextTheme.body3,
      ));
    }

    // If no highlighting was applied, fall back to simple text
    if (textSpans.isEmpty) {
      return Text(
        fullText,
        style: context.theme.appTextTheme.body3,
      );
    }

    return RichText(
      text: TextSpan(
        style: context.theme.appTextTheme.body3,
        children: textSpans,
      ),
    );
  }
}
