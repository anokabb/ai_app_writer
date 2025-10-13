import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phrasly_ai_tools/src/core/components/forms/main_text_field.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/selector_buttons.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/transparent_app_button.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/gradient_layout.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/file_upload_modal.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/subscription_cubit.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/data/repos/humanizer_repo.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/presentation/cubit/humanizer_cubit.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/presentation/pages/humanize_result_widget.dart';

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
  final ValueNotifier<int> _wordCountNotifier = ValueNotifier<int>(0);

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

  void _updateWordCount() {
    _wordCountNotifier.value =
        _controller.text.trim().isEmpty ? 0 : _controller.text.trim().split(RegExp(r'\s+')).length;
  }

  @override
  void dispose() {
    humanizerCubit.close();
    _controller.dispose();
    _wordCountNotifier.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.text != null) {
        _controller.text = widget.text!;
        _updateWordCount();
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
                      onChanged: (value) {
                        _updateWordCount();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ValueListenableBuilder<int>(
                        valueListenable: _wordCountNotifier,
                        builder: (context, wordCount, child) {
                          return Text(
                            '$wordCount words',
                            style: context.appTextTheme.body3.copyWith(
                              color: context.appColors.lightTextColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TransparentButton(
                        primaryColor: primaryColor,
                        title: 'Upload file',
                        icon: Assets.svg.link,
                        isAsync: true,
                        onTap: () async {
                          FileUploadModal.show(
                            context,
                            color: primaryColor,
                            onFileUploaded: (String text) {
                              _controller.text = text;
                            },
                            onError: () {
                              // Handle error if needed
                            },
                          );
                        },
                      ),
                      TransparentButton(
                        primaryColor: primaryColor,
                        title: 'Clear',
                        icon: Assets.svg.clear,
                        onTap: () {
                          _controller.clear();
                          _updateWordCount();
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
                          _updateWordCount();
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
    if (_wordCountNotifier.value < (kDebugMode ? 2 : 30)) {
      showTopError('Your text is too short, please enter more than 30 words to humanize.');
      return;
    }
    if (!await locator<SubscriptionCubit>().canUseAiTools()) return;
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
