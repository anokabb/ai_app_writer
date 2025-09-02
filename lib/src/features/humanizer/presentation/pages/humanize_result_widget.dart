import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/components/widgets/markdown_text.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:flutter_app_template/src/features/export/presentation/widgets/export_modal.dart';
import 'package:flutter_app_template/src/features/humanizer/presentation/cubit/humanizer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HumanizeResultWidget extends StatefulWidget {
  final Color color;
  final List<Color> gradientColors;
  final Function() onHumanizeAgain;
  final bool isLoading;
  const HumanizeResultWidget(
      {super.key,
      required this.color,
      required this.gradientColors,
      required this.onHumanizeAgain,
      required this.isLoading});

  @override
  State<HumanizeResultWidget> createState() => _HumanizeResultWidgetState();
}

class _HumanizeResultWidgetState extends State<HumanizeResultWidget> {
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
    return BlocBuilder<HumanizerCubit, HumanizerState>(
      buildWhen: (previous, current) => current is HumanizerStateLoaded,
      builder: (context, state) {
        if (state is HumanizerStateLoaded) {
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
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Humanized',
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
                        color: Utils.hexToColor('#F5FCF6'),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      height: context.height * 0.35,
                      child: MarkdownText(
                        data: result.humanizedText,
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
                          gradientColors: widget.gradientColors,
                        ),
                        GradientButton(
                          label: 'Humanize Again',
                          disabled: widget.isLoading,
                          isAsync: true,
                          onPressed: () async {
                            await widget.onHumanizeAgain();
                          },
                          hasShadow: true,
                          textStyle: context.appTextTheme.subtitle3.copyWith(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          expand: false,
                          height: 30,
                          icon: SvgPicture.asset(
                            Assets.svg.aiMagic,
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
                              text: result.humanizedText,
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
                          label: 'Save to Docs',
                          disabled: widget.isLoading,
                          isAsync: true,
                          onPressed: () async {
                            await locator<HistoryCubit>().save(result: result, originalText: result.originalText);
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
