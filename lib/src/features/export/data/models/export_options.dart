import 'package:flutter/material.dart';

enum ExportType {
  clipboard,
  share,
  document,
  pdf,
  print,
}

class ExportOptions {
  final ExportType type;
  final String label;
  final IconData icon;

  const ExportOptions({
    required this.type,
    required this.label,
    required this.icon,
  });

  static const List<ExportOptions> allOptions = [
    ExportOptions(
      type: ExportType.clipboard,
      label: 'Copy to Clipboard',
      icon: Icons.copy,
    ),
    ExportOptions(
      type: ExportType.share,
      label: 'Share Text',
      icon: Icons.share,
    ),
    ExportOptions(
      type: ExportType.document,
      label: 'Save as Word Document',
      icon: Icons.description,
    ),
    ExportOptions(
      type: ExportType.pdf,
      label: 'Export as PDF',
      icon: Icons.picture_as_pdf,
    ),
    ExportOptions(
      type: ExportType.print,
      label: 'Print',
      icon: Icons.print,
    ),
  ];
}
