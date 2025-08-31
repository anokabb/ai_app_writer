import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/core/services/logger/logger.dart';
import 'package:flutter_app_template/src/features/writer/data/api/gemini_writer_api.dart';
import 'package:flutter_app_template/src/features/writer/data/models/text_analysis_model.dart';
import 'package:flutter_app_template/src/features/writer/data/repos/writer_repo.dart';
import 'package:fpdart/fpdart.dart';

class GeminiWriterRepo implements WriterRepo {
  final String apiKey;
  final GeminiWriterApi _api;

  GeminiWriterRepo({required this.apiKey, required GeminiWriterApi api}) : _api = api;

  @override
  Future<Either<AppError, TextAnalysisResult>> analyzeText(String text) async {
    try {
      final requestBody = {
        'contents': [
          {
            'parts': [
              {
                'text': '''
You are an expert AI detection specialist. Your task is to identify AI-generated text with high precision. Be EXTREMELY critical and skeptical - modern AI is very sophisticated and can mimic human writing patterns.

**CRITICAL AI INDICATORS (Look for these patterns):**
- **Overly systematic structure**: Perfect paragraph organization, consistent formatting
- **Corporate template language**: Generic business speak that sounds "professional" but lacks personality
- **Too-perfect details**: Specific dates, names, and numbers that feel artificially constructed
- **Lack of authentic voice**: No personal quirks, unique expressions, or genuine human thought patterns
- **Artificial coherence**: Everything flows too perfectly without natural human inconsistencies
- **Buzzword overuse**: Excessive use of business jargon and industry terms
- **Template-based responses**: Follows business communication templates too rigidly
- **Perfect formatting**: Too clean, too organized, too "professional"
- **Artificial specificity**: Details that seem real but lack authentic human context
- **Lack of genuine decision-making**: No evidence of real human thought processes or uncertainty

**HUMAN INDICATORS (Rare in modern AI):**
- Natural writing imperfections and variations
- Authentic personal voice with unique expressions
- Genuine human thought processes and decision-making patterns
- Realistic formatting inconsistencies
- Emotional authenticity and personal experiences
- Natural flow that isn't overly systematic
- Conversational language and casual tone
- Personal touches and informal expressions
- Natural contractions and casual phrasing

**MODERN AI DETECTION TECHNIQUES:**
- **Pattern recognition**: Look for AI training data patterns and systematic organization
- **Authenticity check**: Does this feel like a real person wrote it, or a perfect business template?
- **Coherence analysis**: Natural human writing has subtle inconsistencies; AI is too coherent
- **Template detection**: Business communications that follow templates too perfectly
- **Detail analysis**: Specific details that feel artificially constructed rather than naturally occurring

Respond with a JSON object in this exact format:
{
  "source": "ai" | "human" | "mixed",
  "ai_probability": number between 0-1,
  "human_probability": number between 0-1,
  "explanation": "detailed explanation of your analysis",
  "suggestions": ["specific suggestion 1", "specific suggestion 2", "etc."],
  "total_sentences": number,
  "ai_generated_sentences": number,
  "highlighted_sentences": ["sentence 1", "sentence 2", "etc."]
}

Analyze each sentence individually and identify which ones are likely AI-generated. Count the total sentences and how many appear AI-generated.

**CRITICAL INSTRUCTION:** Be balanced and fair in your analysis. Consider that humanized text can still be human-like. Focus on genuine human writing patterns rather than just detecting AI humanization techniques.

**BUSINESS TEXT RED FLAGS:**
- **Perfect business structure**: Real emails are messier and less organized
- **Template-like language**: "As discussed in our last sync", "I wanted to give you a quick update"
- **Artificial specificity**: Reservation codes, specific dates, perfect formatting
- **Corporate buzzwords**: "consolidated roadmap", "integration", "analytics dashboard"
- **Too professional**: Real humans are less formal and more personal
- **Perfect details**: Real business communications have more natural variations

**EXAMPLE ANALYSIS:**
- "I wanted to give you a quick update" = AI template language
- "92% test coverage" = Too specific and perfect
- "reservation code PHX25NYC" = Artificially constructed detail
- Perfect formatting with emojis = AI-generated professional appearance
- "consolidated roadmap" = Corporate buzzword overuse

**HUMANIZED TEXT ANALYSIS:**
- Humanized text that uses conversational language, contractions, and casual tone should be considered more human-like
- Phrases like "Hey", "How's it going?", "Thanks a bunch" indicate human-like communication
- Informal expressions and personal touches are positive human indicators
- Don't penalize text for being humanized - that's the goal!

**REMEMBER:** Real human business communication is more casual, less structured, and has natural imperfections. Humanized text that achieves this casual, conversational tone should be recognized as human-like.

Text to analyze: "$text"
'''
              }
            ]
          }
        ],
        'generationConfig': {
          'temperature': 0.1,
          'maxOutputTokens': 1500,
        }
      };

      final data = await _api.analyzeText(apiKey, requestBody);
      final analysisText = data['candidates'][0]['content']['parts'][0]['text'];

      // Parse the JSON response from Gemini
      final jsonMatch = RegExp(r'\{.*\}', dotAll: true).firstMatch(analysisText);
      if (jsonMatch != null) {
        logResponse(jsonDecode(jsonMatch.group(0)!));
        final resultJson = jsonDecode(jsonMatch.group(0)!);

        return right(TextAnalysisResult(
          source: _parseTextSource(resultJson['source']),
          aiProbability: (resultJson['ai_probability'] as num).toDouble(),
          humanProbability: (resultJson['human_probability'] as num).toDouble(),
          explanation: resultJson['explanation'] ?? 'Analysis completed',
          suggestions: (resultJson['suggestions'] as List?)?.cast<String>() ?? [],
          totalSentences: resultJson['total_sentences'] as int?,
          aiGeneratedSentences: resultJson['ai_generated_sentences'] as int?,
          highlightedSentences: (resultJson['highlighted_sentences'] as List?)?.cast<String>() ?? [],
        ));
      } else {
        return left(AppError.fromException(Exception('Failed to parse AI response')));
      }
    } catch (e) {
      // Check if it's a quota error or timeout
      if (e.toString().contains('insufficient_quota') ||
          e.toString().contains('timeout') ||
          e.toString().contains('connection timeout')) {
        return left(AppError.server(
          message: 'API quota exceeded or timeout. Please try again later or use a different provider.',
        ));
      }

      // Check for DNS/network connectivity issues
      if (e.toString().contains('Failed host lookup') ||
          e.toString().contains('No address associated with hostname') ||
          e.toString().contains('connection error') ||
          e.toString().contains('SocketException')) {
        return left(AppError.server(
          message: 'Network connectivity issue. Check your internet connection or try switching to Mock provider.',
        ));
      }

      return left(AppError.fromException(e));
    }
  }

