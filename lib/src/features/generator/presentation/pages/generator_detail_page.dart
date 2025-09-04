import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/gradient_layout.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/markdown_text.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/documents/data/models/history_item.dart';
import 'package:phrasly_ai_tools/src/features/export/presentation/widgets/export_modal.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/models/generator_model.dart';

class GeneratorDetailPage extends StatefulWidget {
  final String? text;
  final HistoryItem historyItem;

  const GeneratorDetailPage({super.key, this.text, required this.historyItem});

  static const routeName = '/generator-detail';

  @override
  State<GeneratorDetailPage> createState() => _GeneratorDetailPageState();
}

class _GeneratorDetailPageState extends State<GeneratorDetailPage> {
  final Color primaryColor = Utils.hexToColor('#2171D0');
  final List<Color> colors = [
    Utils.hexToColor('#0779DF'),
    Utils.hexToColor('#055396'),
  ];

  @override
  Widget build(BuildContext context) {
    return GradientLayout(
      title: 'AI Generated Doc',
      colors: colors,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: GeneratorDetailResultWidget(
            result: widget.historyItem.generatorResult!,
            color: primaryColor,
            gradientColors: colors,
          ),
        ),
      ),
    );
  }
}

class GeneratorDetailResultWidget extends StatelessWidget {
  final Color color;
  final List<Color> gradientColors;
  final GeneratorModel result;
  const GeneratorDetailResultWidget(
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
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
              SizedBox(width: 4),
              Text(
                'Generated Content',
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
                color: Utils.hexToColor('#45A3F7').withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: MarkdownText(
                data: result.generatedContent,
                baseStyle: context.appTextTheme.body3,
                selectable: true,
              ),
            ),
          ),
          SizedBox(height: 16),

          // Tags Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Utils.hexToColor('#F8F9FA'),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Utils.hexToColor('#E9ECEF'),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Generation Tags',
                  style: context.appTextTheme.subtitle3.copyWith(
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildTag('Type: ${result.typeOfWriting.replaceAll('_', ' ').toUpperCase()}',
                        Utils.hexToColor('#258EEC')),
                    _buildTag('Tone: ${result.tone.toUpperCase()}', Utils.hexToColor('#FF9114')),
                    _buildTag('Words: ${result.wordCount}', Utils.hexToColor('#29C987')),
                    _buildTag('Lang: ${result.language.toUpperCase()}', Utils.hexToColor('#9C27B0')),
                  ],
                ),
              ],
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
                  Utils.copyToClipboard(result.generatedContent);
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
                    text: result.generatedContent,
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

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
