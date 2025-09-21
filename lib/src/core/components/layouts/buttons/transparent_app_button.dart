import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_button.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

class TransparentButton extends StatefulWidget {
  final Color primaryColor;
  final String title;
  final String icon;
  final Function() onTap;
  final bool isAsync;
  const TransparentButton({
    super.key,
    required this.primaryColor,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isAsync = false,
  });

  @override
  State<TransparentButton> createState() => _TransparentButtonState();
}

class _TransparentButtonState extends State<TransparentButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AppCupertinoButton(
      onTap: widget.isAsync
          ? () async {
              if (isLoading) return;
              setState(() => isLoading = true);
              try {
                await widget.onTap();
              } catch (e) {
                log(e.toString());
              }
              setState(() => isLoading = false);
            }
          : widget.onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ButtonProgressIndicator(
                  height: 40,
                  color: widget.primaryColor,
                ),
              )
            : Row(
                children: <Widget>[
                  SvgPicture.asset(
                    widget.icon,
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(widget.primaryColor, BlendMode.srcIn),
                  ),
                  SizedBox(width: 4),
                  Text(
                    widget.title,
                    style: context.appTextTheme.subtitle3.copyWith(color: widget.primaryColor),
                  ),
                ],
              ),
      ),
    );
  }
}
