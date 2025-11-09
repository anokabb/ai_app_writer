// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../backend_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BackendDetectResponse _$BackendDetectResponseFromJson(
    Map<String, dynamic> json) {
  return _BackendDetectResponse.fromJson(json);
}

/// @nodoc
mixin _$BackendDetectResponse {
  bool get success => throw _privateConstructorUsedError;
  DetectData get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this BackendDetectResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BackendDetectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackendDetectResponseCopyWith<BackendDetectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendDetectResponseCopyWith<$Res> {
  factory $BackendDetectResponseCopyWith(BackendDetectResponse value,
          $Res Function(BackendDetectResponse) then) =
      _$BackendDetectResponseCopyWithImpl<$Res, BackendDetectResponse>;
  @useResult
  $Res call({bool success, DetectData data, String? message});

  $DetectDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BackendDetectResponseCopyWithImpl<$Res,
        $Val extends BackendDetectResponse>
    implements $BackendDetectResponseCopyWith<$Res> {
  _$BackendDetectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackendDetectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetectData,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of BackendDetectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetectDataCopyWith<$Res> get data {
    return $DetectDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BackendDetectResponseImplCopyWith<$Res>
    implements $BackendDetectResponseCopyWith<$Res> {
  factory _$$BackendDetectResponseImplCopyWith(
          _$BackendDetectResponseImpl value,
          $Res Function(_$BackendDetectResponseImpl) then) =
      __$$BackendDetectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, DetectData data, String? message});

  @override
  $DetectDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$BackendDetectResponseImplCopyWithImpl<$Res>
    extends _$BackendDetectResponseCopyWithImpl<$Res,
        _$BackendDetectResponseImpl>
    implements _$$BackendDetectResponseImplCopyWith<$Res> {
  __$$BackendDetectResponseImplCopyWithImpl(_$BackendDetectResponseImpl _value,
      $Res Function(_$BackendDetectResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackendDetectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_$BackendDetectResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetectData,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackendDetectResponseImpl implements _BackendDetectResponse {
  const _$BackendDetectResponseImpl(
      {required this.success, required this.data, this.message});

  factory _$BackendDetectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendDetectResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final DetectData data;
  @override
  final String? message;

  @override
  String toString() {
    return 'BackendDetectResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendDetectResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of BackendDetectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendDetectResponseImplCopyWith<_$BackendDetectResponseImpl>
      get copyWith => __$$BackendDetectResponseImplCopyWithImpl<
          _$BackendDetectResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackendDetectResponseImplToJson(
      this,
    );
  }
}

abstract class _BackendDetectResponse implements BackendDetectResponse {
  const factory _BackendDetectResponse(
      {required final bool success,
      required final DetectData data,
      final String? message}) = _$BackendDetectResponseImpl;

  factory _BackendDetectResponse.fromJson(Map<String, dynamic> json) =
      _$BackendDetectResponseImpl.fromJson;

  @override
  bool get success;
  @override
  DetectData get data;
  @override
  String? get message;

  /// Create a copy of BackendDetectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackendDetectResponseImplCopyWith<_$BackendDetectResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetectData _$DetectDataFromJson(Map<String, dynamic> json) {
  return _DetectData.fromJson(json);
}

/// @nodoc
mixin _$DetectData {
  String get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'human_probability')
  double get humanProbability => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  List<String> get suggestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sentences')
  int get totalSentences => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_generated_sentences')
  int get aiGeneratedSentences => throw _privateConstructorUsedError;
  @JsonKey(name: 'highlighted_sentences')
  List<String> get highlightedSentences => throw _privateConstructorUsedError;

  /// Serializes this DetectData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectDataCopyWith<DetectData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectDataCopyWith<$Res> {
  factory $DetectDataCopyWith(
          DetectData value, $Res Function(DetectData) then) =
      _$DetectDataCopyWithImpl<$Res, DetectData>;
  @useResult
  $Res call(
      {String source,
      @JsonKey(name: 'human_probability') double humanProbability,
      String explanation,
      List<String> suggestions,
      @JsonKey(name: 'total_sentences') int totalSentences,
      @JsonKey(name: 'ai_generated_sentences') int aiGeneratedSentences,
      @JsonKey(name: 'highlighted_sentences')
      List<String> highlightedSentences});
}

/// @nodoc
class _$DetectDataCopyWithImpl<$Res, $Val extends DetectData>
    implements $DetectDataCopyWith<$Res> {
  _$DetectDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? humanProbability = null,
    Object? explanation = null,
    Object? suggestions = null,
    Object? totalSentences = null,
    Object? aiGeneratedSentences = null,
    Object? highlightedSentences = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      humanProbability: null == humanProbability
          ? _value.humanProbability
          : humanProbability // ignore: cast_nullable_to_non_nullable
              as double,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalSentences: null == totalSentences
          ? _value.totalSentences
          : totalSentences // ignore: cast_nullable_to_non_nullable
              as int,
      aiGeneratedSentences: null == aiGeneratedSentences
          ? _value.aiGeneratedSentences
          : aiGeneratedSentences // ignore: cast_nullable_to_non_nullable
              as int,
      highlightedSentences: null == highlightedSentences
          ? _value.highlightedSentences
          : highlightedSentences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectDataImplCopyWith<$Res>
    implements $DetectDataCopyWith<$Res> {
  factory _$$DetectDataImplCopyWith(
          _$DetectDataImpl value, $Res Function(_$DetectDataImpl) then) =
      __$$DetectDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String source,
      @JsonKey(name: 'human_probability') double humanProbability,
      String explanation,
      List<String> suggestions,
      @JsonKey(name: 'total_sentences') int totalSentences,
      @JsonKey(name: 'ai_generated_sentences') int aiGeneratedSentences,
      @JsonKey(name: 'highlighted_sentences')
      List<String> highlightedSentences});
}

/// @nodoc
class __$$DetectDataImplCopyWithImpl<$Res>
    extends _$DetectDataCopyWithImpl<$Res, _$DetectDataImpl>
    implements _$$DetectDataImplCopyWith<$Res> {
  __$$DetectDataImplCopyWithImpl(
      _$DetectDataImpl _value, $Res Function(_$DetectDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? humanProbability = null,
    Object? explanation = null,
    Object? suggestions = null,
    Object? totalSentences = null,
    Object? aiGeneratedSentences = null,
    Object? highlightedSentences = null,
  }) {
    return _then(_$DetectDataImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      humanProbability: null == humanProbability
          ? _value.humanProbability
          : humanProbability // ignore: cast_nullable_to_non_nullable
              as double,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalSentences: null == totalSentences
          ? _value.totalSentences
          : totalSentences // ignore: cast_nullable_to_non_nullable
              as int,
      aiGeneratedSentences: null == aiGeneratedSentences
          ? _value.aiGeneratedSentences
          : aiGeneratedSentences // ignore: cast_nullable_to_non_nullable
              as int,
      highlightedSentences: null == highlightedSentences
          ? _value._highlightedSentences
          : highlightedSentences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectDataImpl implements _DetectData {
  const _$DetectDataImpl(
      {required this.source,
      @JsonKey(name: 'human_probability') required this.humanProbability,
      required this.explanation,
      required final List<String> suggestions,
      @JsonKey(name: 'total_sentences') required this.totalSentences,
      @JsonKey(name: 'ai_generated_sentences')
      required this.aiGeneratedSentences,
      @JsonKey(name: 'highlighted_sentences')
      required final List<String> highlightedSentences})
      : _suggestions = suggestions,
        _highlightedSentences = highlightedSentences;

  factory _$DetectDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectDataImplFromJson(json);

  @override
  final String source;
  @override
  @JsonKey(name: 'human_probability')
  final double humanProbability;
  @override
  final String explanation;
  final List<String> _suggestions;
  @override
  List<String> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  @JsonKey(name: 'total_sentences')
  final int totalSentences;
  @override
  @JsonKey(name: 'ai_generated_sentences')
  final int aiGeneratedSentences;
  final List<String> _highlightedSentences;
  @override
  @JsonKey(name: 'highlighted_sentences')
  List<String> get highlightedSentences {
    if (_highlightedSentences is EqualUnmodifiableListView)
      return _highlightedSentences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedSentences);
  }

  @override
  String toString() {
    return 'DetectData(source: $source, humanProbability: $humanProbability, explanation: $explanation, suggestions: $suggestions, totalSentences: $totalSentences, aiGeneratedSentences: $aiGeneratedSentences, highlightedSentences: $highlightedSentences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectDataImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.humanProbability, humanProbability) ||
                other.humanProbability == humanProbability) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.totalSentences, totalSentences) ||
                other.totalSentences == totalSentences) &&
            (identical(other.aiGeneratedSentences, aiGeneratedSentences) ||
                other.aiGeneratedSentences == aiGeneratedSentences) &&
            const DeepCollectionEquality()
                .equals(other._highlightedSentences, _highlightedSentences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      source,
      humanProbability,
      explanation,
      const DeepCollectionEquality().hash(_suggestions),
      totalSentences,
      aiGeneratedSentences,
      const DeepCollectionEquality().hash(_highlightedSentences));

  /// Create a copy of DetectData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectDataImplCopyWith<_$DetectDataImpl> get copyWith =>
      __$$DetectDataImplCopyWithImpl<_$DetectDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectDataImplToJson(
      this,
    );
  }
}

abstract class _DetectData implements DetectData {
  const factory _DetectData(
      {required final String source,
      @JsonKey(name: 'human_probability')
      required final double humanProbability,
      required final String explanation,
      required final List<String> suggestions,
      @JsonKey(name: 'total_sentences') required final int totalSentences,
      @JsonKey(name: 'ai_generated_sentences')
      required final int aiGeneratedSentences,
      @JsonKey(name: 'highlighted_sentences')
      required final List<String> highlightedSentences}) = _$DetectDataImpl;

  factory _DetectData.fromJson(Map<String, dynamic> json) =
      _$DetectDataImpl.fromJson;

  @override
  String get source;
  @override
  @JsonKey(name: 'human_probability')
  double get humanProbability;
  @override
  String get explanation;
  @override
  List<String> get suggestions;
  @override
  @JsonKey(name: 'total_sentences')
  int get totalSentences;
  @override
  @JsonKey(name: 'ai_generated_sentences')
  int get aiGeneratedSentences;
  @override
  @JsonKey(name: 'highlighted_sentences')
  List<String> get highlightedSentences;

  /// Create a copy of DetectData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectDataImplCopyWith<_$DetectDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BackendHumanizeResponse _$BackendHumanizeResponseFromJson(
    Map<String, dynamic> json) {
  return _BackendHumanizeResponse.fromJson(json);
}

/// @nodoc
mixin _$BackendHumanizeResponse {
  bool get success => throw _privateConstructorUsedError;
  HumanizeData get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this BackendHumanizeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BackendHumanizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackendHumanizeResponseCopyWith<BackendHumanizeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendHumanizeResponseCopyWith<$Res> {
  factory $BackendHumanizeResponseCopyWith(BackendHumanizeResponse value,
          $Res Function(BackendHumanizeResponse) then) =
      _$BackendHumanizeResponseCopyWithImpl<$Res, BackendHumanizeResponse>;
  @useResult
  $Res call({bool success, HumanizeData data, String? message});

  $HumanizeDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BackendHumanizeResponseCopyWithImpl<$Res,
        $Val extends BackendHumanizeResponse>
    implements $BackendHumanizeResponseCopyWith<$Res> {
  _$BackendHumanizeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackendHumanizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HumanizeData,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of BackendHumanizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HumanizeDataCopyWith<$Res> get data {
    return $HumanizeDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BackendHumanizeResponseImplCopyWith<$Res>
    implements $BackendHumanizeResponseCopyWith<$Res> {
  factory _$$BackendHumanizeResponseImplCopyWith(
          _$BackendHumanizeResponseImpl value,
          $Res Function(_$BackendHumanizeResponseImpl) then) =
      __$$BackendHumanizeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, HumanizeData data, String? message});

  @override
  $HumanizeDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$BackendHumanizeResponseImplCopyWithImpl<$Res>
    extends _$BackendHumanizeResponseCopyWithImpl<$Res,
        _$BackendHumanizeResponseImpl>
    implements _$$BackendHumanizeResponseImplCopyWith<$Res> {
  __$$BackendHumanizeResponseImplCopyWithImpl(
      _$BackendHumanizeResponseImpl _value,
      $Res Function(_$BackendHumanizeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackendHumanizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_$BackendHumanizeResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HumanizeData,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackendHumanizeResponseImpl implements _BackendHumanizeResponse {
  const _$BackendHumanizeResponseImpl(
      {required this.success, required this.data, this.message});

  factory _$BackendHumanizeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendHumanizeResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final HumanizeData data;
  @override
  final String? message;

  @override
  String toString() {
    return 'BackendHumanizeResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendHumanizeResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of BackendHumanizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendHumanizeResponseImplCopyWith<_$BackendHumanizeResponseImpl>
      get copyWith => __$$BackendHumanizeResponseImplCopyWithImpl<
          _$BackendHumanizeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackendHumanizeResponseImplToJson(
      this,
    );
  }
}

abstract class _BackendHumanizeResponse implements BackendHumanizeResponse {
  const factory _BackendHumanizeResponse(
      {required final bool success,
      required final HumanizeData data,
      final String? message}) = _$BackendHumanizeResponseImpl;

  factory _BackendHumanizeResponse.fromJson(Map<String, dynamic> json) =
      _$BackendHumanizeResponseImpl.fromJson;

  @override
  bool get success;
  @override
  HumanizeData get data;
  @override
  String? get message;

  /// Create a copy of BackendHumanizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackendHumanizeResponseImplCopyWith<_$BackendHumanizeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HumanizeData _$HumanizeDataFromJson(Map<String, dynamic> json) {
  return _HumanizeData.fromJson(json);
}

/// @nodoc
mixin _$HumanizeData {
  @JsonKey(name: 'original_text')
  String get originalText => throw _privateConstructorUsedError;
  @JsonKey(name: 'humanized_text')
  String get humanizedText => throw _privateConstructorUsedError;
  double get creativity => throw _privateConstructorUsedError;

  /// Serializes this HumanizeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HumanizeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HumanizeDataCopyWith<HumanizeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HumanizeDataCopyWith<$Res> {
  factory $HumanizeDataCopyWith(
          HumanizeData value, $Res Function(HumanizeData) then) =
      _$HumanizeDataCopyWithImpl<$Res, HumanizeData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'original_text') String originalText,
      @JsonKey(name: 'humanized_text') String humanizedText,
      double creativity});
}

/// @nodoc
class _$HumanizeDataCopyWithImpl<$Res, $Val extends HumanizeData>
    implements $HumanizeDataCopyWith<$Res> {
  _$HumanizeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HumanizeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalText = null,
    Object? humanizedText = null,
    Object? creativity = null,
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
      creativity: null == creativity
          ? _value.creativity
          : creativity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HumanizeDataImplCopyWith<$Res>
    implements $HumanizeDataCopyWith<$Res> {
  factory _$$HumanizeDataImplCopyWith(
          _$HumanizeDataImpl value, $Res Function(_$HumanizeDataImpl) then) =
      __$$HumanizeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'original_text') String originalText,
      @JsonKey(name: 'humanized_text') String humanizedText,
      double creativity});
}

/// @nodoc
class __$$HumanizeDataImplCopyWithImpl<$Res>
    extends _$HumanizeDataCopyWithImpl<$Res, _$HumanizeDataImpl>
    implements _$$HumanizeDataImplCopyWith<$Res> {
  __$$HumanizeDataImplCopyWithImpl(
      _$HumanizeDataImpl _value, $Res Function(_$HumanizeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HumanizeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalText = null,
    Object? humanizedText = null,
    Object? creativity = null,
  }) {
    return _then(_$HumanizeDataImpl(
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      humanizedText: null == humanizedText
          ? _value.humanizedText
          : humanizedText // ignore: cast_nullable_to_non_nullable
              as String,
      creativity: null == creativity
          ? _value.creativity
          : creativity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HumanizeDataImpl implements _HumanizeData {
  const _$HumanizeDataImpl(
      {@JsonKey(name: 'original_text') required this.originalText,
      @JsonKey(name: 'humanized_text') required this.humanizedText,
      required this.creativity});

  factory _$HumanizeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HumanizeDataImplFromJson(json);

  @override
  @JsonKey(name: 'original_text')
  final String originalText;
  @override
  @JsonKey(name: 'humanized_text')
  final String humanizedText;
  @override
  final double creativity;

  @override
  String toString() {
    return 'HumanizeData(originalText: $originalText, humanizedText: $humanizedText, creativity: $creativity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HumanizeDataImpl &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.humanizedText, humanizedText) ||
                other.humanizedText == humanizedText) &&
            (identical(other.creativity, creativity) ||
                other.creativity == creativity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, originalText, humanizedText, creativity);

  /// Create a copy of HumanizeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HumanizeDataImplCopyWith<_$HumanizeDataImpl> get copyWith =>
      __$$HumanizeDataImplCopyWithImpl<_$HumanizeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HumanizeDataImplToJson(
      this,
    );
  }
}

abstract class _HumanizeData implements HumanizeData {
  const factory _HumanizeData(
      {@JsonKey(name: 'original_text') required final String originalText,
      @JsonKey(name: 'humanized_text') required final String humanizedText,
      required final double creativity}) = _$HumanizeDataImpl;

  factory _HumanizeData.fromJson(Map<String, dynamic> json) =
      _$HumanizeDataImpl.fromJson;

  @override
  @JsonKey(name: 'original_text')
  String get originalText;
  @override
  @JsonKey(name: 'humanized_text')
  String get humanizedText;
  @override
  double get creativity;

  /// Create a copy of HumanizeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HumanizeDataImplCopyWith<_$HumanizeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BackendGenerateResponse _$BackendGenerateResponseFromJson(
    Map<String, dynamic> json) {
  return _BackendGenerateResponse.fromJson(json);
}

/// @nodoc
mixin _$BackendGenerateResponse {
  bool get success => throw _privateConstructorUsedError;
  GenerateData get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this BackendGenerateResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BackendGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackendGenerateResponseCopyWith<BackendGenerateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendGenerateResponseCopyWith<$Res> {
  factory $BackendGenerateResponseCopyWith(BackendGenerateResponse value,
          $Res Function(BackendGenerateResponse) then) =
      _$BackendGenerateResponseCopyWithImpl<$Res, BackendGenerateResponse>;
  @useResult
  $Res call({bool success, GenerateData data, String? message});

  $GenerateDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BackendGenerateResponseCopyWithImpl<$Res,
        $Val extends BackendGenerateResponse>
    implements $BackendGenerateResponseCopyWith<$Res> {
  _$BackendGenerateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackendGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GenerateData,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of BackendGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenerateDataCopyWith<$Res> get data {
    return $GenerateDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BackendGenerateResponseImplCopyWith<$Res>
    implements $BackendGenerateResponseCopyWith<$Res> {
  factory _$$BackendGenerateResponseImplCopyWith(
          _$BackendGenerateResponseImpl value,
          $Res Function(_$BackendGenerateResponseImpl) then) =
      __$$BackendGenerateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, GenerateData data, String? message});

  @override
  $GenerateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$BackendGenerateResponseImplCopyWithImpl<$Res>
    extends _$BackendGenerateResponseCopyWithImpl<$Res,
        _$BackendGenerateResponseImpl>
    implements _$$BackendGenerateResponseImplCopyWith<$Res> {
  __$$BackendGenerateResponseImplCopyWithImpl(
      _$BackendGenerateResponseImpl _value,
      $Res Function(_$BackendGenerateResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackendGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_$BackendGenerateResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GenerateData,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackendGenerateResponseImpl implements _BackendGenerateResponse {
  const _$BackendGenerateResponseImpl(
      {required this.success, required this.data, this.message});

  factory _$BackendGenerateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendGenerateResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final GenerateData data;
  @override
  final String? message;

  @override
  String toString() {
    return 'BackendGenerateResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendGenerateResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  /// Create a copy of BackendGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendGenerateResponseImplCopyWith<_$BackendGenerateResponseImpl>
      get copyWith => __$$BackendGenerateResponseImplCopyWithImpl<
          _$BackendGenerateResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackendGenerateResponseImplToJson(
      this,
    );
  }
}

abstract class _BackendGenerateResponse implements BackendGenerateResponse {
  const factory _BackendGenerateResponse(
      {required final bool success,
      required final GenerateData data,
      final String? message}) = _$BackendGenerateResponseImpl;

  factory _BackendGenerateResponse.fromJson(Map<String, dynamic> json) =
      _$BackendGenerateResponseImpl.fromJson;

  @override
  bool get success;
  @override
  GenerateData get data;
  @override
  String? get message;

  /// Create a copy of BackendGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackendGenerateResponseImplCopyWith<_$BackendGenerateResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenerateData _$GenerateDataFromJson(Map<String, dynamic> json) {
  return _GenerateData.fromJson(json);
}

/// @nodoc
mixin _$GenerateData {
  @JsonKey(name: 'original_text')
  String get originalText => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_content')
  String get generatedContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_of_writing')
  String get typeOfWriting => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  @JsonKey(name: 'word_count')
  int get wordCount => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  /// Serializes this GenerateData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateDataCopyWith<GenerateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateDataCopyWith<$Res> {
  factory $GenerateDataCopyWith(
          GenerateData value, $Res Function(GenerateData) then) =
      _$GenerateDataCopyWithImpl<$Res, GenerateData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'original_text') String originalText,
      @JsonKey(name: 'generated_content') String generatedContent,
      @JsonKey(name: 'type_of_writing') String typeOfWriting,
      String tone,
      @JsonKey(name: 'word_count') int wordCount,
      String language});
}

/// @nodoc
class _$GenerateDataCopyWithImpl<$Res, $Val extends GenerateData>
    implements $GenerateDataCopyWith<$Res> {
  _$GenerateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateData
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateDataImplCopyWith<$Res>
    implements $GenerateDataCopyWith<$Res> {
  factory _$$GenerateDataImplCopyWith(
          _$GenerateDataImpl value, $Res Function(_$GenerateDataImpl) then) =
      __$$GenerateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'original_text') String originalText,
      @JsonKey(name: 'generated_content') String generatedContent,
      @JsonKey(name: 'type_of_writing') String typeOfWriting,
      String tone,
      @JsonKey(name: 'word_count') int wordCount,
      String language});
}

/// @nodoc
class __$$GenerateDataImplCopyWithImpl<$Res>
    extends _$GenerateDataCopyWithImpl<$Res, _$GenerateDataImpl>
    implements _$$GenerateDataImplCopyWith<$Res> {
  __$$GenerateDataImplCopyWithImpl(
      _$GenerateDataImpl _value, $Res Function(_$GenerateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateData
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
  }) {
    return _then(_$GenerateDataImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateDataImpl implements _GenerateData {
  const _$GenerateDataImpl(
      {@JsonKey(name: 'original_text') required this.originalText,
      @JsonKey(name: 'generated_content') required this.generatedContent,
      @JsonKey(name: 'type_of_writing') required this.typeOfWriting,
      required this.tone,
      @JsonKey(name: 'word_count') required this.wordCount,
      required this.language});

  factory _$GenerateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateDataImplFromJson(json);

  @override
  @JsonKey(name: 'original_text')
  final String originalText;
  @override
  @JsonKey(name: 'generated_content')
  final String generatedContent;
  @override
  @JsonKey(name: 'type_of_writing')
  final String typeOfWriting;
  @override
  final String tone;
  @override
  @JsonKey(name: 'word_count')
  final int wordCount;
  @override
  final String language;

  @override
  String toString() {
    return 'GenerateData(originalText: $originalText, generatedContent: $generatedContent, typeOfWriting: $typeOfWriting, tone: $tone, wordCount: $wordCount, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateDataImpl &&
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
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, originalText, generatedContent,
      typeOfWriting, tone, wordCount, language);

  /// Create a copy of GenerateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateDataImplCopyWith<_$GenerateDataImpl> get copyWith =>
      __$$GenerateDataImplCopyWithImpl<_$GenerateDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateDataImplToJson(
      this,
    );
  }
}

abstract class _GenerateData implements GenerateData {
  const factory _GenerateData(
      {@JsonKey(name: 'original_text') required final String originalText,
      @JsonKey(name: 'generated_content')
      required final String generatedContent,
      @JsonKey(name: 'type_of_writing') required final String typeOfWriting,
      required final String tone,
      @JsonKey(name: 'word_count') required final int wordCount,
      required final String language}) = _$GenerateDataImpl;

  factory _GenerateData.fromJson(Map<String, dynamic> json) =
      _$GenerateDataImpl.fromJson;

  @override
  @JsonKey(name: 'original_text')
  String get originalText;
  @override
  @JsonKey(name: 'generated_content')
  String get generatedContent;
  @override
  @JsonKey(name: 'type_of_writing')
  String get typeOfWriting;
  @override
  String get tone;
  @override
  @JsonKey(name: 'word_count')
  int get wordCount;
  @override
  String get language;

  /// Create a copy of GenerateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateDataImplCopyWith<_$GenerateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
