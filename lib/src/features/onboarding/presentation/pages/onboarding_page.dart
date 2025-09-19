import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/onboarding/presentation/pages/reviews_page.dart';
import 'package:phrasly_ai_tools/src/features/onboarding/presentation/pages/splash_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingItem {
  final String titleColor;
  final String title;
  final String description;
  final AssetGenImage image;

  OnboardingItem({
    required this.titleColor,
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingPage extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      titleColor: 'Detect AI',
      title: 'and Copied Text',
      description: 'Magnifying glass over a paragraph, with red highlights showing “AI detected” and plagiarized.',
      image: Assets.images.onboarding.scanWrong,
    ),
    OnboardingItem(
      titleColor: '100% Human',
      title: 'Like Results',
      description: 'Our AI rewrites robotic sentences into natural, authentic writing that feels truly human.',
      image: Assets.images.onboarding.scanSuccess,
    ),
    OnboardingItem(
      titleColor: 'AI Power',
      title: 'at Your Fingertips',
      description: 'Transform your essays, projects, and papers with cutting-edge AI tools designed for students.',
      image: Assets.images.onboarding.tools,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                itemBuilder: (context, index) => OnboardingItemWidget(
                  onboardingItem: _onboardingItems[index],
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _onboardingItems.length,
              effect: ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 9,
                activeDotColor: Utils.hexToColor('##0F66D0'),
                dotColor: Utils.hexToColor('#AACDF8'),
              ),
            ),
            const SizedBox(height: 30),
            AppCupertinoButton(
              onTap: _onNextPressed,
              child: Assets.images.onboarding.continueBtn.image(
                width: context.width * 0.8,
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _onNextPressed() {
    if (_pageController.page == _onboardingItems.length - 1) {
      SplashPage.setOnboardingCompleted();
      context.push(ReviewsPage.routeName);
    } else {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
}

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem onboardingItem;
  const OnboardingItemWidget({super.key, required this.onboardingItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          onboardingItem.image.image(
            width: context.width,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${onboardingItem.titleColor} ',
                        style: context.appTextTheme.title3.copyWith(
                          color: Utils.hexToColor('#176ED9'),
                        ),
                      ),
                      TextSpan(
                        text: onboardingItem.title,
                        style: context.appTextTheme.title3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    onboardingItem.description,
                    textAlign: TextAlign.center,
                    style: context.appTextTheme.body2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
