// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) {
  return _HistoryItem.fromJson(json);
}

/// @nodoc
mixin _$HistoryItem {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get originalText => throw _privateConstructorUsedError;
  HistoryItemType get type =>
      throw _privateConstructorUsedError; // Title field (AI-generated or fallback)
  String? get title =>
      throw _privateConstructorUsedError; // Humanization fields (optional for generated content)
  String? get humanizedText => throw _privateConstructorUsedError;
  HumanizationResult? get humanizationResult =>
      throw _privateConstructorUsedError; // Generation fields (optional for humanized content)
  String? get generatedContent => throw _privateConstructorUsedError;
  GeneratorModel? get generatorResult =>
      throw _privateConstructorUsedError; // Common fields
  TextAnalysisResult? get analysisResult => throw _privateConstructorUsedError;
  String? get typeOfWriting => throw _privateConstructorUsedError;
  String? get tone => throw _privateConstructorUsedError;
  int? get wordCount => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;

  /// Serializes this HistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryItemCopyWith<HistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryItemCopyWith<$Res> {
  factory $HistoryItemCopyWith(
          HistoryItem value, $Res Function(HistoryItem) then) =
      _$HistoryItemCopyWithImpl<$Res, HistoryItem>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      String originalText,
      HistoryItemType type,
      String? title,
      String? humanizedText,
      HumanizationResult? humanizationResult,
      String? generatedContent,
      GeneratorModel? generatorResult,
      TextAnalysisResult? analysisResult,
      String? typeOfWriting,
      String? tone,
      int? wordCount,
      String? language});

  $HumanizationResultCopyWith<$Res>? get humanizationResult;
  $GeneratorModelCopyWith<$Res>? get generatorResult;
  $TextAnalysisResultCopyWith<$Res>? get analysisResult;
}

