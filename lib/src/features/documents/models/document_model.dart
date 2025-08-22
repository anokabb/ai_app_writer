class AppDocumentExportInfo {
  final String format; // txt, md, pdf, rtf
  final String path;
  final DateTime exportedAt;

  AppDocumentExportInfo({required this.format, required this.path, required this.exportedAt});

  Map<String, dynamic> toJson() => {
        'format': format,
        'path': path,
        'exportedAt': exportedAt.toIso8601String(),
      };

  factory AppDocumentExportInfo.fromJson(Map<String, dynamic> json) => AppDocumentExportInfo(
        format: json['format'] as String,
        path: json['path'] as String,
        exportedAt: DateTime.parse(json['exportedAt'] as String),
      );
}

class AppDocumentSettingsSnapshot {
  final Map<String, dynamic> data;
  AppDocumentSettingsSnapshot({required this.data});
  Map<String, dynamic> toJson() => data;
  factory AppDocumentSettingsSnapshot.fromJson(Map<String, dynamic> json) => AppDocumentSettingsSnapshot(data: json);
}

class AppDocument {
  final String id;
  final String title;
  final String feature; // humanizer, writer, detector
  final DateTime createdAt;
  final DateTime updatedAt;
  final String content;
  final AppDocumentSettingsSnapshot settings;
  final List<AppDocumentExportInfo> exports;

  AppDocument({
    required this.id,
    required this.title,
    required this.feature,
    required this.createdAt,
    required this.updatedAt,
    required this.content,
    required this.settings,
    required this.exports,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'feature': feature,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'content': content,
        'settings': settings.toJson(),
        'exports': exports.map((e) => e.toJson()).toList(),
      };

  factory AppDocument.fromJson(Map<String, dynamic> json) => AppDocument(
        id: json['id'] as String,
        title: json['title'] as String,
        feature: json['feature'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        content: json['content'] as String,
        settings: AppDocumentSettingsSnapshot.fromJson(json['settings'] as Map<String, dynamic>),
        exports: (json['exports'] as List?)?.map((e) => AppDocumentExportInfo.fromJson(e as Map<String, dynamic>)).toList() ?? [],
      );
}