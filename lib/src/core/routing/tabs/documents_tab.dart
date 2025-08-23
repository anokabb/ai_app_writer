import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/src/features/documents/presentation/pages/documents_page.dart';
import 'package:go_router/go_router.dart';

final documentsTabBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: DocumentsPage.routeName,
      pageBuilder: (context, state) => const CupertinoPage(child: DocumentsPage()),
      routes: [
      ],
    ),
  ],
);