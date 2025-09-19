import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCupertinoButton extends StatefulWidget {
  final Function()? onTap;
  final Widget? child;
  final bool isAsync;
  final Widget? Function(bool isLoading)? loadingWidget;

  const AppCupertinoButton({
    super.key,
    required this.onTap,
    this.child,
    this.isAsync = false,
    this.loadingWidget,
  });

  @override
  State<AppCupertinoButton> createState() => _AppCupertinoButtonState();
}

class _AppCupertinoButtonState extends State<AppCupertinoButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.loadingWidget == null && widget.child == null) {
      throw Exception('child or loadingWidget must be provided');
    }
    return CupertinoButton(
      onPressed: widget.isAsync
          ? () async {
              if (isLoading) return;
              setState(() => isLoading = true);
              await widget.onTap?.call();
              setState(() => isLoading = false);
            }
          : widget.onTap,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Material(
        color: Colors.transparent,
        child: widget.loadingWidget?.call(isLoading) ?? widget.child,
      ),
    );
  }
}
