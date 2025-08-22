import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/default_layout.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';

class DocumentsPage extends StatelessWidget {
  static const String routeName = '/documents';
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: context.localization.documents,
      child: Center(
        child: Text(context.localization.documents),
      ),
    );
  }
}