import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/features/documents/data/models/history_item.dart';
import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_state.dart';
import 'package:flutter_app_template/src/features/documents/presentation/widgets/history_details_modal.dart';
import 'package:flutter_app_template/src/features/documents/presentation/widgets/history_item_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    HistoryDetailsModal.show(context, item: item);
  }

  void _showClearConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear History'),
        content: const Text('Are you sure you want to clear all history? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _historyCubit.clearHistory();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _historyCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Humanization History'),
          forceMaterialTransparency: true,
          actions: [
            BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                  loaded: (items) => items.isNotEmpty
                      ? IconButton(
                          onPressed: _showClearConfirmDialog,
                          icon: const Icon(Icons.delete_sweep),
                          tooltip: 'Clear All History',
                        )
                      : const SizedBox.shrink(),
                  error: (_) => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (items) {
                if (items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No History Yet',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Humanized texts will appear here',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[500],
                              ),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => _historyCubit.loadHistory(),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    padding: const EdgeInsets.all(16),
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
              error: (error) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 80,
                      color: Colors.red[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error Loading History',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.red[600],
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.message,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.red[500],
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _historyCubit.loadHistory(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
