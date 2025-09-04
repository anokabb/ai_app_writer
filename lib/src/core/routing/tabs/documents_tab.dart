import 'package:flutter/cupertino.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/pages/documents_page.dart';
import 'package:go_router/go_router.dart';

final documentsTabBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: DocumentsPage.routeName,
      pageBuilder: (context, state) => const CupertinoPage(child: DocumentsPage()),
      routes: [],
    ),
  ],
);
