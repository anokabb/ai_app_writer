import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/file_upload_util.dart';
import 'package:phrasly_ai_tools/src/core/utils/models/upload_options.dart';

class FileUploadModal {
  static void show(
    BuildContext context, {
    required Function(String text) onFileUploaded,
    VoidCallback? onError,
    Color? color,
  }) {
    FocusScope.of(context).unfocus();
    SlideUpPopUp.show(
      context: context,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (color ?? context.theme.primaryColor).withValues(alpha: 0.1),
                  ),
                  child: Icon(
                    Icons.upload,
                    color: color ?? context.theme.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload File',
                        style: context.theme.appTextTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Choose how to upload your content',
                        style: context.theme.appTextTheme.body3Light,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Upload options
            ...UploadOptions.allOptions.map(
              (option) => _UploadOption(
                option: option,
                onFileUploaded: onFileUploaded,
                onError: onError,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadOption extends StatefulWidget {
  final UploadOptions option;
  final Function(String text) onFileUploaded;
  final VoidCallback? onError;
  final Color? color;

  const _UploadOption({
    required this.option,
    required this.onFileUploaded,
    this.onError,
    this.color,
  });

  @override
  State<_UploadOption> createState() => _UploadOptionState();
}

class _UploadOptionState extends State<_UploadOption> {
  late final Color? color = widget.color;
  late final UploadOptions option = widget.option;
  late final Function(String text) onFileUploaded = widget.onFileUploaded;
  late final VoidCallback? onError = widget.onError;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: AppCupertinoButton(
          onTap: () async {
            if (isLoading) return;
            setState(() => isLoading = true);

            try {
              if (option.type == UploadType.image) {
                await FileUploadUtil.uploadImageAndExtractText(
                  onFileUploaded: onFileUploaded,
                  onError: onError,
                );
              } else if (option.type == UploadType.file) {
                await FileUploadUtil.uploadFileAndExtractText(
                  onFileUploaded: onFileUploaded,
                  onError: onError,
                );
              }
            } catch (e) {
              onError?.call();
            } finally {
              if (mounted) {
                setState(() => isLoading = false);
                Navigator.of(context).pop();
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: isLoading
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: (color ?? context.theme.primaryColor).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            option.icon,
                            color: (color ?? context.theme.primaryColor),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                option.label,
                                style: context.theme.appTextTheme.subtitle3,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                option.description,
                                style: context.theme.appTextTheme.body3Light.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[400],
                          size: 16,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
