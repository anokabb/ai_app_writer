import 'package:flutter/material.dart';

enum UploadType {
  image,
  file,
}

class UploadOptions {
  final UploadType type;
  final String label;
  final String description;
  final IconData icon;

  const UploadOptions({
    required this.type,
    required this.label,
    required this.description,
    required this.icon,
  });

  static const List<UploadOptions> allOptions = [
    UploadOptions(
      type: UploadType.image,
      label: 'Upload Image',
      description: 'Extract text from images using OCR',
      icon: Icons.image,
    ),
    UploadOptions(
      type: UploadType.file,
      label: 'Upload File',
      description: 'Extract text from documents (PDF, DOCX, TXT, etc.)',
      icon: Icons.upload_file,
    ),
  ];
}
