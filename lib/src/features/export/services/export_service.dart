import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

enum ExportFormat { txt, md, pdf, rtf }

class ExportResult {
  final File file;
  const ExportResult(this.file);
}

abstract class ExportService {
  Future<void> copyToClipboard(String text);
  Future<void> shareText(String text, {String? suggestedName, ExportFormat format});
  Future<ExportResult> exportToFile(String feature, String slug, String text, ExportFormat format);
}

class ExportServiceImpl implements ExportService {
  @override
  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Future<void> shareText(String text, {String? suggestedName, ExportFormat format = ExportFormat.txt}) async {
    final name = suggestedName ?? 'document';
    final temp = await exportToFile('export', name, text, format);
    await Share.shareXFiles([XFile(temp.file.path)]);
  }

  @override
  Future<ExportResult> exportToFile(String feature, String slug, String text, ExportFormat format) async {
    final dir = await getApplicationDocumentsDirectory();
    final ts = DateFormat('yyyyMMdd-HHmm').format(DateTime.now());
    final safeSlug = slug.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-').replaceAll(RegExp(r'-+'), '-').replaceAll(RegExp(r'^-|-
$'), '');
    final filename = '$feature-$safeSlug-$ts.${_ext(format)}';
    final file = File('${dir.path}/$filename');

    switch (format) {
      case ExportFormat.txt:
      case ExportFormat.md:
      case ExportFormat.rtf:
        await file.writeAsString(text);
        break;
      case ExportFormat.pdf:
        final doc = pw.Document();
        doc.addPage(pw.Page(build: (context) => pw.Text(text)));
        final bytes = await doc.save();
        await file.writeAsBytes(bytes);
        break;
    }
    return ExportResult(file);
  }

  String _ext(ExportFormat f) {
    switch (f) {
      case ExportFormat.txt:
        return 'txt';
      case ExportFormat.md:
        return 'md';
      case ExportFormat.pdf:
        return 'pdf';
      case ExportFormat.rtf:
        return 'rtf';
    }
  }
}