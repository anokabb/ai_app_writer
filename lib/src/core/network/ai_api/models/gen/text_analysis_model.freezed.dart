// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../text_analysis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextAnalysisRequest _$TextAnalysisRequestFromJson(Map<String, dynamic> json) {
  return _TextAnalysisRequest.fromJson(json);
}

/// @nodoc
mixin _$TextAnalysisRequest {
  String get text => throw _privateConstructorUsedError;

  /// Serializes this TextAnalysisRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TextAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextAnalysisRequestCopyWith<TextAnalysisRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextAnalysisRequestCopyWith<$Res> {
  factory $TextAnalysisRequestCopyWith(
          TextAnalysisRequest value, $Res Function(TextAnalysisRequest) then) =
      _$TextAnalysisRequestCopyWithImpl<$Res, TextAnalysisRequest>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$TextAnalysisRequestCopyWithImpl<$Res, $Val extends TextAnalysisRequest>
    implements $TextAnalysisRequestCopyWith<$Res> {
  _$TextAnalysisRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextAnalysisRequestImplCopyWith<$Res>
    implements $TextAnalysisRequestCopyWith<$Res> {
  factory _$$TextAnalysisRequestImplCopyWith(_$TextAnalysisRequestImpl value,
          $Res Function(_$TextAnalysisRequestImpl) then) =
      __$$TextAnalysisRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$TextAnalysisRequestImplCopyWithImpl<$Res>
    extends _$TextAnalysisRequestCopyWithImpl<$Res, _$TextAnalysisRequestImpl>
    implements _$$TextAnalysisRequestImplCopyWith<$Res> {
  __$$TextAnalysisRequestImplCopyWithImpl(_$TextAnalysisRequestImpl _value,
      $Res Function(_$TextAnalysisRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$TextAnalysisRequestImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextAnalysisRequestImpl implements _TextAnalysisRequest {
  const _$TextAnalysisRequestImpl({required this.text});

  factory _$TextAnalysisRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextAnalysisRequestImplFromJson(json);

  @override
  final String text;

  @override
  String toString() {
    return 'TextAnalysisRequest(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextAnalysisRequestImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of TextAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextAnalysisRequestImplCopyWith<_$TextAnalysisRequestImpl> get copyWith =>
      __$$TextAnalysisRequestImplCopyWithImpl<_$TextAnalysisRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextAnalysisRequestImplToJson(
      this,
    );
  }
}

abstract class _TextAnalysisRequest implements TextAnalysisRequest {
  const factory _TextAnalysisRequest({required final String text}) =
      _$TextAnalysisRequestImpl;

  factory _TextAnalysisRequest.fromJson(Map<String, dynamic> json) =
      _$TextAnalysisRequestImpl.fromJson;

  @override
  String get text;

  /// Create a copy of TextAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextAnalysisRequestImplCopyWith<_$TextAnalysisRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HumanizationRequest _$HumanizationRequestFromJson(Map<String, dynamic> json) {
  return _HumanizationRequest.fromJson(json);
}

/// @nodoc
mixin _$HumanizationRequest {
  String get text => throw _privateConstructorUsedError;
  double? get humanLike => throw _privateConstructorUsedError;
  double? get creativity => throw _privateConstructorUsedError;

  /// Serializes this HumanizationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HumanizationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HumanizationRequestCopyWith<HumanizationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HumanizationRequestCopyWith<$Res> {
  factory $HumanizationRequestCopyWith(
          HumanizationRequest value, $Res Function(HumanizationRequest) then) =
      _$HumanizationRequestCopyWithImpl<$Res, HumanizationRequest>;
  @useResult
  $Res call({String text, double? humanLike, double? creativity});
}

/// @nodoc
class _$HumanizationRequestCopyWithImpl<$Res, $Val extends HumanizationRequest>
    implements $HumanizationRequestCopyWith<$Res> {
  _$HumanizationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HumanizationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? humanLike = freezed,
    Object? creativity = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      humanLike: freezed == humanLike
          ? _value.humanLike
          : humanLike // ignore: cast_nullable_to_non_nullable
              as double?,
      creativity: freezed == creativity
          ? _value.creativity
          : creativity // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HumanizationRequestImplCopyWith<$Res>
    implements $HumanizationRequestCopyWith<$Res> {
  factory _$$HumanizationRequestImplCopyWith(_$HumanizationRequestImpl value,
          $Res Function(_$HumanizationRequestImpl) then) =
      __$$HumanizationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, double? humanLike, double? creativity});
}

/// @nodoc
class __$$HumanizationRequestImplCopyWithImpl<$Res>
    extends _$HumanizationRequestCopyWithImpl<$Res, _$HumanizationRequestImpl>
    implements _$$HumanizationRequestImplCopyWith<$Res> {
  __$$HumanizationRequestImplCopyWithImpl(_$HumanizationRequestImpl _value,
      $Res Function(_$HumanizationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of HumanizationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? humanLike = freezed,
    Object? creativity = freezed,
  }) {
    return _then(_$HumanizationRequestImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      humanLike: freezed == humanLike
          ? _value.humanLike
          : humanLike // ignore: cast_nullable_to_non_nullable
              as double?,
      creativity: freezed == creativity
          ? _value.creativity
          : creativity // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HumanizationRequestImpl implements _HumanizationRequest {
  const _$HumanizationRequestImpl(
      {required this.text, this.humanLike, this.creativity});

  factory _$HumanizationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$HumanizationRequestImplFromJson(json);

  @override
  final String text;
  @override
  final double? humanLike;
  @override
  final double? creativity;

  @override
  String toString() {
    return 'HumanizationRequest(text: $text, humanLike: $humanLike, creativity: $creativity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HumanizationRequestImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.humanLike, humanLike) ||
                other.humanLike == humanLike) &&
            (identical(other.creativity, creativity) ||
                other.creativity == creativity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, humanLike, creativity);

  /// Create a copy of HumanizationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HumanizationRequestImplCopyWith<_$HumanizationRequestImpl> get copyWith =>
      __$$HumanizationRequestImplCopyWithImpl<_$HumanizationRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HumanizationRequestImplToJson(
      this,
    );
  }
}

abstract class _HumanizationRequest implements HumanizationRequest {
  const factory _HumanizationRequest(
      {required final String text,
      final double? humanLike,
      final double? creativity}) = _$HumanizationRequestImpl;

  factory _HumanizationRequest.fromJson(Map<String, dynamic> json) =
      _$HumanizationRequestImpl.fromJson;

  @override
  String get text;
  @override
  double? get humanLike;
  @override
  double? get creativity;

  /// Create a copy of HumanizationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HumanizationRequestImplCopyWith<_$HumanizationRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentGenerationRequest _$ContentGenerationRequestFromJson(
    Map<String, dynamic> json) {
  return _ContentGenerationRequest.fromJson(json);
}

/// @nodoc
mixin _$ContentGenerationRequest {
  String get text => throw _privateConstructorUsedError;
  String get typeOfWriting => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  int get wordCount => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  /// Serializes this ContentGenerationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentGenerationRequestCopyWith<ContentGenerationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentGenerationRequestCopyWith<$Res> {
  factory $ContentGenerationRequestCopyWith(ContentGenerationRequest value,
          $Res Function(ContentGenerationRequest) then) =
      _$ContentGenerationRequestCopyWithImpl<$Res, ContentGenerationRequest>;
  @useResult
  $Res call(
      {String text,
      String typeOfWriting,
      String tone,
      int wordCount,
      String language});
}

/// @nodoc
class _$ContentGenerationRequestCopyWithImpl<$Res,
        $Val extends ContentGenerationRequest>
    implements $ContentGenerationRequestCopyWith<$Res> {
  _$ContentGenerationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? typeOfWriting = null,
    Object? tone = null,
    Object? wordCount = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfWriting: null == typeOfWriting
          ? _value.typeOfWriting
          : typeOfWriting // ignore: cast_nullable_to_non_nullable
              as String,
      tone: null == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as String,
      wordCount: null == wordCount
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentGenerationRequestImplCopyWith<$Res>
    implements $ContentGenerationRequestCopyWith<$Res> {
  factory _$$ContentGenerationRequestImplCopyWith(
          _$ContentGenerationRequestImpl value,
          $Res Function(_$ContentGenerationRequestImpl) then) =
      __$$ContentGenerationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      String typeOfWriting,
      String tone,
      int wordCount,
      String language});
}

/// @nodoc
class __$$ContentGenerationRequestImplCopyWithImpl<$Res>
    extends _$ContentGenerationRequestCopyWithImpl<$Res,
        _$ContentGenerationRequestImpl>
    implements _$$ContentGenerationRequestImplCopyWith<$Res> {
  __$$ContentGenerationRequestImplCopyWithImpl(
      _$ContentGenerationRequestImpl _value,
      $Res Function(_$ContentGenerationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? typeOfWriting = null,
    Object? tone = null,
    Object? wordCount = null,
    Object? language = null,
  }) {
    return _then(_$ContentGenerationRequestImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfWriting: null == typeOfWriting
          ? _value.typeOfWriting
          : typeOfWriting // ignore: cast_nullable_to_non_nullable
              as String,
      tone: null == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as String,
      wordCount: null == wordCount
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentGenerationRequestImpl implements _ContentGenerationRequest {
  const _$ContentGenerationRequestImpl(
      {required this.text,
      required this.typeOfWriting,
      required this.tone,
      required this.wordCount,
      required this.language});

  factory _$ContentGenerationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentGenerationRequestImplFromJson(json);

  @override
  final String text;
  @override
  final String typeOfWriting;
  @override
  final String tone;
  @override
  final int wordCount;
  @override
  final String language;

  @override
  String toString() {
    return 'ContentGenerationRequest(text: $text, typeOfWriting: $typeOfWriting, tone: $tone, wordCount: $wordCount, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentGenerationRequestImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.typeOfWriting, typeOfWriting) ||
                other.typeOfWriting == typeOfWriting) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.wordCount, wordCount) ||
                other.wordCount == wordCount) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, typeOfWriting, tone, wordCount, language);

  /// Create a copy of ContentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentGenerationRequestImplCopyWith<_$ContentGenerationRequestImpl>
      get copyWith => __$$ContentGenerationRequestImplCopyWithImpl<
          _$ContentGenerationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentGenerationRequestImplToJson(
      this,
    );
  }
}

abstract class _ContentGenerationRequest implements ContentGenerationRequest {
  const factory _ContentGenerationRequest(
      {required final String text,
      required final String typeOfWriting,
      required final String tone,
      required final int wordCount,
      required final String language}) = _$ContentGenerationRequestImpl;

  factory _ContentGenerationRequest.fromJson(Map<String, dynamic> json) =
      _$ContentGenerationRequestImpl.fromJson;

  @override
  String get text;
  @override
  String get typeOfWriting;
  @override
  String get tone;
  @override
  int get wordCount;
  @override
  String get language;

  /// Create a copy of ContentGenerationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentGenerationRequestImplCopyWith<_$ContentGenerationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TextAnalysisResult _$TextAnalysisResultFromJson(Map<String, dynamic> json) {
  return _TextAnalysisResult.fromJson(json);
}

/// @nodoc
mixin _$TextAnalysisResult {
  TextSource get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_probability')
  double get aiProbability => throw _privateConstructorUsedError;
  @JsonKey(name: 'human_probability')
  double get humanProbability => throw _privateConstructorUsedError;
  List<String>? get suggestions => throw _privateConstructorUsedError;
  String? get explanation =>
      throw _privateConstructorUsedError; // Enhanced fields for detailed analysis
  @JsonKey(name: 'total_sentences')
  int? get totalSentences => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_generated_sentences')
  int? get aiGeneratedSentences => throw _privateConstructorUsedError;
  @JsonKey(name: 'highlighted_sentences')
  List<String>? get highlightedSentences => throw _privateConstructorUsedError;
  @JsonKey(name: 'detailed_title')
  String? get detailedTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary_text')
  String? get summaryText => throw _privateConstructorUsedError;

  /// Serializes this TextAnalysisResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TextAnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextAnalysisResultCopyWith<TextAnalysisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextAnalysisResultCopyWith<$Res> {
  factory $TextAnalysisResultCopyWith(
          TextAnalysisResult value, $Res Function(TextAnalysisResult) then) =
      _$TextAnalysisResultCopyWithImpl<$Res, TextAnalysisResult>;
  @useResult
  $Res call(
      {TextSource source,
      @JsonKey(name: 'ai_probability') double aiProbability,
      @JsonKey(name: 'human_probability') double humanProbability,
      List<String>? suggestions,
      String? explanation,
      @JsonKey(name: 'total_sentences') int? totalSentences,
      @JsonKey(name: 'ai_generated_sentences') int? aiGeneratedSentences,
      @JsonKey(name: 'highlighted_sentences')
      List<String>? highlightedSentences,
      @JsonKey(name: 'detailed_title') String? detailedTitle,
      @JsonKey(name: 'summary_text') String? summaryText});
}

/// @nodoc
class _$TextAnalysisResultCopyWithImpl<$Res, $Val extends TextAnalysisResult>
    implements $TextAnalysisResultCopyWith<$Res> {
  _$TextAnalysisResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextAnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? aiProbability = null,
    Object? humanProbability = null,
    Object? suggestions = freezed,
    Object? explanation = freezed,
    Object? totalSentences = freezed,
    Object? aiGeneratedSentences = freezed,
    Object? highlightedSentences = freezed,
    Object? detailedTitle = freezed,
    Object? summaryText = freezed,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as TextSource,
      aiProbability: null == aiProbability
          ? _value.aiProbability
          : aiProbability // ignore: cast_nullable_to_non_nullable
              as double,
      humanProbability: null == humanProbability
          ? _value.humanProbability
          : humanProbability // ignore: cast_nullable_to_non_nullable
              as double,
      suggestions: freezed == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSentences: freezed == totalSentences
          ? _value.totalSentences
          : totalSentences // ignore: cast_nullable_to_non_nullable
              as int?,
      aiGeneratedSentences: freezed == aiGeneratedSentences
          ? _value.aiGeneratedSentences
          : aiGeneratedSentences // ignore: cast_nullable_to_non_nullable
              as int?,
      highlightedSentences: freezed == highlightedSentences
          ? _value.highlightedSentences
          : highlightedSentences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      detailedTitle: freezed == detailedTitle
          ? _value.detailedTitle
          : detailedTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryText: freezed == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextAnalysisResultImplCopyWith<$Res>
    implements $TextAnalysisResultCopyWith<$Res> {
  factory _$$TextAnalysisResultImplCopyWith(_$TextAnalysisResultImpl value,
          $Res Function(_$TextAnalysisResultImpl) then) =
      __$$TextAnalysisResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextSource source,
      @JsonKey(name: 'ai_probability') double aiProbability,
      @JsonKey(name: 'human_probability') double humanProbability,
      List<String>? suggestions,
      String? explanation,
      @JsonKey(name: 'total_sentences') int? totalSentences,
      @JsonKey(name: 'ai_generated_sentences') int? aiGeneratedSentences,
      @JsonKey(name: 'highlighted_sentences')
      List<String>? highlightedSentences,
      @JsonKey(name: 'detailed_title') String? detailedTitle,
      @JsonKey(name: 'summary_text') String? summaryText});
}

/// @nodoc
class __$$TextAnalysisResultImplCopyWithImpl<$Res>
    extends _$TextAnalysisResultCopyWithImpl<$Res, _$TextAnalysisResultImpl>
    implements _$$TextAnalysisResultImplCopyWith<$Res> {
  __$$TextAnalysisResultImplCopyWithImpl(_$TextAnalysisResultImpl _value,
      $Res Function(_$TextAnalysisResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextAnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? aiProbability = null,
    Object? humanProbability = null,
    Object? suggestions = freezed,
    Object? explanation = freezed,
    Object? totalSentences = freezed,
    Object? aiGeneratedSentences = freezed,
    Object? highlightedSentences = freezed,
    Object? detailedTitle = freezed,
    Object? summaryText = freezed,
  }) {
    return _then(_$TextAnalysisResultImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as TextSource,
      aiProbability: null == aiProbability
          ? _value.aiProbability
          : aiProbability // ignore: cast_nullable_to_non_nullable
              as double,
      humanProbability: null == humanProbability
          ? _value.humanProbability
          : humanProbability // ignore: cast_nullable_to_non_nullable
              as double,
      suggestions: freezed == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSentences: freezed == totalSentences
          ? _value.totalSentences
          : totalSentences // ignore: cast_nullable_to_non_nullable
              as int?,
      aiGeneratedSentences: freezed == aiGeneratedSentences
          ? _value.aiGeneratedSentences
          : aiGeneratedSentences // ignore: cast_nullable_to_non_nullable
              as int?,
      highlightedSentences: freezed == highlightedSentences
          ? _value._highlightedSentences
          : highlightedSentences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      detailedTitle: freezed == detailedTitle
          ? _value.detailedTitle
          : detailedTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      summaryText: freezed == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextAnalysisResultImpl extends _TextAnalysisResult {
  const _$TextAnalysisResultImpl(
      {required this.source,
      @JsonKey(name: 'ai_probability') required this.aiProbability,
      @JsonKey(name: 'human_probability') required this.humanProbability,
      final List<String>? suggestions,
      this.explanation,
      @JsonKey(name: 'total_sentences') this.totalSentences,
      @JsonKey(name: 'ai_generated_sentences') this.aiGeneratedSentences,
      @JsonKey(name: 'highlighted_sentences')
      final List<String>? highlightedSentences,
      @JsonKey(name: 'detailed_title') this.detailedTitle,
      @JsonKey(name: 'summary_text') this.summaryText})
      : _suggestions = suggestions,
        _highlightedSentences = highlightedSentences,
        super._();

  factory _$TextAnalysisResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextAnalysisResultImplFromJson(json);

  @override
  final TextSource source;
  @override
  @JsonKey(name: 'ai_probability')
  final double aiProbability;
  @override
  @JsonKey(name: 'human_probability')
  final double humanProbability;
  final List<String>? _suggestions;
  @override
  List<String>? get suggestions {
    final value = _suggestions;
    if (value == null) return null;
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? explanation;
// Enhanced fields for detailed analysis
  @override
  @JsonKey(name: 'total_sentences')
  final int? totalSentences;
  @override
  @JsonKey(name: 'ai_generated_sentences')
  final int? aiGeneratedSentences;
  final List<String>? _highlightedSentences;
  @override
  @JsonKey(name: 'highlighted_sentences')
  List<String>? get highlightedSentences {
    final value = _highlightedSentences;
    if (value == null) return null;
    if (_highlightedSentences is EqualUnmodifiableListView)
      return _highlightedSentences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'detailed_title')
  final String? detailedTitle;
  @override
  @JsonKey(name: 'summary_text')
  final String? summaryText;

  @override
  String toString() {
    return 'TextAnalysisResult(source: $source, aiProbability: $aiProbability, humanProbability: $humanProbability, suggestions: $suggestions, explanation: $explanation, totalSentences: $totalSentences, aiGeneratedSentences: $aiGeneratedSentences, highlightedSentences: $highlightedSentences, detailedTitle: $detailedTitle, summaryText: $summaryText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextAnalysisResultImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.aiProbability, aiProbability) ||
                other.aiProbability == aiProbability) &&
            (identical(other.humanProbability, humanProbability) ||
                other.humanProbability == humanProbability) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.totalSentences, totalSentences) ||
                other.totalSentences == totalSentences) &&
            (identical(other.aiGeneratedSentences, aiGeneratedSentences) ||
                other.aiGeneratedSentences == aiGeneratedSentences) &&
            const DeepCollectionEquality()
                .equals(other._highlightedSentences, _highlightedSentences) &&
            (identical(other.detailedTitle, detailedTitle) ||
                other.detailedTitle == detailedTitle) &&
            (identical(other.summaryText, summaryText) ||
                other.summaryText == summaryText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      source,
      aiProbability,
      humanProbability,
      const DeepCollectionEquality().hash(_suggestions),
      explanation,
      totalSentences,
      aiGeneratedSentences,
      const DeepCollectionEquality().hash(_highlightedSentences),
      detailedTitle,
      summaryText);

  /// Create a copy of TextAnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextAnalysisResultImplCopyWith<_$TextAnalysisResultImpl> get copyWith =>
      __$$TextAnalysisResultImplCopyWithImpl<_$TextAnalysisResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextAnalysisResultImplToJson(
      this,
    );
  }
}

abstract class _TextAnalysisResult extends TextAnalysisResult {
  const factory _TextAnalysisResult(
      {required final TextSource source,
      @JsonKey(name: 'ai_probability') required final double aiProbability,
      @JsonKey(name: 'human_probability')
      required final double humanProbability,
      final List<String>? suggestions,
      final String? explanation,
      @JsonKey(name: 'total_sentences') final int? totalSentences,
      @JsonKey(name: 'ai_generated_sentences') final int? aiGeneratedSentences,
      @JsonKey(name: 'highlighted_sentences')
      final List<String>? highlightedSentences,
      @JsonKey(name: 'detailed_title') final String? detailedTitle,
      @JsonKey(name: 'summary_text')
      final String? summaryText}) = _$TextAnalysisResultImpl;
  const _TextAnalysisResult._() : super._();

  factory _TextAnalysisResult.fromJson(Map<String, dynamic> json) =
      _$TextAnalysisResultImpl.fromJson;

  @override
  TextSource get source;
  @override
  @JsonKey(name: 'ai_probability')
  double get aiProbability;
  @override
  @JsonKey(name: 'human_probability')
  double get humanProbability;
  @override
  List<String>? get suggestions;
  @override
  String? get explanation; // Enhanced fields for detailed analysis
  @override
  @JsonKey(name: 'total_sentences')
  int? get totalSentences;
  @override
  @JsonKey(name: 'ai_generated_sentences')
  int? get aiGeneratedSentences;
  @override
  @JsonKey(name: 'highlighted_sentences')
  List<String>? get highlightedSentences;
  @override
  @JsonKey(name: 'detailed_title')
  String? get detailedTitle;
  @override
  @JsonKey(name: 'summary_text')
  String? get summaryText;

  /// Create a copy of TextAnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextAnalysisResultImplCopyWith<_$TextAnalysisResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HumanizationResult _$HumanizationResultFromJson(Map<String, dynamic> json) {
  return _HumanizationResult.fromJson(json);
}

/// @nodoc
mixin _$HumanizationResult {
  String get originalText => throw _privateConstructorUsedError;
  String get humanizedText => throw _privateConstructorUsedError;
  double get humanLike => throw _privateConstructorUsedError;
  List<String>? get changes => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;

  /// Serializes this HumanizationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HumanizationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HumanizationResultCopyWith<HumanizationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HumanizationResultCopyWith<$Res> {
  factory $HumanizationResultCopyWith(
          HumanizationResult value, $Res Function(HumanizationResult) then) =
      _$HumanizationResultCopyWithImpl<$Res, HumanizationResult>;
  @useResult
  $Res call(
      {String originalText,
      String humanizedText,
      double humanLike,
      List<String>? changes,
      String? explanation});
}

/// @nodoc
class _$HumanizationResultCopyWithImpl<$Res, $Val extends HumanizationResult>
    implements $HumanizationResultCopyWith<$Res> {
  _$HumanizationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HumanizationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalText = null,
    Object? humanizedText = null,
    Object? humanLike = null,
    Object? changes = freezed,
    Object? explanation = freezed,
  }) {
    return _then(_value.copyWith(
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      humanizedText: null == humanizedText
          ? _value.humanizedText
          : humanizedText // ignore: cast_nullable_to_non_nullable
              as String,
      humanLike: null == humanLike
          ? _value.humanLike
          : humanLike // ignore: cast_nullable_to_non_nullable
              as double,
      changes: freezed == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HumanizationResultImplCopyWith<$Res>
    implements $HumanizationResultCopyWith<$Res> {
  factory _$$HumanizationResultImplCopyWith(_$HumanizationResultImpl value,
          $Res Function(_$HumanizationResultImpl) then) =
      __$$HumanizationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String originalText,
      String humanizedText,
      double humanLike,
      List<String>? changes,
      String? explanation});
}

/// @nodoc
class __$$HumanizationResultImplCopyWithImpl<$Res>
    extends _$HumanizationResultCopyWithImpl<$Res, _$HumanizationResultImpl>
    implements _$$HumanizationResultImplCopyWith<$Res> {
  __$$HumanizationResultImplCopyWithImpl(_$HumanizationResultImpl _value,
      $Res Function(_$HumanizationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of HumanizationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalText = null,
    Object? humanizedText = null,
    Object? humanLike = null,
    Object? changes = freezed,
    Object? explanation = freezed,
  }) {
    return _then(_$HumanizationResultImpl(
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      humanizedText: null == humanizedText
          ? _value.humanizedText
          : humanizedText // ignore: cast_nullable_to_non_nullable
              as String,
      humanLike: null == humanLike
          ? _value.humanLike
          : humanLike // ignore: cast_nullable_to_non_nullable
              as double,
      changes: freezed == changes
          ? _value._changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HumanizationResultImpl implements _HumanizationResult {
  const _$HumanizationResultImpl(
      {required this.originalText,
      required this.humanizedText,
      required this.humanLike,
      final List<String>? changes,
      this.explanation})
      : _changes = changes;

  factory _$HumanizationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$HumanizationResultImplFromJson(json);

  @override
  final String originalText;
  @override
  final String humanizedText;
  @override
  final double humanLike;
  final List<String>? _changes;
  @override
  List<String>? get changes {
    final value = _changes;
    if (value == null) return null;
    if (_changes is EqualUnmodifiableListView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? explanation;

  @override
  String toString() {
    return 'HumanizationResult(originalText: $originalText, humanizedText: $humanizedText, humanLike: $humanLike, changes: $changes, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HumanizationResultImpl &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.humanizedText, humanizedText) ||
                other.humanizedText == humanizedText) &&
            (identical(other.humanLike, humanLike) ||
                other.humanLike == humanLike) &&
            const DeepCollectionEquality().equals(other._changes, _changes) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, originalText, humanizedText,
      humanLike, const DeepCollectionEquality().hash(_changes), explanation);

  /// Create a copy of HumanizationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HumanizationResultImplCopyWith<_$HumanizationResultImpl> get copyWith =>
      __$$HumanizationResultImplCopyWithImpl<_$HumanizationResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HumanizationResultImplToJson(
      this,
    );
  }
}

abstract class _HumanizationResult implements HumanizationResult {
  const factory _HumanizationResult(
      {required final String originalText,
      required final String humanizedText,
      required final double humanLike,
      final List<String>? changes,
      final String? explanation}) = _$HumanizationResultImpl;

  factory _HumanizationResult.fromJson(Map<String, dynamic> json) =
      _$HumanizationResultImpl.fromJson;

  @override
  String get originalText;
  @override
  String get humanizedText;
  @override
  double get humanLike;
  @override
  List<String>? get changes;
  @override
  String? get explanation;

  /// Create a copy of HumanizationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HumanizationResultImplCopyWith<_$HumanizationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentGenerationResult _$ContentGenerationResultFromJson(
    Map<String, dynamic> json) {
  return _ContentGenerationResult.fromJson(json);
}

/// @nodoc
mixin _$ContentGenerationResult {
  String get originalText => throw _privateConstructorUsedError;
  String get generatedContent => throw _privateConstructorUsedError;
  String get typeOfWriting => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  int get wordCount => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  List<String>? get suggestions => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;

  /// Serializes this ContentGenerationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentGenerationResultCopyWith<ContentGenerationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentGenerationResultCopyWith<$Res> {
  factory $ContentGenerationResultCopyWith(ContentGenerationResult value,
          $Res Function(ContentGenerationResult) then) =
      _$ContentGenerationResultCopyWithImpl<$Res, ContentGenerationResult>;
  @useResult
  $Res call(
      {String originalText,
      String generatedContent,
      String typeOfWriting,
      String tone,
      int wordCount,
      String language,
      List<String>? suggestions,
      String? explanation});
}

/// @nodoc
class _$ContentGenerationResultCopyWithImpl<$Res,
        $Val extends ContentGenerationResult>
    implements $ContentGenerationResultCopyWith<$Res> {
  _$ContentGenerationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalText = null,
    Object? generatedContent = null,
    Object? typeOfWriting = null,
    Object? tone = null,
    Object? wordCount = null,
    Object? language = null,
    Object? suggestions = freezed,
    Object? explanation = freezed,
  }) {
    return _then(_value.copyWith(
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      generatedContent: null == generatedContent
          ? _value.generatedContent
          : generatedContent // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfWriting: null == typeOfWriting
          ? _value.typeOfWriting
          : typeOfWriting // ignore: cast_nullable_to_non_nullable
              as String,
      tone: null == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as String,
      wordCount: null == wordCount
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      suggestions: freezed == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentGenerationResultImplCopyWith<$Res>
    implements $ContentGenerationResultCopyWith<$Res> {
  factory _$$ContentGenerationResultImplCopyWith(
          _$ContentGenerationResultImpl value,
          $Res Function(_$ContentGenerationResultImpl) then) =
      __$$ContentGenerationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String originalText,
      String generatedContent,
      String typeOfWriting,
      String tone,
      int wordCount,
      String language,
      List<String>? suggestions,
      String? explanation});
}

/// @nodoc
class __$$ContentGenerationResultImplCopyWithImpl<$Res>
    extends _$ContentGenerationResultCopyWithImpl<$Res,
        _$ContentGenerationResultImpl>
    implements _$$ContentGenerationResultImplCopyWith<$Res> {
  __$$ContentGenerationResultImplCopyWithImpl(
      _$ContentGenerationResultImpl _value,
      $Res Function(_$ContentGenerationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalText = null,
    Object? generatedContent = null,
    Object? typeOfWriting = null,
    Object? tone = null,
    Object? wordCount = null,
    Object? language = null,
    Object? suggestions = freezed,
    Object? explanation = freezed,
  }) {
    return _then(_$ContentGenerationResultImpl(
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      generatedContent: null == generatedContent
          ? _value.generatedContent
          : generatedContent // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfWriting: null == typeOfWriting
          ? _value.typeOfWriting
          : typeOfWriting // ignore: cast_nullable_to_non_nullable
              as String,
      tone: null == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as String,
      wordCount: null == wordCount
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      suggestions: freezed == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentGenerationResultImpl implements _ContentGenerationResult {
  const _$ContentGenerationResultImpl(
      {required this.originalText,
      required this.generatedContent,
      required this.typeOfWriting,
      required this.tone,
      required this.wordCount,
      required this.language,
      final List<String>? suggestions,
      this.explanation})
      : _suggestions = suggestions;

  factory _$ContentGenerationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentGenerationResultImplFromJson(json);

  @override
  final String originalText;
  @override
  final String generatedContent;
  @override
  final String typeOfWriting;
  @override
  final String tone;
  @override
  final int wordCount;
  @override
  final String language;
  final List<String>? _suggestions;
  @override
  List<String>? get suggestions {
    final value = _suggestions;
    if (value == null) return null;
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? explanation;

  @override
  String toString() {
    return 'ContentGenerationResult(originalText: $originalText, generatedContent: $generatedContent, typeOfWriting: $typeOfWriting, tone: $tone, wordCount: $wordCount, language: $language, suggestions: $suggestions, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentGenerationResultImpl &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.generatedContent, generatedContent) ||
                other.generatedContent == generatedContent) &&
            (identical(other.typeOfWriting, typeOfWriting) ||
                other.typeOfWriting == typeOfWriting) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.wordCount, wordCount) ||
                other.wordCount == wordCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      originalText,
      generatedContent,
      typeOfWriting,
      tone,
      wordCount,
      language,
      const DeepCollectionEquality().hash(_suggestions),
      explanation);

  /// Create a copy of ContentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentGenerationResultImplCopyWith<_$ContentGenerationResultImpl>
      get copyWith => __$$ContentGenerationResultImplCopyWithImpl<
          _$ContentGenerationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentGenerationResultImplToJson(
      this,
    );
  }
}

abstract class _ContentGenerationResult implements ContentGenerationResult {
  const factory _ContentGenerationResult(
      {required final String originalText,
      required final String generatedContent,
      required final String typeOfWriting,
      required final String tone,
      required final int wordCount,
      required final String language,
      final List<String>? suggestions,
      final String? explanation}) = _$ContentGenerationResultImpl;

  factory _ContentGenerationResult.fromJson(Map<String, dynamic> json) =
      _$ContentGenerationResultImpl.fromJson;

  @override
  String get originalText;
  @override
  String get generatedContent;
  @override
  String get typeOfWriting;
  @override
  String get tone;
  @override
  int get wordCount;
  @override
  String get language;
  @override
  List<String>? get suggestions;
  @override
  String? get explanation;

  /// Create a copy of ContentGenerationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentGenerationResultImplCopyWith<_$ContentGenerationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