/// @nodoc
class _$HistoryItemCopyWithImpl<$Res, $Val extends HistoryItem>
    implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? originalText = null,
    Object? type = null,
    Object? title = freezed,
    Object? humanizedText = freezed,
    Object? humanizationResult = freezed,
    Object? generatedContent = freezed,
    Object? generatorResult = freezed,
    Object? analysisResult = freezed,
    Object? typeOfWriting = freezed,
    Object? tone = freezed,
    Object? wordCount = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HistoryItemType,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      humanizedText: freezed == humanizedText
          ? _value.humanizedText
          : humanizedText // ignore: cast_nullable_to_non_nullable
              as String?,
      humanizationResult: freezed == humanizationResult
          ? _value.humanizationResult
          : humanizationResult // ignore: cast_nullable_to_non_nullable
              as HumanizationResult?,
      generatedContent: freezed == generatedContent
          ? _value.generatedContent
          : generatedContent // ignore: cast_nullable_to_non_nullable
              as String?,
      generatorResult: freezed == generatorResult
          ? _value.generatorResult
          : generatorResult // ignore: cast_nullable_to_non_nullable
              as GeneratorModel?,
      analysisResult: freezed == analysisResult
          ? _value.analysisResult
          : analysisResult // ignore: cast_nullable_to_non_nullable
              as TextAnalysisResult?,
      typeOfWriting: freezed == typeOfWriting
          ? _value.typeOfWriting
          : typeOfWriting // ignore: cast_nullable_to_non_nullable
              as String?,
      tone: freezed == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as String?,
      wordCount: freezed == wordCount
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HumanizationResultCopyWith<$Res>? get humanizationResult {
    if (_value.humanizationResult == null) {
      return null;
    }

    return $HumanizationResultCopyWith<$Res>(_value.humanizationResult!,
        (value) {
      return _then(_value.copyWith(humanizationResult: value) as $Val);
    });
  }

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneratorModelCopyWith<$Res>? get generatorResult {
    if (_value.generatorResult == null) {
      return null;
    }

    return $GeneratorModelCopyWith<$Res>(_value.generatorResult!, (value) {
      return _then(_value.copyWith(generatorResult: value) as $Val);
    });
  }

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextAnalysisResultCopyWith<$Res>? get analysisResult {
    if (_value.analysisResult == null) {
      return null;
    }

    return $TextAnalysisResultCopyWith<$Res>(_value.analysisResult!, (value) {
      return _then(_value.copyWith(analysisResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryItemImplCopyWith<$Res>
    implements $HistoryItemCopyWith<$Res> {
  factory _$$HistoryItemImplCopyWith(
          _$HistoryItemImpl value, $Res Function(_$HistoryItemImpl) then) =
      __$$HistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      String originalText,
      HistoryItemType type,
      String? title,
      String? humanizedText,
      HumanizationResult? humanizationResult,
      String? generatedContent,
      GeneratorModel? generatorResult,
      TextAnalysisResult? analysisResult,
      String? typeOfWriting,
      String? tone,
      int? wordCount,
      String? language});

  @override
  $HumanizationResultCopyWith<$Res>? get humanizationResult;
  @override
  $GeneratorModelCopyWith<$Res>? get generatorResult;
  @override
  $TextAnalysisResultCopyWith<$Res>? get analysisResult;
}

/// @nodoc
class __$$HistoryItemImplCopyWithImpl<$Res>
    extends _$HistoryItemCopyWithImpl<$Res, _$HistoryItemImpl>
    implements _$$HistoryItemImplCopyWith<$Res> {
  __$$HistoryItemImplCopyWithImpl(
      _$HistoryItemImpl _value, $Res Function(_$HistoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? originalText = null,
    Object? type = null,
    Object? title = freezed,
    Object? humanizedText = freezed,
    Object? humanizationResult = freezed,
    Object? generatedContent = freezed,
    Object? generatorResult = freezed,
    Object? analysisResult = freezed,
    Object? typeOfWriting = freezed,
    Object? tone = freezed,
    Object? wordCount = freezed,
    Object? language = freezed,
  }) {
    return _then(_$HistoryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HistoryItemType,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      humanizedText: freezed == humanizedText
          ? _value.humanizedText
          : humanizedText // ignore: cast_nullable_to_non_nullable
              as String?,
      humanizationResult: freezed == humanizationResult
          ? _value.humanizationResult
          : humanizationResult // ignore: cast_nullable_to_non_nullable
              as HumanizationResult?,
      generatedContent: freezed == generatedContent
          ? _value.generatedContent
          : generatedContent // ignore: cast_nullable_to_non_nullable
              as String?,
      generatorResult: freezed == generatorResult
          ? _value.generatorResult
          : generatorResult // ignore: cast_nullable_to_non_nullable
              as GeneratorModel?,
      analysisResult: freezed == analysisResult
          ? _value.analysisResult
          : analysisResult // ignore: cast_nullable_to_non_nullable
              as TextAnalysisResult?,
      typeOfWriting: freezed == typeOfWriting
          ? _value.typeOfWriting
          : typeOfWriting // ignore: cast_nullable_to_non_nullable
              as String?,
      tone: freezed == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as String?,
      wordCount: freezed == wordCount
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryItemImpl extends _HistoryItem {
  const _$HistoryItemImpl(
      {required this.id,
      required this.timestamp,
      required this.originalText,
      required this.type,
      this.title,
      this.humanizedText,
      this.humanizationResult,
      this.generatedContent,
      this.generatorResult,
      this.analysisResult,
      this.typeOfWriting,
      this.tone,
      this.wordCount,
      this.language})
      : super._();

  factory _$HistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryItemImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final String originalText;
  @override
  final HistoryItemType type;
// Title field (AI-generated or fallback)
  @override
  final String? title;
// Humanization fields (optional for generated content)
  @override
  final String? humanizedText;
  @override
  final HumanizationResult? humanizationResult;
// Generation fields (optional for humanized content)
  @override
  final String? generatedContent;
  @override
  final GeneratorModel? generatorResult;
// Common fields
  @override
  final TextAnalysisResult? analysisResult;
  @override
  final String? typeOfWriting;
  @override
  final String? tone;
  @override
  final int? wordCount;
  @override
  final String? language;

  @override
  String toString() {
    return 'HistoryItem(id: $id, timestamp: $timestamp, originalText: $originalText, type: $type, title: $title, humanizedText: $humanizedText, humanizationResult: $humanizationResult, generatedContent: $generatedContent, generatorResult: $generatorResult, analysisResult: $analysisResult, typeOfWriting: $typeOfWriting, tone: $tone, wordCount: $wordCount, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.humanizedText, humanizedText) ||
                other.humanizedText == humanizedText) &&
            (identical(other.humanizationResult, humanizationResult) ||
                other.humanizationResult == humanizationResult) &&
            (identical(other.generatedContent, generatedContent) ||
                other.generatedContent == generatedContent) &&
            (identical(other.generatorResult, generatorResult) ||
                other.generatorResult == generatorResult) &&
            (identical(other.analysisResult, analysisResult) ||
                other.analysisResult == analysisResult) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      originalText,
      type,
      title,
      humanizedText,
      humanizationResult,
      generatedContent,
      generatorResult,
      analysisResult,
      typeOfWriting,
      tone,
      wordCount,
      language);

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryItemImplCopyWith<_$HistoryItemImpl> get copyWith =>
      __$$HistoryItemImplCopyWithImpl<_$HistoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryItemImplToJson(
      this,
    );
  }
}

abstract class _HistoryItem extends HistoryItem {
  const factory _HistoryItem(
      {required final String id,
      required final DateTime timestamp,
      required final String originalText,
      required final HistoryItemType type,
      final String? title,
      final String? humanizedText,
      final HumanizationResult? humanizationResult,
      final String? generatedContent,
      final GeneratorModel? generatorResult,
      final TextAnalysisResult? analysisResult,
      final String? typeOfWriting,
      final String? tone,
      final int? wordCount,
      final String? language}) = _$HistoryItemImpl;
  const _HistoryItem._() : super._();

  factory _HistoryItem.fromJson(Map<String, dynamic> json) =
      _$HistoryItemImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  String get originalText;
  @override
  HistoryItemType get type; // Title field (AI-generated or fallback)
  @override
  String? get title; // Humanization fields (optional for generated content)
  @override
  String? get humanizedText;
  @override
  HumanizationResult?
      get humanizationResult; // Generation fields (optional for humanized content)
  @override
  String? get generatedContent;
  @override
  GeneratorModel? get generatorResult; // Common fields
  @override
  TextAnalysisResult? get analysisResult;
  @override
  String? get typeOfWriting;
  @override
  String? get tone;
  @override
  int? get wordCount;
  @override
  String? get language;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryItemImplCopyWith<_$HistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
