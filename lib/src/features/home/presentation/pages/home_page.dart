// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_app_template/src/features/documents/repository/documents_repository.dart';
import 'package:flutter_app_template/src/features/documents/models/document_model.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final DocumentsRepository _docs = locator<DocumentsRepository>();
  List<AppDocument> _recent = [];

  @override
  void initState() {
    super.initState();
    _loadRecent();
  }

  Future<void> _loadRecent() async {
    final items = await _docs.getRecent(limit: 5);
    setState(() => _recent = items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phrasly AI')),
      body: RefreshIndicator(
        onRefresh: _loadRecent,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _featuresRow(context),
            const SizedBox(height: 24),
            Text('Recent Documents', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            if (_recent.isEmpty)
              const Text('No documents yet')
            else
              ..._recent.map((d) => ListTile(
                    title: Text(d.title),
                    subtitle: Text(d.feature),
                    trailing: Text(_formatDate(d.updatedAt)),
                  )),
            const SizedBox(height: 24),
            AppButton(
              onPressed: () async {
                await locator<AuthCubit>().logout();
                context.go(AppRouter.baseRoute);
              },
              label: 'Logout',
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuresRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tools', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.5),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            _featureCard(context, 'Humanizer & Paraphraser', Icons.edit, () => context.go('${HomePage.routeName}/humanizer')),
            _featureCard(context, 'AI Writer', Icons.description_outlined, () => context.go('${HomePage.routeName}/writer')),
            _featureCard(context, 'AI Detector', Icons.policy_outlined, () => context.go('${HomePage.routeName}/detector')),
            _featureCard(context, 'Quick Export', Icons.ios_share_outlined, () {}),
          ],
        )
      ],
    );
  }

  Widget _featureCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.shade100),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blue),
            const Spacer(),
            Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) => '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
}
