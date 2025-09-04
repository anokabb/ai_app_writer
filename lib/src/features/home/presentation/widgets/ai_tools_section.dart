import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/pages/detector_page.dart';
import 'package:phrasly_ai_tools/src/features/generator/presentation/pages/generator_page.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/presentation/pages/humanizer_page.dart';

class AItoolsSection extends StatelessWidget {
  const AItoolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          'AI Power Tools 🚀',
          style: context.appTextTheme.title5,
        ),
        _AItoolsItem(
          imagePath: Assets.images.contentGenerator.path,
          title: 'Content Generator',
          description: 'Generate your next paper, article, letter, and more within seconds.',
          onPressed: () {
            context.push(GeneratorPage.routeName);
          },
        ),
        _AItoolsItem(
          imagePath: Assets.images.aiHumanizer.path,
          title: 'AI Humanizer',
          description: 'Paraphrase your text to bypass AI detectors such as GPTZero, TurnItIn, and more.',
          onPressed: () {
            context.push(HumanizerPage.routeName);
          },
        ),
        _AItoolsItem(
          imagePath: Assets.images.aiDetector.path,
          title: 'AI Detector',
          description: 'Run a scan on your text for AI-generated content for free.',
          onPressed: () {
            context.push(DetectorPage.routeName);
          },
        ),
      ],
    );
  }
}

class _AItoolsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Function() onPressed;

  const _AItoolsItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppCupertinoButton(
      onTap: onPressed,
      child: AppCard(
        padding: EdgeInsets.zero,
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Row(
                  children: [
                    Container(
                      width: 66,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Utils.hexToColor('#396DEB'),
                            Utils.hexToColor('#8EB8FD'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20)
                  ],
                ),
                Positioned(
                  top: 10,
                  bottom: 10,
                  right: 0,
                  child: Image.asset(imagePath),
                )
              ],
            ),
            SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: context.appTextTheme.subtitle1),
                  Text(description, style: context.appTextTheme.body3Light),
                ],
              ),
            ),
            SizedBox(width: 16),
            CircleAvatar(
              radius: 12,
              backgroundColor: Utils.hexToColor('#3C70ED'),
              child: const Icon(
                Icons.chevron_right,
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
