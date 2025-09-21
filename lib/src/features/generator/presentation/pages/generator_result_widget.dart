import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/markdown_text.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/gen/assets.gen.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:phrasly_ai_tools/src/features/export/presentation/widgets/export_modal.dart';
import 'package:phrasly_ai_tools/src/features/generator/presentation/cubit/generator_cubit.dart';

class GeneratorResultWidget extends StatefulWidget {
  final Color color;
  final List<Color> gradientColors;
  final bool isLoading;

  const GeneratorResultWidget({super.key, required this.color, required this.gradientColors, required this.isLoading});

  @override
  State<GeneratorResultWidget> createState() => _GeneratorResultWidgetState();
}

class _GeneratorResultWidgetState extends State<GeneratorResultWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneratorCubit, GeneratorState>(
      buildWhen: (previous, current) => current is GeneratorStateLoaded,
      builder: (context, state) {
        if (state is GeneratorStateLoaded) {
          final result = state.result;

          // Scroll to bottom when text changes
          _scrollToBottom();

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
                          colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Generated Content',
                          style: context.appTextTheme.subtitle2.copyWith(
                            color: widget.color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Utils.hexToColor('#45A3F7').withOpacity(0.13),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      height: context.height * 0.35,
                      child: MarkdownText(
                        data: result.generatedContent,
                        baseStyle: context.appTextTheme.body3,
                        controller: _scrollController,
                        selectable: true,
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
                          gradientColors: widget.gradientColors,
                        ),
                        GradientButton(
                          label: 'Export',
                          disabled: widget.isLoading,
                          isAsync: true,
                          onPressed: () async {
                            ExportModal.show(
                              context,
                              text: result.generatedContent,
                              color: widget.color,
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
                          gradientColors: widget.gradientColors,
                        ),
                        GradientButton(
                          label: 'Save to History',
                          disabled: widget.isLoading,
                          isAsync: true,
                          onPressed: () async {
                            await locator<HistoryCubit>()
                                .saveGeneratedContent(result: result, originalText: result.originalText);
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
                          gradientColors: widget.gradientColors,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
