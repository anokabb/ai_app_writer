import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/src/core/components/forms/main_text_field.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/selector_buttons.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/transparent_app_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/gradient_layout.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/humanizer/data/repos/humanizer_repo.dart';
import 'package:flutter_app_template/src/features/humanizer/presentation/cubit/humanizer_cubit.dart';
import 'package:flutter_app_template/src/features/humanizer/presentation/pages/humanize_result_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

enum RewritingModes {
  easy,
  medium,
  aggressive,
}

class HumanizerPage extends StatefulWidget {
  const HumanizerPage({super.key, this.text});
  final String? text;

  static const routeName = '/humanizer';

  @override
  State<HumanizerPage> createState() => _HumanizerPageState();
}

class _HumanizerPageState extends State<HumanizerPage> {
  final HumanizerCubit humanizerCubit = HumanizerCubit(locator<HumanizerRepo>());

  final Color primaryColor = Utils.hexToColor('#29C987');
  final TextEditingController _controller = TextEditingController();

  List<Color> colors = [
    Utils.hexToColor('#2CC76E'),
    Utils.hexToColor('#21CCAE'),
  ];

  final _formKey = GlobalKey<FormState>();

  RewritingModes rewritingMode = RewritingModes.easy;

  final humanizeResultKey = GlobalKey();

  void scrollToHumanizeResult() {
    // Scrolls to the humanize result widget to make sure it's visible
    final context = humanizeResultKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 300));
    }
  }

  bool isLoading = false;

  @override
  void dispose() {
    humanizerCubit.close();
    _controller.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.text != null) {
        _controller.text = widget.text!;
        Future.delayed(const Duration(milliseconds: 100), () {
          humanizeText();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => humanizerCubit,
      child: GradientLayout(
        title: 'AI Humanizer',
        colors: colors,
        child: ListView(
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
                        colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
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
                      controller: _controller,
                      primaryColor: primaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          context.read<HumanizerCubit>().reset();
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
            BlocBuilder<HumanizerCubit, HumanizerState>(
              builder: (context, state) {
                return GradientButton(
                  label: 'Generate Magic',
                  icon: SvgPicture.asset(
                    Assets.svg.aiMagic,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  gradientColors: colors,
                  isAsync: true,
                  isLoading: isLoading,
                  onPressed: humanizeText,
                );
              },
            ),
            SizedBox(height: 20),
            HumanizeResultWidget(
              key: humanizeResultKey,
              color: primaryColor,
              gradientColors: colors,
              onHumanizeAgain: humanizeText,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }

  double _getCreativityLevel(RewritingModes mode) {
    switch (mode) {
      case RewritingModes.easy:
        return 0.3;
      case RewritingModes.medium:
        return 0.6;
      case RewritingModes.aggressive:
        return 0.9;
    }
  }

  Future<void> humanizeText() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState?.validate() ?? false) {
      final creativity = _getCreativityLevel(rewritingMode);
      await humanizerCubit.humanizeText(_controller.text, creativity: creativity, onFirstLoad: () {
        Future.delayed(const Duration(milliseconds: 100), () {
          scrollToHumanizeResult();
        });
      });

      Future.delayed(const Duration(milliseconds: 100), () {
        scrollToHumanizeResult();
      });
    }
    setState(() {
      isLoading = false;
    });
  }
}
