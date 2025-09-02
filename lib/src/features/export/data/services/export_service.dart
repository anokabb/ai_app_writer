import 'dart:convert';
import 'dart:io';

import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/export/data/models/export_options.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

class ExportService {
  static Future<void> exportText({
    required String text,
    required ExportType type,
  }) async {
    try {
      switch (type) {
        case ExportType.clipboard:
          await _copyToClipboard(text);
          break;
        case ExportType.share:
          await _shareText(text);
          break;
        case ExportType.document:
          await _saveAsDocument(text);
          break;
        case ExportType.pdf:
          await _exportAsPdf(text);
          break;
        case ExportType.print:
          await _printText(text);
          break;
      }
    } catch (e) {
      showTopError('Export failed: $e');
    }
  }

  static Future<void> _copyToClipboard(String text) async {
    Utils.copyToClipboard(text);
  }

  static Future<void> _shareText(String text) async {
    await Share.share(text);
  }

  static Future<void> _saveAsDocument(String text) async {
    try {
      // Get the documents directory
      final Directory documentsDirectory = await getApplicationDocumentsDirectory();

      // Create a safe filename
      final String fileName = 'humanized_text_${DateTime.now().millisecondsSinceEpoch}.docx';
      final File file = File('${documentsDirectory.path}/$fileName');

      // Write the text to the file as a simple .doc format with basic styling
      // Note: This creates a basic text file with .doc extension
      // For full Word document format, you'd need a library like docx
      final styledText = '''
<html>
<head>
<meta charset="utf-8">
<style>
body {
  font-family: 'Calibri', 'Arial', sans-serif;
  font-size: 11pt;
  line-height: 1.5;
  margin: 1in;
  color: #333333;
  background-color: #ffffff;
}
p {
  margin-bottom: 12pt;
  text-align: justify;
  padding: 0;
}
</style>
</head>
<body>
${text.split('\n').map((line) => line.isEmpty ? '<br>' : '<p>$line</p>').join('')}
</body>
</html>
''';

      await file.writeAsString(styledText, encoding: utf8);

      // Share the file
      await Share.shareXFiles(
        [XFile(file.path)],
        text: text,
      );
    } catch (e) {
      throw Exception('Failed to save document: $e');
    }
  }

  static Future<void> _exportAsPdf(String text) async {
    try {
      // Create PDF document
      final pdf = pw.Document();

      // Add page to PDF
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                pw.Text(
                  text,
                  style: const pw.TextStyle(
                    fontSize: 12,
                    lineSpacing: 1.5,
                  ),
                ),

                // Footer
              ],
            );
          },
        ),
      );

      // Get documents directory
      final Directory documentsDirectory = await getApplicationDocumentsDirectory();

      // Create filename
      final String fileName = 'humanized_text_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final File file = File('${documentsDirectory.path}/$fileName');

      // Save PDF to file
      await file.writeAsBytes(await pdf.save());

      // Share the PDF file
      await Share.shareXFiles(
        [XFile(file.path)],
        text: text,
      );
    } catch (e) {
      throw Exception('Failed to export PDF: $e');
    }
  }

  static Future<void> _printText(String text) async {
    try {
      // Create PDF document for printing
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Content
                pw.Text(
                  text,
                  style: const pw.TextStyle(
                    fontSize: 11,
                    lineSpacing: 1.4,
                  ),
                ),
              ],
            );
          },
        ),
      );

      // Print the PDF
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save(),
        name: 'humanized_text',
      );
    } catch (e) {
      throw Exception('Failed to print: $e');
    }
  }
}
