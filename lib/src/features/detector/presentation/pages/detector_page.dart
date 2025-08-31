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
import 'package:flutter_app_template/src/features/detector/presentation/pages/detector_result_widget.dart';
import 'package:flutter_app_template/src/features/writer/presentation/pages/widgets/main_text_field.dart';
import 'package:flutter_svg/svg.dart';

enum DetectorModes {
  quick,
  standard,
  deep,
}

class DetectorPage extends StatefulWidget {
  static List<Color> colors = [
    Utils.hexToColor('#FF9114'),
    Utils.hexToColor('#FE5347'),
  ];
  const DetectorPage({super.key});

  static const routeName = '/detector';

  @override
  State<DetectorPage> createState() => _DetectorPageState();
}

class _DetectorPageState extends State<DetectorPage> {
  final Color primaryColor = Utils.hexToColor('#FD5348');

  final TextEditingController _textController = TextEditingController();
  final scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  DetectorModes detectorMode = DetectorModes.quick;

  final detectorResultKey = GlobalKey();

  void scrollToDetectorResult() {
    // Scrolls to the detector result widget to make sure it's visible
    final context = detectorResultKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientLayout(
      title: 'AI Detector',
      colors: DetectorPage.colors,
      child: ListView(
        controller: scrollController,
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
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Past text or upload doc',
                      style: context.appTextTheme.subtitle2,
                    ),
                  ],
                ),
                MainTextField(
                  controller: _textController,
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
                        _textController.clear();
                      },
                    ),
                    TransparentButton(
                      primaryColor: primaryColor,
                      title: 'Paste text',
                      icon: Assets.svg.copyOrange,
                      onTap: () async {
                        final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
                        if (data?.text != null) {
                          _textController.text = data!.text!;
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
                      Assets.svg.settingsOrange,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Detection Mode',
                      style: context.appTextTheme.subtitle2,
                    ),
                  ],
                ),
                SelectorButtons(
                  items: DetectorModes.values.map((e) => e.name).toList(),
                  colors: DetectorPage.colors,
                  selectedItem: detectorMode.name,
                  onSelected: (value) {
                    setState(() {
                      detectorMode = DetectorModes.values.firstWhere((e) => e.name == value);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          GradientButton(
            label: 'Scan text',
            icon: SvgPicture.asset(
              Assets.svg.aiMagic,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            gradientColors: DetectorPage.colors,
            isAsync: true,
            onPressed: () async {
              scrollToDetectorResult();
            },
          ),
          SizedBox(height: 16),
          DetectorResultWidget(
            key: detectorResultKey,
          ),
        ],
      ),
    );
  }
}
