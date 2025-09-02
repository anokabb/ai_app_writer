import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCupertinoButton extends StatelessWidget {
  final Function()? onTap;
  final Widget child;

  const AppCupertinoButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Material(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
