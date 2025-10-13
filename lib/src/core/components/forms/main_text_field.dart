import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

class MainTextField extends StatefulWidget {
  final TextEditingController controller;
  final double? height;
  final Color? primaryColor;
  final bool isMultiline;
  final String? hintText;
  final bool obscureText;
  final void Function(String)? onChanged;
  const MainTextField(
      {super.key,
      required this.controller,
      this.height,
      this.primaryColor,
      this.isMultiline = true,
      this.hintText,
      this.obscureText = false,
      this.onChanged});

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: widget.primaryColor ?? theme.primaryColor.withOpacity(0.9),
        ),
      ),
      child: Container(
        height: !widget.isMultiline ? null : (widget.height ?? context.height * 0.4),
        decoration: BoxDecoration(
          color: context.appColors.secondaryBackground,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            TextFormField(
              controller: widget.controller,
              maxLines: widget.isMultiline ? null : 1,
              expands: widget.isMultiline,
              textAlignVertical: TextAlignVertical.top,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return '*';
                }
                return null;
              },
              textAlign: TextAlign.left,
              style: context.appTextTheme.body3.copyWith(
                color: context.appColors.textColor,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText ?? 'Enter your text here...',
                hintStyle: context.appTextTheme.body3.copyWith(
                  color: context.appColors.lightTextColor,
                ),
                contentPadding: const EdgeInsets.all(10),
                errorStyle: TextStyle(fontSize: 0),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.primaryColor ?? theme.primaryColor.withOpacity(0.9),
                    width: 0.6,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.primaryColor ?? theme.primaryColor.withOpacity(0.9),
                    width: 0.6,
                  ),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
