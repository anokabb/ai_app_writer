import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/components/widgets/language_selector.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_svg/svg.dart';

class HumanizeResultWidget extends StatefulWidget {
  final Color color;
  final List<Color> gradientColors;
  const HumanizeResultWidget({super.key, required this.color, required this.gradientColors});

  @override
  State<HumanizeResultWidget> createState() => _HumanizeResultWidgetState();
}

class _HumanizeResultWidgetState extends State<HumanizeResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppCard(
          radius: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    Assets.svg.aiStars,
                    width: 22,
                    height: 22,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Humanized',
                    style: context.appTextTheme.subtitle2.copyWith(
                      color: widget.color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Utils.hexToColor('#F5FCF6'),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(12),
                child: Text(
                  'Modern life is deeply intertwined with technology, shaping nearly every aspect of how we communicate, work, and even think. Over the last few decades, progress has been astonishing: smartphones have replaced dozens of traditional tools, artificial intelligence has begun to influence industries from healthcare to education, and global connectivity has allowed people to share knowledge instantly across borders. Yet, alongside the excitement of innovation, there is also a growing sense of fatigue.',
                  style: context.appTextTheme.body3,
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  GradientButton(
                    label: 'Copy',
                    onPressed: () {},
                    hasShadow: true,
                    textStyle: context.appTextTheme.subtitle3.copyWith(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    expand: false,
                    height: 30,
                    icon: SvgPicture.asset(
                      Assets.svg.copyOrange,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      width: 16,
                      height: 16,
                    ),
                    borderRadius: 500,
                    gradientColors: widget.gradientColors,
                  ),
                  GradientButton(
                    label: 'Humanize Again',
                    onPressed: () {},
                    hasShadow: true,
                    textStyle: context.appTextTheme.subtitle3.copyWith(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    expand: false,
                    height: 30,
                    icon: SvgPicture.asset(
                      Assets.svg.aiMagic,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      width: 16,
                      height: 16,
                    ),
                    borderRadius: 500,
                    gradientColors: widget.gradientColors,
                  ),
                  GradientButton(
                    label: 'Export',
                    onPressed: () {},
                    hasShadow: true,
                    textStyle: context.appTextTheme.subtitle3.copyWith(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    expand: false,
                    height: 30,
                    icon: SvgPicture.asset(
                      Assets.svg.docs,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      width: 16,
                      height: 16,
                    ),
                    borderRadius: 500,
                    gradientColors: widget.gradientColors,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        AppCard(
          radius: 10,
          title: 'Translate',
          icon: SvgPicture.asset(
            Assets.svg.globe,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
          ),
          child: Column(
            children: <Widget>[
              LanguageSelector(
                gradientColors: widget.gradientColors,
                selectedLang: languages.first,
                onSelected: (LanguageModel? lang) {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
