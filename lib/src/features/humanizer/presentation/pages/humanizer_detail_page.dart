import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/gradient_layout.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/components/widgets/markdown_text.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/documents/data/models/history_item.dart';
import 'package:flutter_app_template/src/features/export/presentation/widgets/export_modal.dart';
import 'package:flutter_svg/svg.dart';

class HumanizerDetailPage extends StatefulWidget {
  final String? text;
  final HistoryItem historyItem;

  const HumanizerDetailPage({super.key, this.text, required this.historyItem});

  static const routeName = '/humanizer-detail';

  @override
  State<HumanizerDetailPage> createState() => _HumanizerDetailPageState();
}

class _HumanizerDetailPageState extends State<HumanizerDetailPage> {
  final Color primaryColor = Utils.hexToColor('#29C987');
  final List<Color> colors = [
    Utils.hexToColor('#2CC76E'),
    Utils.hexToColor('#21CCAE'),
  ];

  @override
  Widget build(BuildContext context) {
    return GradientLayout(
      title: 'AI Humanized Doc ',
      colors: colors,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: HumanizeDetailResultWidget(
            result: widget.historyItem.humanizationResult!,
            color: primaryColor,
            gradientColors: colors,
          ),
        ),
      ),
    );
  }
}

class HumanizeDetailResultWidget extends StatelessWidget {
  final Color color;
  final List<Color> gradientColors;
  final HumanizationResult result;
  const HumanizeDetailResultWidget(
      {super.key, required this.color, required this.gradientColors, required this.result});

  @override
  Widget build(BuildContext context) {
    return AppCard(
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
                  color: color,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Utils.hexToColor('#F5FCF6'),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: MarkdownText(
                data: result.humanizedText,
                baseStyle: context.appTextTheme.body3,
                selectable: true,
              ),
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              GradientButton(
                label: 'Copy',
                onPressed: () {
                  Utils.copyToClipboard(result.humanizedText);
                },
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
                gradientColors: gradientColors,
              ),
              GradientButton(
                label: 'Export',
                isAsync: true,
                onPressed: () async {
                  ExportModal.show(
                    context,
                    text: result.humanizedText,
                    color: color,
                  );
                },
                hasShadow: true,
                textStyle: context.appTextTheme.subtitle3.copyWith(
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
                expand: false,
                height: 30,
                icon: Icon(Icons.upload, color: Colors.white),
                borderRadius: 500,
                gradientColors: gradientColors,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
