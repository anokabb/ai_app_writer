// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
// import 'package:flutter_app_template/src/core/components/pop_up/slide_up_pop_up.dart';
// import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
// import 'package:flutter_app_template/src/features/export/presentation/widgets/export_modal.dart';
// import 'package:flutter_app_template/src/features/writer/data/models/text_analysis_model.dart';

// class HumanizationResultModal {
//   static void show(
//     BuildContext context, {
//     required HumanizationResult result,
//   }) {
//     FocusScope.of(context).unfocus();
//     SlideUpPopUp.show(
//       context: context,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const Icon(Icons.person, color: Colors.green, size: 32),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Text Humanized',
//                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                               color: Colors.green,
//                             ),
//                       ),
//                       Text(
//                         '${(result.humanLike * 100).toStringAsFixed(1)}% human-like',
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                               color: Colors.grey[600],
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   icon: const Icon(Icons.close),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Before/After comparison
//             const Text('Before/After Comparison:', style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 12),

//             // Original text
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.red.shade50,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.red.shade200),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Original Text:',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red.shade700,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(result.originalText),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             // Humanized text
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.green.shade50,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.green.shade200),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Humanized Text:',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green.shade700,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(result.humanizedText),
//                 ],
//               ),
//             ),

//             if (result.explanation != null) ...[
//               const SizedBox(height: 20),
//               const Text('Explanation:', style: TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               Text(
//                 result.explanation!,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//             ],

//             if (result.changes != null && result.changes!.isNotEmpty) ...[
//               const SizedBox(height: 20),
//               const Text('Changes Made:', style: TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               ...result.changes!.map((change) => Padding(
//                     padding: const EdgeInsets.only(bottom: 6),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.check, size: 16, color: Colors.green),
//                         const SizedBox(width: 8),
//                         Expanded(child: Text(change)),
//                       ],
//                     ),
//                   )),
//             ],

//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: AppButton(
//                     onPressed: () {
//                       // Copy humanized text to clipboard
//                       Clipboard.setData(ClipboardData(text: result.humanizedText));
//                       showTopAlert('copied to clipboard!');
//                     },
//                     label: 'Copy',
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: AppButton(
//                     onPressed: () {
//                       ExportModal.show(
//                         context,
//                         text: result.humanizedText,
//                         title: 'Humanized Text',
//                       );
//                     },
//                     label: 'Export',
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
