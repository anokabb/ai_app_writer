// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
// import 'package:flutter_app_template/src/core/constants/env_config.dart';
// import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
// import 'package:flutter_app_template/src/core/services/locator/locator.dart';
// import 'package:flutter_app_template/src/features/documents/data/models/history_item.dart';
// import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../data/api/gemini_writer_api.dart';
// import '../../data/api/openai_writer_api.dart';
// import '../../data/models/text_analysis_model.dart';
// import '../../data/repos/gemini_writer_repo.dart';
// import '../../data/repos/mock_writer_repo.dart';
// import '../../data/repos/openai_writer_repo.dart';
// import '../../data/repos/writer_repo.dart';
// import '../cubit/writer_cubit.dart';
// import 'widgets/ai_provider_selector.dart';
// import 'widgets/analysis_result_modal.dart';
// import 'widgets/humanization_progress_modal.dart';
// import 'widgets/main_text_field.dart';

// class WriterPage extends StatefulWidget {
//   static const String routeName = '/writer';
//   const WriterPage({super.key});

//   @override
//   State<WriterPage> createState() => _WriterPageState();
// }

// class _WriterPageState extends State<WriterPage> {
//   final TextEditingController _controller = TextEditingController();
//   AIProvider _selectedProvider = AIProvider.openai;
//   String _geminiApiKey = '';
//   late WriterCubit _writerCubit;
//   late WriterRepo writerRepo;

//   // For history tracking (no longer needed since we analyze on-demand)

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(_onTextChanged);
//     _updateWriterCubit();
//   }

//   void _updateWriterCubit() {
//     switch (_selectedProvider) {
//       case AIProvider.mock:
//         writerRepo = MockWriterRepo();
//         break;
//       case AIProvider.gemini:
//         writerRepo = GeminiWriterRepo(
//           apiKey: _geminiApiKey,
//           api: locator<GeminiWriterApi>(),
//         );
//         break;
//       case AIProvider.openai:
//         writerRepo = OpenAIWriterRepo(
//           apiKey: EnvConfig.OPENAI_API_KEY,
//           api: locator<OpenAIWriterApi>(),
//         );
//         break;
//     }

//     _writerCubit = WriterCubit(writerRepo);
//   }

//   @override
//   void dispose() {
//     _controller.removeListener(_onTextChanged);
//     _controller.dispose();
//     _writerCubit.close();
//     super.dispose();
//   }

//   void _onTextChanged() {
//     setState(() {});
//   }

//   Future<void> _scan() async {
//     // Check if text is empty
//     if (_controller.text.trim().isEmpty) {
//       showTopError('Please enter some text to scan');
//       return;
//     }

//     try {
//       await _writerCubit.analyzeText(_controller.text);
//     } catch (e) {
//       if (mounted) {
//         showTopError('Error: $e');
//       }
//     }
//   }

//   Future<void> _humanize() async {
//     // Check if text is empty
//     if (_controller.text.trim().isEmpty) {
//       showTopError('Please enter some text to humanize');
//       return;
//     }

//     final currentText = _controller.text;

//     try {
//       // Show slide-up popup for humanization progress
//       HumanizationProgressModal.show(
//         context,
//         writerCubit: _writerCubit,
//       );

//       _writerCubit.humanizeText(currentText);
//     } catch (e) {
//       if (mounted) {
//         showTopError('Error: $e');
//       }
//     }
//   }

//   void _onProviderChanged(AIProvider? provider) {
//     if (provider != null) {
//       setState(() {
//         _selectedProvider = provider;
//       });
//       _updateWriterCubit();
//     }
//   }

//   TextAnalysisResult? _lastAnalysisResult;
//   String? _lastAnalysisText;

//   Future<void> _saveToHistory(HumanizationResult humanizationResult) async {
//     TextAnalysisResult? analysisResult;
//     try {
//       // Only save if we have both analysis and humanization results

//       if (_lastAnalysisText == _controller.text.trim() && _lastAnalysisResult != null) {
//         analysisResult = _lastAnalysisResult!;
//       } else {
//         final result = await writerRepo.analyzeText(_controller.text.trim());
//         analysisResult = result.fold((l) => null, (r) => r);
//       }

//       final historyItem = HistoryItem(
//         id: DateTime.now().millisecondsSinceEpoch.toString(),
//         timestamp: DateTime.now(),
//         originalText: _controller.text.trim(),
//         humanizedText: humanizationResult.humanizedText,
//         analysisResult: analysisResult,
//         humanizationResult: humanizationResult,
//       );

//       await locator<HistoryCubit>().addHistoryItem(historyItem);
//     } catch (e) {
//       // Silently fail to avoid breaking the main flow
//       log('Error saving to history: $e');
//     }
//   }

//   String _generateTitle(String text) {
//     // Generate a title from the first few words of the text
//     final words = text.trim().split(RegExp(r'\s+'));
//     final titleWords = words.take(5).join(' ');

//     if (titleWords.length > 50) {
//       return '${titleWords.substring(0, 47)}...';
//     }

//     return titleWords.isNotEmpty ? titleWords : 'Humanized Text';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: _writerCubit,
//       child: BlocListener<WriterCubit, WriterState>(
//         listener: (context, state) {
//           state.when(
//             initial: () {},
//             analyzing: () {},
//             analysisComplete: (result) {
//               _lastAnalysisResult = result;
//               _lastAnalysisText = _controller.text.trim();
//               AnalysisResultModal.show(
//                 context,
//                 result: result,
//                 scannedText: _controller.text,
//                 onHumanize: _humanize,
//               );
//             },
//             analysisError: (error) {
//               String message = error.message;
//               if (error.message.contains('quota exceeded') ||
//                   error.message.contains('timeout') ||
//                   error.message.contains('Network connectivity issue')) {
//                 message = 'Network or API issue. Try switching to Mock provider for testing.';
//               }
//               showTopError(message);
//             },
//             humanizing: () {},
//             humanizationProgress: (result) {},
//             humanizationComplete: (result) {
//               // Save to history when humanization is complete
//               _saveToHistory(result);
//             },
//             humanizationError: (error) {
//               String message = error.message;
//               if (error.message.contains('quota exceeded') ||
//                   error.message.contains('timeout') ||
//                   error.message.contains('Network connectivity issue')) {
//                 message = 'Network or API issue. Try switching to Mock provider for testing.';
//               }
//               showTopError(message);
//             },
//           );
//         },
//         child: GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Scaffold(
//             body: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     // AI Provider Selection
//                     AIProviderSelector(
//                       selectedProvider: _selectedProvider,
//                       onChanged: _onProviderChanged,
//                       geminiApiKey: _geminiApiKey,
//                       onGeminiApiKeyApply: (value) {
//                         _geminiApiKey = value;

//                         _updateWriterCubit();
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: MainTextField(
//                         controller: _controller,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: AppButton(
//                             onPressed: _scan,
//                             label: 'Scan',
//                             isAsync: true,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: AppButton(
//                             onPressed: _humanize,
//                             label: 'Humanize',
//                             isAsync: true,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
