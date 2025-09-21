import 'dart:developer';
import 'dart:io';

import 'package:doc_text_extractor/doc_text_extractor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

class FileUploadUtil {
  /// Uploads an image and extracts text from it using OCR
  /// Supports: JPG, PNG, BMP, WebP, TIFF
  /// Returns the extracted text via the onFileUploaded callback
  static Future<void> uploadImageAndExtractText({
    required Function(String text) onFileUploaded,
    VoidCallback? onError,
  }) async {
    try {
      // Pick image file
      XFile? result = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (result != null) {
        // Extract text from image using OCR
        String extractedText = await _extractTextFromImage(result.path);

        if (extractedText.isNotEmpty) {
          onFileUploaded(extractedText);
          Utils.showToast('Text extracted successfully!');
        } else {
          Utils.showToast('No text found in the selected image');
          onError?.call();
        }
      }
    } catch (e) {
      Utils.showToast(e is PlatformException ? e.message.toString() : 'Failed to upload image');
      onError?.call();
    }
  }

  /// Uploads a file and extracts text from it
  /// Supports: PDF, Text files, DOC/DOCX
  /// Returns the extracted text via the onFileUploaded callback
  static Future<void> uploadFileAndExtractText({
    required Function(String text) onFileUploaded,
    VoidCallback? onError,
  }) async {
    try {
      // Pick file with comprehensive file type support
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          // Document formats
          'pdf',
          'txt',
          // 'doc',
          'docx',
          'rtf',

          // Image formats
          'jpg',
          'jpeg',
          'png',
          'bmp',
          'webp',
          'tiff',
          'tif',
        ],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        log('file: ${file.path}');
        log('file: ${file.bytes}');

        if (file.path != null) {
          // Process the file based on its extension
          String extractedText = await _extractTextFromFile(file.path!, file.name);

          if (extractedText.isNotEmpty) {
            onFileUploaded(extractedText);
            Utils.showToast('Text extracted successfully!');
          } else {
            Utils.showToast('No text found in the selected file');
            onError?.call();
          }
        } else {
          Utils.showToast('Failed to read file');
          onError?.call();
        }
      }
    } catch (e) {
      Utils.showToast(e is PlatformException ? e.message.toString() : 'Failed to upload file');
      onError?.call();
    }
  }

  /// Extracts text from different file types
  static Future<String> _extractTextFromFile(String path, String name) async {
    String fileExtension = _getFileExtension(name).toLowerCase();

    switch (fileExtension) {
      case 'pdf':
        return await _extractTextFromPdf(path);
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'bmp':
      case 'webp':
      case 'tiff':
      case 'tif':
        return await _extractTextFromImage(path);
      case 'txt':
      case 'rtf':
        return await _extractTextFromTextFile(path, fileExtension);
      case 'csv':
        return await _extractTextFromCsvFile(path);
      case 'doc':
        return await _extractTextFromDoc(path);
      case 'docx':
        return await _extractTextFromDoc(path);
      default:
        throw PlatformException(message: 'Unsupported file type.', code: 'UNSUPPORTED_FILE_TYPE');
    }
  }

  /// Extracts text from PDF files using pdf package
  static Future<String> _extractTextFromPdf(String path) async {
    String text = "";
    try {
      text = await ReadPdfText.getPDFtext(path);
    } on PlatformException {
      print('Failed to get PDF text.');
    }
    return text;
  }

  // /// Extracts text from image files using Google ML Kit
  static Future<String> _extractTextFromImage(String path) async {
    try {
      File file = File(path);

      final textRecognizer = TextRecognizer();
      final inputImage = InputImage.fromFile(file);
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

      return recognizedText.text;
    } catch (e) {
      throw Exception('Failed to extract text from image: $e');
    }
  }

  static Future<String> _extractTextFromTextFile(String path, String fileExtension) async {
    try {
      File file = File(path);
      Uint8List bytes = await file.readAsBytes();
      String content = String.fromCharCodes(bytes);

      if (fileExtension == 'rtf') {
        // 1. Remove {\*\...} groups (hidden RTF groups)
        content = content.replaceAll(RegExp(r'{\\\*[^}]+}'), '');

        // 2. Remove all RTF control words (\word, \wordN)
        content = content.replaceAll(RegExp(r'\\[a-zA-Z]+\d* ?'), '');

        // 3. Remove braces { }
        content = content.replaceAll(RegExp(r'[{}]'), '');

        // 4. Remove font/color names and trailing semicolons
        content = content.replaceAll(RegExp(r'[A-Za-z0-9]+;'), '');

        // 5. Remove stray backslashes
        content = content.replaceAll(RegExp(r'\\'), '');

        // 6. Remove multiple semicolons ;;
        content = content.replaceAll(RegExp(r';+'), ' ');

        // 7. Collapse multiple spaces but KEEP line breaks
        content = content.replaceAll(RegExp(r'[ \t]+'), ' ').trim();
      }

      return content;
    } catch (e) {
      throw Exception('Failed to extract text from RTF file: $e');
    }
  }

  /// Extracts text from CSV files
  static Future<String> _extractTextFromCsvFile(String path) async {
    try {
      File file = File(path);
      Uint8List bytes = await file.readAsBytes();
      String csvContent = String.fromCharCodes(bytes);
      // Convert CSV to readable text format
      List<String> lines = csvContent.split('\n');
      StringBuffer result = StringBuffer();

      for (int i = 0; i < lines.length; i++) {
        String line = lines[i].trim();
        if (line.isNotEmpty) {
          // Replace commas with tabs for better readability
          String formattedLine = line.replaceAll(',', '\t');
          result.writeln('Row ${i + 1}: $formattedLine');
        }
      }

      return result.toString();
    } catch (e) {
      throw Exception('Failed to extract text from CSV: $e');
    }
  }

  static Future<String> _extractTextFromDoc(String path) async {
    try {
      final extractedText = await TextExtractor().extractText(path, isUrl: false);

      return extractedText.text;
    } catch (e) {
      log('Failed to extract text from doc file: $e');
      throw PlatformException(message: 'Failed to extract text from document.', code: 'FAILED_TO_EXTRACT_TEXT');
    }
  }

  /// Extracts text from DOC and DOCX files using doc_text package
  // static Future<String> _extractTextFromDocx(String path) async {
  //   try {
  //     File file = File(path);
  //     Uint8List bytes = await file.readAsBytes();

  //     // Use doc_text package to extract text
  //     String extractedText = TextExtractor().extractText('https://example.com/sample.doc');

  //     return extractedText;
  //   } catch (e) {
  //     log('Failed to extract text from doc or docx file: $e');
  //     throw PlatformException(message: 'Failed to extract text from file.', code: 'FAILED_TO_EXTRACT_TEXT');
  //   }
  // }

  /// Gets file extension from filename
  static String _getFileExtension(String filename) {
    return filename.split('.').last;
  }

  /// Shows file picker dialog with supported file types
  static Future<void> showFilePickerDialog({
    required BuildContext context,
    required Function(String text) onFileUploaded,
    VoidCallback? onError,
  }) async {
    await uploadFileAndExtractText(
      onFileUploaded: onFileUploaded,
      onError: onError,
    );
  }

  /// Validates if the selected file type is supported
  static bool isFileTypeSupported(String filename) {
    String extension = _getFileExtension(filename).toLowerCase();
    const supportedExtensions = [
      'pdf',
      'txt',
      'doc',
      'docx',
      'rtf',
      'jpg',
      'jpeg',
      'png',
      'gif',
      'bmp',
      'webp',
      'tiff',
      'tif',
      'xls',
      'xlsx',
      'csv',
      'ppt',
      'pptx',
      'odp',
    ];
    return supportedExtensions.contains(extension);
  }

  /// Gets human-readable file type description
  static String getFileTypeDescription(String filename) {
    String extension = _getFileExtension(filename).toLowerCase();

    switch (extension) {
      case 'pdf':
        return 'PDF Document';
      case 'txt':
        return 'Text File';
      case 'doc':
      case 'docx':
        return 'Word Document';
      case 'rtf':
        return 'Rich Text Format';
      case 'jpg':
      case 'jpeg':
        return 'JPEG Image';
      case 'png':
        return 'PNG Image';
      case 'gif':
        return 'GIF Image';
      case 'bmp':
        return 'Bitmap Image';
      case 'webp':
        return 'WebP Image';
      case 'tiff':
      case 'tif':
        return 'TIFF Image';
      case 'xls':
      case 'xlsx':
        return 'Excel Spreadsheet';
      case 'csv':
        return 'CSV File';
      case 'ppt':
      case 'pptx':
        return 'PowerPoint Presentation';
      case 'odp':
        return 'OpenDocument Presentation';
      default:
        return 'Unknown File Type';
    }
  }

  /// Gets the maximum file size limit (in MB)
  static double getMaxFileSizeMB() {
    return 50.0; // 50 MB limit
  }

  /// Validates file size
  static bool isFileSizeValid(int fileSizeInBytes) {
    double maxSizeInBytes = getMaxFileSizeMB() * 1024 * 1024;
    return fileSizeInBytes <= maxSizeInBytes;
  }

  /// Gets file size in human-readable format
  static String getFileSizeString(int fileSizeInBytes) {
    if (fileSizeInBytes < 1024) {
      return '$fileSizeInBytes B';
    } else if (fileSizeInBytes < 1024 * 1024) {
      return '${(fileSizeInBytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(fileSizeInBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }
}
