import 'dart:convert';

import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/services/logger/logger.dart';
import 'package:phrasly_ai_tools/src/features/documents/data/models/history_item.dart';

class HistoryRepo {
  static const String _historyKey = 'humanization_history';

  final _logger = getLogger('HistoryRepo');

  Future<List<HistoryItem>> getHistory() async {
    _logger.d('Getting history');
    try {
      final historyData = cacheBox.get(_historyKey, defaultValue: <String>[]) as List;
      _logger.d('History data: $historyData');

      final history = historyData
          .cast<String>()
          .map((jsonString) {
            try {
              final json = jsonDecode(jsonString) as Map<String, dynamic>;
              return HistoryItem.fromJson(json);
            } catch (e) {
              return null;
            }
          })
          .where((item) => item != null)
          .cast<HistoryItem>()
          .toList();

      // Sort by timestamp (newest first)
      history.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      return history;
    } catch (e) {
      return [];
    }
  }

  Future<void> addHistoryItem(HistoryItem item) async {
    _logger.d('Adding history item: $item');
    try {
      final currentHistory = await getHistory();

      // Add new item at the beginning
      currentHistory.insert(0, item);

      // Keep only the last 100 items to prevent storage issues
      if (currentHistory.length > 100) {
        currentHistory.removeRange(100, currentHistory.length);
      }

      // Convert to JSON strings
      final historyJsonList = currentHistory.map((item) => jsonEncode(item.toJson())).toList();

      await cacheBox.put(_historyKey, historyJsonList);
      _logger.d('History item added: $item');
    } catch (e) {
      // Silently fail to avoid breaking the main flow
      _logger.e('Error saving history item: $e');
    }
  }

  Future<void> deleteHistoryItem(String id) async {
    try {
      final currentHistory = await getHistory();
      currentHistory.removeWhere((item) => item.id == id);

      // Convert to JSON strings
      final historyJsonList = currentHistory.map((item) => jsonEncode(item.toJson())).toList();

      await cacheBox.put(_historyKey, historyJsonList);
    } catch (e) {
      _logger.e('Error deleting history item: $e');
    }
  }

  Future<void> clearHistory() async {
    try {
      await cacheBox.delete(_historyKey);
    } catch (e) {
      _logger.e('Error clearing history: $e');
    }
  }

  Future<HistoryItem?> getHistoryItem(String id) async {
    try {
      final history = await getHistory();
      return history.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
}
