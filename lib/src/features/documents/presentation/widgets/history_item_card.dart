import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/extensions/extensions.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/documents/data/models/history_item.dart';

class HistoryItemCard extends StatelessWidget {
  final HistoryItem item;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const HistoryItemCard({
    super.key,
    required this.item,
    required this.onTap,
    this.onDelete,
  });

  Color _getTypeColor(HistoryItemType type) {
    switch (type) {
      case HistoryItemType.humanized:
        return Colors.green;
      case HistoryItemType.generated:
        return Colors.blue;
    }
  }

  String _getTypeLabel(HistoryItemType type) {
    switch (type) {
      case HistoryItemType.humanized:
        return 'Humanized';
      case HistoryItemType.generated:
        return 'Generated';
    }
  }

  IconData _getTypeIcon(HistoryItemType type) {
    switch (type) {
      case HistoryItemType.humanized:
        return Icons.person;
      case HistoryItemType.generated:
        return Icons.auto_awesome;
    }
  }

  /// Generate a fallback title when AI title is not available
  String _generateFallbackTitle(HistoryItem item) {
    final prefix = item.type == HistoryItemType.humanized ? 'Humanized' : 'Generated';
    final content = item.type == HistoryItemType.humanized ? (item.humanizedText ?? '') : (item.generatedContent ?? '');

    if (content.isEmpty) return '$prefix Content';

    // Take first few meaningful words for the title
    final words = content.split(' ').where((word) => word.length > 2).take(4).join(' ');
    if (words.isEmpty) return '$prefix Content';

    final title = '$prefix: $words';
    return title.length > 50 ? '${title.substring(0, 47)}...' : title;
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      radius: 10,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with title, time, and more menu
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with overflow ellipsis
                      Text(
                        item.formattedTitle,
                        style: context.appTextTheme.subtitle3.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Time ago
                      Text(
                        item.formattedDate,
                        style: context.appTextTheme.body3Light.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Content type indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getTypeColor(item.type).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getTypeIcon(item.type),
                    size: 12,
                    color: _getTypeColor(item.type).withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _getTypeLabel(item.type),
                    style: TextStyle(
                      fontSize: 10,
                      color: _getTypeColor(item.type).withValues(alpha: 0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Tags row
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      // Type of writing tag (for generated content)
                      if (item.type == HistoryItemType.generated && item.typeOfWriting != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.typeOfWriting!.enumCapitalize(),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.orange[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      // Tone tag (for generated content)
                      if (item.type == HistoryItemType.generated && item.tone != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.purple.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.tone!.enumCapitalize(),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.purple[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      // Word count tag (for generated content)
                      if (item.type == HistoryItemType.generated && item.wordCount != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.indigo.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${item.wordCount} words',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.indigo[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      // Language tag
                      if (item.language != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.teal.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.language!,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.teal[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      // Human-like percentage tag (for humanized content)
                      if (item.type == HistoryItemType.humanized && item.humanizationResult != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${(item.humanizationResult!.humanLike * 100).toStringAsFixed(0)}% human',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      // AI percentage tag (if analysis available)
                      if (item.analysisResult != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${((1 - item.humanizationResult!.humanLike) * 100).toStringAsFixed(0)}% AI',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (onDelete != null)
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'delete') {
                        _showDeleteConfirmDialog(context);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red, size: 16),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                    child: const Icon(Icons.more_vert, size: 20),
                  ),
              ],
            ),
          ],
        ),
      ),
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

  void _showDeleteConfirmDialog(BuildContext context) {
    SlideUpPopUp.show(
      context: context,
      itemBuilder: (dialogContext) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delete Document', style: context.appTextTheme.subtitle1),
            Text(
              'Are you sure you want to delete this document? This action cannot be undone.',
              style: context.appTextTheme.body2Light,
            ),
            const SizedBox(height: 20),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: GradientButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    label: 'Cancel',
                    gradientColors: [],
                    forceButtonColor: context.appColors.secondary,
                    textColor: context.appColors.onSecondary,
                  ),
                ),
                Expanded(
                  child: GradientButton(
                    onPressed: () {
                      onDelete?.call();
                      Navigator.of(dialogContext).pop();
                    },
                    label: 'Delete',
                    gradientColors: [],
                    forceButtonColor: context.appColors.error,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
