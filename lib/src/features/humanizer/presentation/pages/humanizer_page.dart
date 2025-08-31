import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/selector_buttons.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/transparent_app_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/gradient_layout.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/humanizer/presentation/pages/humanize_result_widget.dart';
import 'package:flutter_app_template/src/features/writer/presentation/pages/widgets/main_text_field.dart';
import 'package:flutter_svg/svg.dart';

enum RewritingModes {
  easy,
  medium,
  aggressive,
}

class HumanizerPage extends StatefulWidget {
  const HumanizerPage({super.key});

  static const routeName = '/humanizer';

  @override
  State<HumanizerPage> createState() => _HumanizerPageState();
}

class _HumanizerPageState extends State<HumanizerPage> {
  final Color primaryColor = Utils.hexToColor('#29C987');
  final TextEditingController _controller = TextEditingController();
  List<Color> colors = [
    Utils.hexToColor('#2CC76E'),
    Utils.hexToColor('#21CCAE'),
  ];

  RewritingModes rewritingMode = RewritingModes.easy;

  final humanizeResultKey = GlobalKey();

  void scrollToHumanizeResult() {
    // Scrolls to the humanize result widget to make sure it's visible
    final context = humanizeResultKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 300));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientLayout(
      title: 'AI Humanizer',
      colors: colors,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AppCard(
            radius: 10,
            child: Column(
              spacing: 16,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      Assets.svg.copyOrange,
                      colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Past text or upload doc',
                      style: context.appTextTheme.subtitle2,
                    ),
                  ],
                ),
                MainTextField(
                  controller: _controller,
                  primaryColor: primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 10,
                  children: <Widget>[
                    TransparentButton(
                      primaryColor: primaryColor,
                      title: 'Upload file',
                      icon: Assets.svg.link,
                      onTap: () {},
                    ),
                    TransparentButton(
                      primaryColor: primaryColor,
                      title: 'Clear',
                      icon: Assets.svg.clear,
                      onTap: () {
                        _controller.clear();
                      },
                    ),
                    TransparentButton(
                      primaryColor: primaryColor,
                      title: 'Paste text',
                      icon: Assets.svg.copyOrange,
                      onTap: () async {
                        final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
                        if (data?.text != null) {
                          _controller.text = data!.text!;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          AppCard(
            radius: 10,
            child: Column(
              spacing: 16,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      Assets.svg.sliders,
                      colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Rewriting Strength',
                      style: context.appTextTheme.subtitle2,
                    ),
                  ],
                ),
                SelectorButtons(
                  items: RewritingModes.values.map((e) => e.name).toList(),
                  colors: colors,
                  selectedItem: rewritingMode.name,
                  onSelected: (value) {
                    setState(() {
                      rewritingMode = RewritingModes.values.firstWhere((e) => e.name == value);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          GradientButton(
            label: 'Generate Magic',
            icon: SvgPicture.asset(
              Assets.svg.aiMagic,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            gradientColors: colors,
            isAsync: true,
            onPressed: () async {
              scrollToHumanizeResult();
            },
          ),
          SizedBox(height: 20),
          HumanizeResultWidget(
            key: humanizeResultKey,
            color: primaryColor,
            gradientColors: colors,
          ),
        ],
      ),
    );
  }
}
