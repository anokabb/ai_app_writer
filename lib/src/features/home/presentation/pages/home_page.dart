import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_bottom_nav.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/widgets/ai_tools_section.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/widgets/recent_documents_section.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/widgets/stats_card.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/widgets/welcome_card.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: AppBottomNavigationBar.scrollViewPadding.copyWith(left: 0, right: 0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: WelcomeCard(),
            ),
            SizedBox(height: 20),
            StatsCard(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AItoolsSection(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RecentDocumentsSection(),
            ),
          ],
        ),
      ),
    );
  }
}
