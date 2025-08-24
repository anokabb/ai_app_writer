import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WriterPage extends StatefulWidget {
  static const String routeName = '/writer';
  const WriterPage({super.key});

  @override
  State<WriterPage> createState() => _WriterPageState();
}

class _WriterPageState extends State<WriterPage> {
  final TextEditingController _controller = TextEditingController();
  String? _lastText; // for revert capability
  bool _isLoadingScan = false;
  bool _isLoadingHumanize = false;
  double? _score;
  List<String>? _reasons;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _pasteFromClipboard() async {
    final data = await Clipboard.getData('text/plain');
    final text = data?.text ?? '';
    _controller.text = text;
  }

  Future<void> _scan() async {
    setState(() {
      _isLoadingScan = true;
      _score = null;
      _reasons = null;
    });
    try {
      // TODO: integrate LlmClient classify
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _score = 0.42;
        _reasons = ['Reason 1', 'Reason 2'];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoadingScan = false;
      });
    }
  }

  Future<void> _humanize() async {
    setState(() {
      _isLoadingHumanize = true;
    });
    final currentText = _controller.text;
    _lastText = currentText;
    try {
      // TODO: integrate LlmClient complete
      await Future.delayed(const Duration(seconds: 1));
      _controller.text = '$currentText\n\n(Humanized)';
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoadingHumanize = false;
      });
    }
  }

  void _revert() {
    if (_lastText != null) {
      _controller.text = _lastText!;
      _lastText = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTextEmpty = _controller.text.trim().isEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('AI Writer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: 'Paste or type your text…',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: isTextEmpty || _isLoadingScan ? null : _scan,
                    child: _isLoadingScan
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator())
                        : const Text('Scan'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isTextEmpty || _isLoadingHumanize ? null : _humanize,
                    child: _isLoadingHumanize
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator())
                        : const Text('Humanize'),
                  ),
                ),
              ],
            ),
            if (_lastText != null)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ActionChip(
                    label: const Text('Revert'),
                    onPressed: _revert,
                  ),
                ),
              ),
            if (_score != null)
              Card(
                margin: const EdgeInsets.only(top: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Score: ${_score!.toStringAsFixed(2)}', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 8),
                      if (_reasons != null)
                        ..._reasons!.map((r) => Text('• $r')).toList(),
                      const SizedBox(height: 8),
                      const Text(
                        'Detection is indicative and may be inaccurate',
                        style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: isTextEmpty
          ? FloatingActionButton(
              onPressed: _pasteFromClipboard,
              child: const Icon(Icons.paste),
            )
          : null,
    );
  }
}