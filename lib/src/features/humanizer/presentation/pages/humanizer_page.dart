import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_app_template/src/core/components/layouts/default_layout.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/features/export/services/export_service.dart';
import 'package:flutter_app_template/src/features/humanizer/domain/humanizer_options.dart';
import 'package:flutter_app_template/src/features/humanizer/presentation/cubit/humanizer_cubit.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';

class HumanizerPage extends StatefulWidget {
  static const String routeName = '/humanizer';
  const HumanizerPage({super.key});

  @override
  State<HumanizerPage> createState() => _HumanizerPageState();
}

class _HumanizerPageState extends State<HumanizerPage> {
  final _inputController = TextEditingController();
  final _keywordsController = TextEditingController();
  HumanizerOptions _options = const HumanizerOptions();

  @override
  void dispose() {
    _inputController.dispose();
    _keywordsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HumanizerCubit(),
      child: DefaultLayout(
        title: 'Humanizer',
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share_outlined),
            onPressed: () async {
              final state = context.read<HumanizerCubit>().state;
              final text = state.output ?? _inputController.text;
              await locator<ExportService>().shareText(text, format: ExportFormat.txt);
            },
          )
        ],
        child: BlocBuilder<HumanizerCubit, HumanizerState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Input'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _inputController,
                    maxLines: 8,
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _toneDropdown()),
                      const SizedBox(width: 12),
                      Expanded(child: _lengthDropdown()),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Temperature: ${_options.temperature.toStringAsFixed(2)}'),
                  Slider(
                    value: _options.temperature,
                    onChanged: (v) => setState(() => _options = _options.copyWith(temperature: v)),
                    min: 0,
                    max: 1,
                  ),
                  const SizedBox(height: 12),
                  Text('Keep keywords (comma-separated)'),
                  TextField(
                    controller: _keywordsController,
                    decoration: const InputDecoration(hintText: 'e.g., revenue, ARR, churn')
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : () => _onRewrite(context),
                        child: Text(state.isLoading ? 'Rewriting...' : 'Re-run'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () async {
                          final text = state.output ?? '';
                          await locator<ExportService>().copyToClipboard(text);
                          context.showSnackBar('Copied');
                        },
                        child: const Text('Copy'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () async {
                          final text = state.output ?? '';
                          await locator<ExportService>().shareText(text, format: ExportFormat.md);
                        },
                        child: const Text('Export'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (state.error != null) Text(state.error!, style: const TextStyle(color: Colors.red)),
                  if (state.output != null) ...[
                    Text('Output'),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
                      child: Text(state.output!),
                    ),
                    const SizedBox(height: 12),
                    Text('Diff'),
                    const SizedBox(height: 8),
                    _buildDiff(state),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _toneDropdown() {
    return DropdownButtonFormField<HumanizerTone>(
      value: _options.tone,
      onChanged: (v) => setState(() => _options = _options.copyWith(tone: v)),
      items: HumanizerTone.values.map((t) => DropdownMenuItem(value: t, child: Text(t.name))).toList(),
      decoration: const InputDecoration(labelText: 'Tone', border: OutlineInputBorder()),
    );
  }

  Widget _lengthDropdown() {
    return DropdownButtonFormField<TargetLength>(
      value: _options.targetLength,
      onChanged: (v) => setState(() => _options = _options.copyWith(targetLength: v)),
      items: TargetLength.values.map((t) => DropdownMenuItem(value: t, child: Text(t.name))).toList(),
      decoration: const InputDecoration(labelText: 'Length', border: OutlineInputBorder()),
    );
  }

  Widget _buildDiff(HumanizerState state) {
    final diffs = state.diffs ?? [];
    return Wrap(
      spacing: 2,
      runSpacing: 8,
      children: diffs.map((d) {
        final text = d.text;
        switch (d.operation) {
          case DIFF_INSERT:
            return Container(color: Colors.green.withOpacity(0.2), child: Text(text));
          case DIFF_DELETE:
            return Container(color: Colors.red.withOpacity(0.2), child: Text(text));
          case DIFF_EQUAL:
          default:
            return Text(text);
        }
      }).toList(),
    );
  }

  void _onRewrite(BuildContext context) {
    final input = _inputController.text.trim();
    final keywords = _keywordsController.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    final opts = _options.copyWith(keepKeywords: keywords);
    context.read<HumanizerCubit>().rewrite(input: input, options: opts);
  }
}