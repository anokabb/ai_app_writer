import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class MainTextField extends StatefulWidget {
  final TextEditingController controller;
  final double? height;
  final Color? primaryColor;
  const MainTextField({super.key, required this.controller, this.height, this.primaryColor});

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
        height: widget.height ?? context.height * 0.4,
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
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return '*';
                }
                return null;
              },
              textAlign: TextAlign.left,
              expands: true,
              style: context.appTextTheme.body3.copyWith(
                color: context.appColors.textColor,
              ),
              decoration: InputDecoration(
                hintText: 'Enter your text here...',
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
