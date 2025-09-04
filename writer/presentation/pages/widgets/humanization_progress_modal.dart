import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_button.dart';
import 'package:phrasly_ai_tools/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/routing/app_router.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_colors.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/export/presentation/widgets/export_modal.dart';

import '../../cubit/writer_cubit.dart';

class HumanizationProgressModal {
  static void show(
    BuildContext context, {
    required WriterCubit writerCubit,
  }) {
    FocusScope.of(context).unfocus();
    SlideUpPopUp.show(
      context: context,
      child: BlocBuilder<WriterCubit, WriterState>(
        bloc: writerCubit,
        buildWhen: (previous, current) => current is WriterStateHumanizationProgress,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.theme.primaryColor.withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.auto_awesome,
                        color: context.theme.primaryColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AI Humanization',
                            style: context.theme.appTextTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Making your text more natural...',
                            style: context.theme.appTextTheme.body2.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Progress indicator
                if (state is WriterStateHumanizing)
                  Column(
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(context.theme.primaryColor),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'AI is analyzing and humanizing your text...',
                        style: context.theme.appTextTheme.body2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                // Streaming text display
                if (state is WriterStateHumanizationProgress)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Progress bar
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: 0.0,
                            end: state.result.humanLike,
                          ),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                          builder: (context, value, child) {
                            return LinearProgressIndicator(
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
                              value: value,
                            );
                          },
                        ),
                        const SizedBox(height: 12),

                        // Human-like score
                        Row(
                          children: [
                            Text(
                              'Human-like Score: ',
                              style: context.theme.appTextTheme.body2.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${(state.result.humanLike * 100).toInt()}%',
                              style: context.theme.appTextTheme.body2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Humanized text
                        Text(
                          'Humanized Text:',
                          style: context.theme.appTextTheme.subtitle2.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: SelectableText(
                                state.result.humanizedText,
                                style: context.theme.appTextTheme.body2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Changes being made
                        if (state.result.changes?.isNotEmpty == true) ...[
                          Text(
                            'Changes Applied:',
                            style: context.theme.appTextTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...state.result.changes!.map((change) => Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        change,
                                        style: context.theme.appTextTheme.body2,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],

                        const SizedBox(height: 20),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: state.result.humanizedText));
                                  showTopAlert('Copied to clipboard');
                                },
                                label: 'Copy',
                                isOutlined: false,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppButton(
                                onPressed: () {
                                  ExportModal.show(
                                    rootNavigatorKey.currentContext ?? context,
                                    text: state.result.humanizedText,
                                  );
                                },
                                label: 'Export',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                // Error state
                if (state is WriterStateHumanizationError)
                  Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Humanization Failed',
                        style: context.theme.appTextTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.error.message,
                        style: context.theme.appTextTheme.body2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: 'Close',
                        isOutlined: true,
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
