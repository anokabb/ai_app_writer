import 'dart:developer';

import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/documents/data/models/history_item.dart';
import 'package:flutter_app_template/src/features/documents/data/repos/history_repo.dart';
import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepo _historyRepo;

  HistoryCubit(this._historyRepo) : super(const HistoryState.initial());

  Future<void> loadHistory() async {
    emit(const HistoryState.loading());

    try {
      final history = await _historyRepo.getHistory();
      emit(HistoryState.loaded(history));
    } catch (e) {
      emit(HistoryState.error(AppError.fromException(e)));
    }
  }

  Future<void> addHistoryItem(HistoryItem item) async {
    try {
      await _historyRepo.addHistoryItem(item);
      // Reload history to update the UI
      await loadHistory();
    } catch (e) {
      // Don't emit error for adding items, just silently fail
      log('Error adding history item: $e');
    }
  }

  Future<void> deleteHistoryItem(String id) async {
    try {
      await _historyRepo.deleteHistoryItem(id);
      // Reload history to update the UI
      await loadHistory();
    } catch (e) {
      emit(HistoryState.error(AppError.fromException(e)));
    }
  }

  Future<void> clearHistory() async {
    try {
      await _historyRepo.clearHistory();
      emit(const HistoryState.loaded([]));
    } catch (e) {
      emit(HistoryState.error(AppError.fromException(e)));
    }
  }

  Future<HistoryItem?> getHistoryItem(String id) async {
    try {
      return await _historyRepo.getHistoryItem(id);
    } catch (e) {
      return null;
    }
  }
}
