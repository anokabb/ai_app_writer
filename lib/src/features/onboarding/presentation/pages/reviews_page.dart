import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/pages/home_page.dart';

class ReviewsPage extends StatefulWidget {
  static const String routeName = '/reviews';

  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () {
        Utils.requestReview();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Give us rating',
                        style: context.appTextTheme.title3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Assets.images.onboarding.stars.image(
                      width: context.width * 0.7,
                    ),
                    const SizedBox(height: 10),
                    AutoSizeText(
                      'Phrasly AI was made\nfor people like you',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: context.appTextTheme.title2,
                    ),
                    const SizedBox(height: 10),
                    Assets.images.onboarding.users.image(
                      height: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '700K+ Phrasly AI users',
                      style: context.appTextTheme.body2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ...[
                      _Review(
                          name: 'Sarah Chen',
                          review:
                              'This app is a game-changer for my academic writing! The content generator helped me create a research paper outline in minutes, and the AI humanizer made my text sound completely natural. Saved me hours of work!'),
                      _Review(
                          name: 'Marcus Johnson',
                          review:
                              'As a content creator, I was skeptical about AI tools, but Phrasly AI exceeded my expectations. The detector feature helps me ensure my content is original, and the humanizer makes my AI-generated drafts sound authentic. Highly recommend!'),
                      _Review(
                          name: 'Emily Rodriguez',
                          review:
                              'The interface is so clean and easy to use. I love how I can generate different types of content and then humanize it to avoid detection. Perfect for students and professionals who need quality writing assistance.'),
                      _Review(
                          name: 'David Kim',
                          review:
                              'Finally, an AI tool that actually works as advertised! The content generator produces coherent, well-structured text, and the humanizer does an amazing job making it sound human-written. Worth every penny!'),
                    ].map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Utils.hexToColor('#E6EDF7'),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Utils.hexToColor('#0B64CF')),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(e.name, style: context.appTextTheme.subtitle2)),
                                  Text('★★★★★',
                                      style: context.appTextTheme.body2.copyWith(
                                        color: Utils.hexToColor(
                                          '#0B64CF',
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  e.review,
                                  style: context.appTextTheme.body3Light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              AppCupertinoButton(
                onTap: () => context.go(HomePage.routeName),
                child: Assets.images.onboarding.continueBtn.image(
                  width: context.width * 0.8,
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _Review {
  final String name;
  final String review;

  _Review({required this.name, required this.review});
}
