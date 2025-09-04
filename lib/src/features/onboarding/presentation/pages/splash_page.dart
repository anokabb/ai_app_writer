import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/features/onboarding/presentation/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';

  static Future<void> setOnboardingCompleted() async {
    await persistsData.put('onboardingCompleted', true);
  }

  static bool checkOnboardingCompleted() {
    return persistsData.get('onboardingCompleted') == true;
  }

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(minutes: 10),
          curve: Curves.linear,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.onboarding.background.image(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: <Widget>[
                SizedBox.shrink(),
                Center(
                  child: Assets.images.onboarding.logo.image(
                    width: context.width * 0.8,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        10,
                        (index) => Assets.images.onboarding.bubbles.image(
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Assets.images.onboarding.stats.image(
                    width: context.width * 0.8,
                  ),
                ),
                AppCupertinoButton(
                  onTap: () {
                    context.push(OnboardingPage.routeName);
                  },
                  child: Assets.images.onboarding.getStartedBtn.image(
                    width: context.width * 0.8,
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
