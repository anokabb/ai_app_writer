import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class RecentDocumentsSection extends StatelessWidget {
  const RecentDocumentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          'Recent Documents',
          style: context.appTextTheme.title5,
        ),
        _RecentDocumentsItem(
          title: 'Document 1',
          onPressed: () {
            // TODO: Implement Content Generator navigation
          },
        ),
        _RecentDocumentsItem(
          title: 'Document 2',
          onPressed: () {
            // TODO: Implement AI Humanizer navigation
          },
        ),
        _RecentDocumentsItem(
          title: 'Document 3',
          onPressed: () {
            // TODO: Implement AI Detector navigation
          },
        ),
      ],
    );
  }
}

class _RecentDocumentsItem extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const _RecentDocumentsItem({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AppCard(
        child: Row(
          children: [
            Text(title),
          ],
        ),
      ),
    );
  }
}
