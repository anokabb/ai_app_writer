import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phrasly_ai_tools/src/core/components/forms/main_text_field.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/selector_buttons.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/transparent_app_button.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/gradient_layout.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/detector/data/repos/detector_repo.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/cubit/detector_cubit.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/pages/detector_result_widget.dart';

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
  final DetectorCubit detectorCubit = DetectorCubit(locator<DetectorRepo>());

  final Color primaryColor = Utils.hexToColor('#FD5348');

  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    _textController.dispose();
    _formKey.currentState?.dispose();
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
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detectorCubit,
      child: GradientLayout(
        title: 'AI Detector',
        colors: DetectorPage.colors,
        child: ListView(
          controller: scrollController,
          padding: context.scrollSafePadding,
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
                  Form(
                    key: _formKey,
                    child: MainTextField(
                      controller: _textController,
                      primaryColor: primaryColor,
                    ),
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
                if (_formKey.currentState?.validate() ?? false) {
                  await detectorCubit.analyzeText(_textController.text, mode: detectorMode);
                  Future.delayed(const Duration(milliseconds: 100), () {
                    scrollToDetectorResult();
                  });
                }
              },
            ),
            SizedBox(height: 16),
            DetectorResultWidget(
              key: detectorResultKey,
              textController: _textController,
            ),
          ],
        ),
      ),
    );
  }
}
