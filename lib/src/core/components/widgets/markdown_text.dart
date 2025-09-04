import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';

class MarkdownText extends StatelessWidget {
  final String data;
  final TextStyle? baseStyle;
  final bool selectable;
  final ScrollController? controller;
  final bool shrinkWrap;
  final bool physics;
  final VoidCallback? onTap;
  final bool showCodeBackground;
  final Color? codeBackgroundColor;
  final Color? blockquoteColor;
  final Color? linkColor;
  final double? textScaleFactor;

  const MarkdownText({
    super.key,
    required this.data,
    this.baseStyle,
    this.selectable = false,
    this.controller,
    this.shrinkWrap = false,
    this.physics = true,
    this.onTap,
    this.showCodeBackground = true,
    this.codeBackgroundColor,
    this.blockquoteColor,
    this.linkColor,
    this.textScaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = baseStyle ?? context.appTextTheme.body3;
    final defaultCodeBackground = codeBackgroundColor ?? Utils.hexToColor('#F5F5F5');
    final defaultBlockquoteColor = blockquoteColor ?? Colors.grey[600]!;
    final defaultLinkColor = linkColor ?? context.theme.appColors.primary;

    final markdownStyle = MarkdownStyleSheet(
      // Base paragraph style
      p: defaultStyle,

      // Headings
      h1: defaultStyle.copyWith(
        fontSize: defaultStyle.fontSize! * 1.8,
        fontWeight: FontWeight.bold,
      ),
      h2: defaultStyle.copyWith(
        fontSize: defaultStyle.fontSize! * 1.6,
        fontWeight: FontWeight.bold,
      ),
      h3: defaultStyle.copyWith(
        fontSize: defaultStyle.fontSize! * 1.4,
        fontWeight: FontWeight.bold,
      ),
      h4: defaultStyle.copyWith(
        fontSize: defaultStyle.fontSize! * 1.2,
        fontWeight: FontWeight.bold,
      ),
      h5: defaultStyle.copyWith(
        fontSize: defaultStyle.fontSize! * 1.1,
        fontWeight: FontWeight.bold,
      ),
      h6: defaultStyle.copyWith(
        fontSize: defaultStyle.fontSize! * 1.05,
        fontWeight: FontWeight.bold,
      ),

      // Text formatting
      strong: defaultStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
      em: defaultStyle.copyWith(
        fontStyle: FontStyle.italic,
      ),

      // Code blocks
      code: defaultStyle.copyWith(
        backgroundColor: showCodeBackground ? defaultCodeBackground : null,
        fontFamily: 'monospace',
        fontSize: defaultStyle.fontSize! * 0.9,
      ),

      // Blockquotes
      blockquote: defaultStyle.copyWith(
        color: defaultBlockquoteColor,
        fontStyle: FontStyle.italic,
      ),

      // Lists
      listBullet: defaultStyle,
      listIndent: 20.0,

      // Links
      a: defaultStyle.copyWith(
        color: defaultLinkColor,
        decoration: TextDecoration.underline,
      ),

      // Tables
      tableHead: defaultStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
      tableBody: defaultStyle,

      // Horizontal rule
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),

      // Spacing
      blockSpacing: 8.0,

      // Text scale
      textScaleFactor: textScaleFactor ?? 1.0,
    );

    Widget markdownWidget = MarkdownBody(
      data: data,
      styleSheet: markdownStyle,
      selectable: selectable,
      shrinkWrap: shrinkWrap,
    );

    // Wrap with container if height or background is specifie
    // Wrap with scrollable container if controller is provided
    if (controller != null) {
      markdownWidget = SingleChildScrollView(
        controller: controller,
        physics: physics ? null : const NeverScrollableScrollPhysics(),
        child: markdownWidget,
      );
    }

    // Wrap with gesture detector if onTap is provided
    if (onTap != null) {
      markdownWidget = GestureDetector(
        onTap: onTap,
        child: markdownWidget,
      );
    }

    return SingleChildScrollView(
      child: markdownWidget,
    );
  }
}
