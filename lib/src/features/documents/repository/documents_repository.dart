import 'dart:convert';

import 'package:flutter_app_template/src/core/constants/hive_config.dart';
import 'package:flutter_app_template/src/features/documents/models/document_model.dart';
import 'package:uuid/uuid.dart';

abstract class DocumentsRepository {
  Future<AppDocument> create({required String title, required String feature, required String content, required Map<String, dynamic> settings});
  Future<void> update(AppDocument doc);
  Future<void> delete(String id);
  Future<AppDocument?> getById(String id);
  Future<List<AppDocument>> getRecent({int limit = 10, int offset = 0});
}

class DocumentsRepositoryHive implements DocumentsRepository {
  static const String boxKey = 'documents';

  @override
  Future<AppDocument> create({required String title, required String feature, required String content, required Map<String, dynamic> settings}) async {
    final id = const Uuid().v4();
    final now = DateTime.now();
    final doc = AppDocument(
      id: id,
      title: title,
      feature: feature,
      createdAt: now,
      updatedAt: now,
      content: content,
      settings: AppDocumentSettingsSnapshot(data: settings),
      exports: const [],
    );
    final list = _loadAll();
    list.insert(0, doc);
    await _saveAll(list);
    return doc;
  }

  @override
  Future<void> update(AppDocument doc) async {
    final list = _loadAll();
    final idx = list.indexWhere((d) => d.id == doc.id);
    if (idx >= 0) {
      list[idx] = doc;
      await _saveAll(list);
    }
  }

  @override
  Future<void> delete(String id) async {
    final list = _loadAll();
    list.removeWhere((d) => d.id == id);
    await _saveAll(list);
  }

  @override
  Future<AppDocument?> getById(String id) async {
    final list = _loadAll();
    return list.where((d) => d.id == id).cast<AppDocument?>().firstWhere((_) => true, orElse: () => null);
  }

  @override
  Future<List<AppDocument>> getRecent({int limit = 10, int offset = 0}) async {
    final list = _loadAll();
    list.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    final end = (offset + limit) > list.length ? list.length : (offset + limit);
    return list.sublist(offset, end);
  }

  List<AppDocument> _loadAll() {
    final raw = persistsData.get(boxKey, defaultValue: '[]') as String;
    final list = (json.decode(raw) as List).map((e) => AppDocument.fromJson(e as Map<String, dynamic>)).toList();
    return list;
  }

  Future<void> _saveAll(List<AppDocument> docs) async {
    final raw = json.encode(docs.map((e) => e.toJson()).toList());
    await persistsData.put(boxKey, raw);
  }
}