import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/detector/presentation/pages/detector_page.dart';
import 'package:flutter_app_template/src/features/detector/presentation/widgets/percentage_bar.dart';
import 'package:flutter_app_template/src/features/humanizer/presentation/pages/humanizer_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DetectorResultWidget extends StatefulWidget {
  const DetectorResultWidget({super.key});

  @override
  State<DetectorResultWidget> createState() => _DetectorResultWidgetState();
}

class _DetectorResultWidgetState extends State<DetectorResultWidget> {
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
              Text(
                'Detection Mode',
                style: context.appTextTheme.subtitle2,
              ),
              SizedBox(height: 16),
              Center(
                child: PercentageBar(
                  percentage: 0.87,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    Assets.svg.statsOrange,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Analysis Details',
                    style: context.appTextTheme.subtitle2,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Utils.hexToColor('#F2F2F7'),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(14),
                child: Text(
                  'The text has been analyzed for AI-generated content patterns. Based on the analysis, this text appears to be likely AI-generated.',
                  style: context.appTextTheme.body3,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Utils.hexToColor('#F9F9FB'),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(14),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.warning_amber_rounded, color: Utils.hexToColor('#FF5443'), size: 18),
                        SizedBox(width: 4),
                        Text(
                          'High AI detected!',
                          style: context.appTextTheme.body3.copyWith(
                            color: Utils.hexToColor('#FF5443'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    GradientButton(
                      label: 'Humanize Now',
                      onPressed: () {
                        context.push(HumanizerPage.routeName);
                      },
                      borderRadius: 500,
                      width: context.width * 0.4,
                      height: 36,
                      gradientColors: DetectorPage.colors,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
