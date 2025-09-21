import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_icon_button.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_bottom_nav.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/documents/data/models/history_item.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_state.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/widgets/history_item_card.dart';
import 'package:phrasly_ai_tools/src/features/generator/presentation/pages/generator_detail_page.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/presentation/pages/humanizer_detail_page.dart';

class DocumentsPage extends StatefulWidget {
  static const String routeName = '/documents';

  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  late final HistoryCubit _historyCubit = locator<HistoryCubit>();

  @override
  void initState() {
    super.initState();
    _historyCubit.loadHistory();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showHistoryDetails(HistoryItem item) {
    if (item.type == HistoryItemType.generated && item.generatorResult != null) {
      context.push(GeneratorDetailPage.routeName, extra: item);
      return;
    }
    if (item.type == HistoryItemType.humanized && item.humanizationResult != null) {
      context.push(HumanizerDetailPage.routeName, extra: item);
    }
  }

  void _showClearConfirmDialog() {
    SlideUpPopUp.show(
      context: context,
      itemBuilder: (dialogContext) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delete All Documents', style: context.appTextTheme.subtitle1),
            Text(
              'Are you sure you want to delete all documents? This action cannot be undone.',
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
                    isAsync: true,
                    onPressed: () async {
                      await _historyCubit.clearHistory();
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _historyCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'History',
            style: context.appTextTheme.subtitle1,
          ),
          forceMaterialTransparency: true,
          centerTitle: false,
          actions: [
            BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                  loaded: (items) => items.isNotEmpty
                      ? AppIconButton(
                          onPressed: _showClearConfirmDialog,
                          icon: Text(
                            'Clear All',
                            style: context.appTextTheme.subtitle3.copyWith(
                              color: context.appColors.error,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  error: (_) => const SizedBox.shrink(),
                );
              },
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            Widget noDataWidget = Padding(
              padding: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: Center(
                  child: Text(
                    'No documents yet,\nGenerate content or humanize text with AI.',
                    textAlign: TextAlign.center,
                    style: context.appTextTheme.body3Light,
                  ),
                ),
              ),
            );
            return state.maybeWhen(
              initial: () => const Center(child: CircularProgressIndicator.adaptive()),
              loading: () => const Center(child: CircularProgressIndicator.adaptive()),
              orElse: () => noDataWidget,
              loaded: (items) {
                if (items.isEmpty) {
                  return noDataWidget;
                }

                return RefreshIndicator.adaptive(
                  onRefresh: () async => await _historyCubit.loadHistory(),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    padding: AppBottomNavigationBar.scrollViewPadding,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return HistoryItemCard(
                        item: item,
                        onTap: () => _showHistoryDetails(item),
                        onDelete: () => _historyCubit.deleteHistoryItem(item.id),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
