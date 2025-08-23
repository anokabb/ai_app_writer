enum HumanizerTone { neutral, conversational, formal, academic }

enum TargetLength { shorter, same, longer }

class HumanizerOptions {
  final HumanizerTone tone;
  final double temperature;
  final TargetLength targetLength;
  final List<String> keepKeywords;

  const HumanizerOptions({
    this.tone = HumanizerTone.neutral,
    this.temperature = 0.7,
    this.targetLength = TargetLength.same,
    this.keepKeywords = const [],
  });

  HumanizerOptions copyWith({
    HumanizerTone? tone,
    double? temperature,
    TargetLength? targetLength,
    List<String>? keepKeywords,
  }) => HumanizerOptions(
        tone: tone ?? this.tone,
        temperature: temperature ?? this.temperature,
        targetLength: targetLength ?? this.targetLength,
        keepKeywords: keepKeywords ?? this.keepKeywords,
      );

  Map<String, dynamic> toJson() => {
        'tone': tone.name,
        'temperature': temperature,
        'targetLength': targetLength.name,
        'keepKeywords': keepKeywords,
      };
}