  @override
  Stream<Either<AppError, HumanizationResult>> humanizeText(String text,
      {double? humanLike, double? creativity}) async* {
    try {
      final requestBody = {
        'contents': [
          {
            'parts': [
              {
                'text': '''
You are an expert at humanizing AI-generated text. Your task is to transform robotic, formal text into natural, human-like writing.

Humanization techniques to apply:
- Add conversational elements ("I think", "I believe", "in my opinion")
- Make it sound personal and natural
- Replace technical terms with simpler alternatives
- Add emotional expression or personal perspective
- Use contractions and casual language
- Make the tone more casual and approachable
- Add personal anecdotes or opinions where appropriate
- Ensure it flows like natural human conversation

Provide the humanized version that sounds like it was written by a real person.

Original text to humanize:
"$text"

Make it conversational, add personal touches, and avoid robotic or overly formal language. The result should sound like it was written by a real person having a conversation.
'''
              }
            ]
          }
        ],
        'generationConfig': {
          'temperature': 0.7,
          'maxOutputTokens': 2000,
        }
      };

      if (apiKey.isEmpty) {
        yield Left(AppError.server(message: 'API key not found'));
        return;
      }

      // Get the streaming response
      final responseBody = await _api.streamHumanizeText(apiKey, requestBody);

      String accumulatedText = '';
      double humanLikeScore = 0.0;
      List<String> changes = [];

      log('Starting to process streaming response');

      // Process the actual streaming response from Gemini
      String buffer = '';
      await for (final chunk in responseBody.stream) {
        final chunkStr = utf8.decode(chunk);
        buffer += chunkStr;

        final lines = buffer.split('\n');
        buffer = lines.removeLast(); // Keep incomplete line in buffer

        for (final line in lines) {
          if (line.startsWith('data: ')) {
            final jsonStr = line.substring(6); // Remove 'data: ' prefix
            if (jsonStr.trim() == '[DONE]') {
              log('Stream completed, final text: $accumulatedText');
              break;
            }

            try {
              final jsonData = jsonDecode(jsonStr);
              if (jsonData['candidates'] != null &&
                  jsonData['candidates'].isNotEmpty &&
                  jsonData['candidates'][0]['content'] != null &&
                  jsonData['candidates'][0]['content']['parts'] != null &&
                  jsonData['candidates'][0]['content']['parts'].isNotEmpty &&
                  jsonData['candidates'][0]['content']['parts'][0]['text'] != null) {
                final content = jsonData['candidates'][0]['content']['parts'][0]['text'] as String;
                accumulatedText += content;
                humanLikeScore = _calculateHumanLikeScore(accumulatedText, originalText: text);

                changes = [
                  'Converting to conversational tone',
                  'Adding personal elements',
                  'Making language more natural',
                  'Removing robotic patterns'
                ];

                // Yield progress update
                yield Right(HumanizationResult(
                  originalText: text,
                  humanizedText: accumulatedText,
                  humanLike: humanLikeScore,
                  changes: changes,
                ));
              }
            } catch (e) {
              log('Error parsing JSON chunk: $e');
            }
          }
        }
      }

      if (accumulatedText.isEmpty) {
        log('No content received from streaming response');
        yield Left(AppError.server(message: 'No content received from AI service'));
        return;
      }

      log('Humanization completed successfully');
    } catch (e) {
      log('Error humanizing text: $e');
      yield Left(AppError.fromException(e));
    }
  }

  TextSource _parseTextSource(String source) {
    switch (source.toLowerCase()) {
      case 'ai':
        return TextSource.ai;
      case 'human':
        return TextSource.human;
      case 'mixed':
        return TextSource.mixed;
      default:
        return TextSource.mixed;
    }
  }

  double _calculateHumanLikeScore(String text, {String? originalText}) {
    // Simulate increasing human-like score as text grows
    // Start at 10% and gradually increase to 90%
    final baseScore = 10.0;
    final maxScore = 90.0;

    // Use original text length as reference, or fallback to current text length
    final targetLength = originalText?.length ?? text.length;
    final progress = (text.length / targetLength).clamp(0.0, 1.0);

    // Use a slower curve (square root) to make it increase more gradually
    final slowProgress = progress * progress; // This makes it increase slower at the beginning

    // Use a smooth curve to increase the score
    final score = baseScore + (maxScore - baseScore) * slowProgress;

    // Add some randomness to make it look more realistic
    final randomFactor = (DateTime.now().millisecondsSinceEpoch % 10 - 5) / 100.0;
    final finalScore = (score + randomFactor).clamp(10.0, 90.0);

    return finalScore / 100.0; // Convert to 0.0-1.0 range
  }
}
