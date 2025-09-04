import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/components/forms/app_text_form_field.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_button.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

enum AIProvider { mock, openai, gemini }

class AIProviderSelector extends StatefulWidget {
  final AIProvider selectedProvider;
  final ValueChanged<AIProvider?> onChanged;
  final String? geminiApiKey;
  final String? Function(String) onGeminiApiKeyApply;

  const AIProviderSelector({
    super.key,
    required this.selectedProvider,
    required this.onChanged,
    this.geminiApiKey,
    required this.onGeminiApiKeyApply,
  });

  @override
  State<AIProviderSelector> createState() => _AIProviderSelectorState();
}

class _AIProviderSelectorState extends State<AIProviderSelector> {
  final TextEditingController _geminiApiKeyController = TextEditingController();

  String _getProviderDisplayName(AIProvider provider) {
    switch (provider) {
      case AIProvider.mock:
        return 'Mock (Offline Demo)';
      case AIProvider.openai:
        return 'OpenAI GPT';
      case AIProvider.gemini:
        return 'Google Gemini';
    }
  }

  @override
  void initState() {
    super.initState();
    _geminiApiKeyController.text = widget.geminiApiKey ?? '';
  }

  @override
  void dispose() {
    _geminiApiKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AI Provider (for testing)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButton<AIProvider>(
              value: widget.selectedProvider,
              onChanged: widget.onChanged,
              items: [AIProvider.openai, AIProvider.gemini].map((provider) {
                return DropdownMenuItem(
                  value: provider,
                  child: Text(_getProviderDisplayName(provider)),
                );
              }).toList(),
              isExpanded: true,
              dropdownColor: context.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),

            // Gemini API Key field (only show when Gemini is selected)
            if (widget.selectedProvider == AIProvider.gemini) ...[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: AppTextFormField(
                  controller: _geminiApiKeyController,
                  autofocus: true,
                  label: 'Gemini API Key',
                  hintText: 'Enter your Gemini API key',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Gemini API key is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              AppButton(
                onPressed: () {
                  widget.onGeminiApiKeyApply.call(_geminiApiKeyController.text);
                  showTopAlert('Gemini API key applied');
                },
                label: 'Apply',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
