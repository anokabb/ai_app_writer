import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/export/data/models/export_options.dart';
import 'package:phrasly_ai_tools/src/features/export/data/services/export_service.dart';

class ExportModal {
  static void show(
    BuildContext context, {
    required String text,
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
                    Icons.file_download,
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
                        'Export Text',
                        style: context.theme.appTextTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Choose how to export your text',
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

            // Export options
            ...ExportOptions.allOptions.map(
              (option) => _ExportOption(
                option: option,
                text: text,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExportOption extends StatefulWidget {
  final ExportOptions option;
  final String text;
  final Color? color;
  const _ExportOption({required this.option, required this.text, required this.color});

  @override
  State<_ExportOption> createState() => _ExportOptionState();
}

class _ExportOptionState extends State<_ExportOption> {
  late final Color? color = widget.color;
  late final ExportOptions option = widget.option;
  late final String text = widget.text;
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
            await ExportService.exportText(
              text: text,
              type: option.type,
            );
            setState(() => isLoading = false);
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
                          child: Text(
                            option.label,
                            style: context.theme.appTextTheme.subtitle3,
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
