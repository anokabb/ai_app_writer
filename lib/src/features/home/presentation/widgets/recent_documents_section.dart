import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/documents/data/models/history_item.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_state.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/widgets/history_item_card.dart';
import 'package:phrasly_ai_tools/src/features/generator/presentation/pages/generator_detail_page.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/presentation/pages/humanizer_detail_page.dart';

class RecentDocumentsSection extends StatelessWidget {
  const RecentDocumentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        List<HistoryItem> items = state.maybeWhen(
          orElse: () => [],
          loaded: (items) => items.take(5).toList(),
        );
        if (items.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'Recent Documents',
              style: context.appTextTheme.title5,
            ),
            ...items.map(
              (item) => HistoryItemCard(
                item: item,
                onTap: () {
                  if (item.type == HistoryItemType.generated && item.generatorResult != null) {
                    context.push(GeneratorDetailPage.routeName, extra: item);
                    return;
                  }
                  if (item.type == HistoryItemType.humanized && item.humanizationResult != null) {
                    context.push(HumanizerDetailPage.routeName, extra: item);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
