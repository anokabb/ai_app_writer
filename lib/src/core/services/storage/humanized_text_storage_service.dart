import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';

/// Service to store and retrieve AI detection results for humanized text.
/// This allows us to cache detection results and avoid redundant API calls
/// when users run detection on previously humanized text.
class HumanizedTextStorageService {
  /// Generate a hash key from the text to use as Hive key (max 255 chars)
  static String _generateKey(String text) {
    final trimmedText = text.trim();
    // Use SHA-256 to generate a consistent hash key
    final bytes = utf8.encode(trimmedText);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  /// Store the humanized text and its human detection percentage
  /// This is called after running detection on humanized text
  static Future<void> saveDetectionResult({
    required String humanizedText,
    required double humanPercentage,
  }) async {
    final trimmedText = humanizedText.trim();
    final key = _generateKey(trimmedText);
    log('HumanizedTextStorageService - saveDetectionResult key: $key, humanPercentage: $humanPercentage');

    final data = {
      'text': trimmedText,
      'humanPercentage': humanPercentage,
      'timestamp': DateTime.now().toIso8601String(),
    };

    await aiResultBox.put(key, jsonEncode(data));
  }

  /// Check if we have a stored detection result for this text
  /// Returns the cached human percentage if found, null otherwise
  static double? getCachedHumanPercentage(String text) {
    final key = _generateKey(text);
    log('HumanizedTextStorageService - getCachedHumanPercentage key: $key');
    final stored = aiResultBox.get(key);

    if (stored == null) {
      log('HumanizedTextStorageService - No cached result found');
      return null;
    }

    try {
      final data = jsonDecode(stored) as Map<String, dynamic>;
      final humanPercentage = data['humanPercentage'] as double;
      final timestamp = data['timestamp'] as String?;

      log('HumanizedTextStorageService - Found cached result: $humanPercentage% human (saved at: $timestamp)');
      return humanPercentage;
    } catch (e) {
      log('HumanizedTextStorageService - Error reading cached result: $e');
      return null;
    }
  }

  /// Clear a specific cached result
  static Future<void> clearCachedResult(String text) async {
    final key = _generateKey(text);
    await aiResultBox.delete(key);
    log('HumanizedTextStorageService - Cleared cached result for key: $key');
  }

  /// Clear all cached detection results
  static Future<void> clearAllCachedResults() async {
    await aiResultBox.clear();
    log('HumanizedTextStorageService - Cleared all cached results');
  }

  /// Check if a result is cached for the given text
  static bool hasCachedResult(String text) {
    final key = _generateKey(text);
    return aiResultBox.containsKey(key);
  }
}
