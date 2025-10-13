import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_colors.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/cubit/detector_cubit.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/widgets/highlighted_text.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/widgets/percentage_bar.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/presentation/pages/humanizer_page.dart';
import 'package:phrasly_ai_tools/src/features/settings/presentation/cubit/settings_cubit.dart';

class DetectorResultWidget extends StatefulWidget {
  final TextEditingController? textController;
  final TextAnalysisResult? result;
  final String? originalText;

  const DetectorResultWidget({super.key, this.textController, this.result, this.originalText});

  @override
  State<DetectorResultWidget> createState() => _DetectorResultWidgetState();
}

class _DetectorResultWidgetState extends State<DetectorResultWidget> with TickerProviderStateMixin {
  late AnimationController _analysisDetailsController;
  late AnimationController _highAiController;
  late AnimationController _highlightedTextController;
  late Animation<Offset> _analysisDetailsSlideAnimation;
  late Animation<double> _analysisDetailsFadeAnimation;
  late Animation<Offset> _highAiSlideAnimation;
  late Animation<double> _highAiFadeAnimation;
  late Animation<Offset> _highlightedTextSlideAnimation;
  late Animation<double> _highlightedTextFadeAnimation;

  @override
  void initState() {
    super.initState();

    _analysisDetailsController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _highAiController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _highlightedTextController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _analysisDetailsSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _analysisDetailsController,
      curve: Curves.easeOutCubic,
    ));

    _analysisDetailsFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _analysisDetailsController,
      curve: Curves.easeOutCubic,
    ));

    _highAiSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _highAiController,
      curve: Curves.easeOutCubic,
    ));

    _highAiFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _highAiController,
      curve: Curves.easeOutCubic,
    ));

    _highlightedTextSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _highlightedTextController,
      curve: Curves.easeOutCubic,
    ));

    _highlightedTextFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _highlightedTextController,
      curve: Curves.easeOutCubic,
    ));

    if (widget.result != null) {
      _startAnimations();
    } else {
      context.read<DetectorCubit>().stream.listen((state) {
        if (state is DetectorStateLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _startAnimations();
            }
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _analysisDetailsController.dispose();
    _highAiController.dispose();
    _highlightedTextController.dispose();
    super.dispose();
  }

  void _startAnimations() {
    _analysisDetailsController.forward(from: 0);
    _highAiController.forward(from: 0);
    _highlightedTextController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.result != null) {
      return body(widget.result!);
    }
    return BlocBuilder<DetectorCubit, DetectorState>(
      buildWhen: (previous, current) => current is DetectorStateLoaded,
      builder: (context, state) {
        if (state is DetectorStateLoaded) {
          final result = state.result;
          return body(result);
        }

        return SizedBox.shrink();
      },
    );
  }

  Widget body(TextAnalysisResult result) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
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
                      result: result,
                      fadeAnimation: _analysisDetailsFadeAnimation,
                    ),
                  ),
                  if (settingsState.settings.writingTips && (result.explanation?.isNotEmpty ?? false)) ...[
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
                    SlideTransition(
                      position: _analysisDetailsSlideAnimation,
                      child: FadeTransition(
                        opacity: _analysisDetailsFadeAnimation,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Utils.hexToColor('#F2F2F7'),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(14),
                          child: Text(
                            result.explanation ?? '',
                            style: context.appTextTheme.body3,
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (result.source != TextSource.human) ...[
                    SizedBox(height: 16),
                    SlideTransition(
                      position: _highAiSlideAnimation,
                      child: FadeTransition(
                        opacity: _highAiFadeAnimation,
                        child: Container(
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
                                  String text = widget.textController?.text ?? '';
                                  if (text.trim().isEmpty) return;
                                  context.push(HumanizerPage.routeName, extra: text);
                                },
                                borderRadius: 500,
                                width: context.width * 0.4,
                                height: 36,
                                gradientColors: [Utils.hexToColor('#FF9114'), Utils.hexToColor('#FE5347')],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (result.highlightedSentences?.isNotEmpty ?? false) ...[
                    SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.search_rounded,
                          color: AppColors.orange,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Detected Text',
                          style: context.appTextTheme.subtitle2,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SlideTransition(
                      position: _highlightedTextSlideAnimation,
                      child: FadeTransition(
                        opacity: _highlightedTextFadeAnimation,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Utils.hexToColor('#F2F2F7'),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(14),
                          child: SingleChildScrollView(
                            child: HighlightedText(
                              fullText: widget.originalText ?? widget.textController?.text ?? '',
                              highlightedSentences: result.highlightedSentences ?? [],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
