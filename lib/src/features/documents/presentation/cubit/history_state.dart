import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/documents/data/models/history_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = HistoryStateInitial;
  const factory HistoryState.loading() = HistoryStateLoading;
  const factory HistoryState.loaded(List<HistoryItem> items) = HistoryStateLoaded;
  const factory HistoryState.error(AppError error) = HistoryStateError;
}
