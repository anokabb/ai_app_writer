import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class GradientButton extends StatefulWidget {
  final String? label;
  final Function() onPressed;
  final Function()? onDisabledPressed;
  final Widget? icon;
  final bool isAsync;
  final bool disabled;
  // final bool isExpanded;
  final EdgeInsetsGeometry? padding;
  final double height;
  final double? width;
  final double borderRadius;
  final Color? textColor;
  final Color? forceButtonColor;
  final TextStyle? textStyle;
  final bool isTextButton;
  final Alignment? alignment;
  final BorderSide borderSide;
  final bool? hasShadow;
  final bool autoResize;
  final Widget? customChild; // Add customChild property
  final bool isOutlined;
  final bool ignoreHeight;
  final TextAlign? textAlign;
  final List<Color> gradientColors;
  final bool expand;
  final bool isLoading;
  final Alignment? gradientBegin;
  final Alignment? gradientEnd;

  const GradientButton({
    super.key,
    this.label,
    required this.onPressed,
    this.onDisabledPressed,
    // this.isExpanded = true,
    this.disabled = false,
    this.autoResize = false,
    this.icon,
    this.borderRadius = 10,
    this.textStyle,
    this.textColor,
    this.forceButtonColor,
    this.isAsync = false,
    this.padding,
    this.height = 48,
    this.width,
    this.alignment,
    this.isTextButton = false,
    this.borderSide = BorderSide.none,
    this.hasShadow = false,
    this.customChild, // Initialize customChild
    this.isOutlined = false,
    this.ignoreHeight = false,
    this.textAlign,
    required this.gradientColors,
    this.expand = true,
    this.isLoading = false,
    this.gradientBegin,
    this.gradientEnd,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool isLoading = false;

  late final Color textColor = widget.textColor ?? context.theme.appColors.onPrimary;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: AppCupertinoButton(
        onTap: widget.disabled
            ? null
            : widget.isAsync
                ? () async {
                    if (isLoading || widget.isLoading) return;
                    setState(() => isLoading = true);
                    await widget.onPressed();
                    setState(() => isLoading = false);
                  }
                : widget.onPressed,
        child: Container(
          padding: widget.padding,
          width: widget.width ?? (widget.expand ? double.infinity : null),
          height: widget.ignoreHeight ? null : widget.height,
          decoration: BoxDecoration(
            color: widget.forceButtonColor,
            gradient: widget.forceButtonColor != null
                ? null
                : LinearGradient(
                    colors: widget.gradientColors,
                    begin: widget.gradientBegin ?? Alignment.centerLeft,
                    end: widget.gradientEnd ?? Alignment.centerRight,
                  ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: widget.hasShadow != null
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: isLoading || widget.isLoading
              ? _CircularProgressIndicator(height: widget.height, color: textColor)
              : widget.customChild ??
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: <Widget>[
                      widget.icon ?? SizedBox(),
                      Text(
                        widget.label ?? '',
                        textAlign: widget.textAlign ?? TextAlign.center,
                        style: widget.textStyle ?? context.theme.appTextTheme.subtitle2.copyWith(color: textColor),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}

class _CircularProgressIndicator extends StatelessWidget {
  final double height;
  final Color? color;
  final bool expand;

  const _CircularProgressIndicator({required this.height, this.color, this.expand = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expand ? double.infinity : 100,
      child: SizedBox(
        height: height * 0.4,
        width: height * 0.4,
        child: CupertinoActivityIndicator(
          color: color ?? context.theme.appColors.textColor,
        ),
      ),
    );
  }
}
