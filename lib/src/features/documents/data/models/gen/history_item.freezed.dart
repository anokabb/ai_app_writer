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
  String get title => throw _privateConstructorUsedError;
  String get originalText => throw _privateConstructorUsedError;
  String get humanizedText => throw _privateConstructorUsedError;
  TextAnalysisResult? get analysisResult => throw _privateConstructorUsedError;
  HumanizationResult get humanizationResult =>
      throw _privateConstructorUsedError;

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
      String title,
      String originalText,
      String humanizedText,
      TextAnalysisResult? analysisResult,
      HumanizationResult humanizationResult});

  $TextAnalysisResultCopyWith<$Res>? get analysisResult;
  $HumanizationResultCopyWith<$Res> get humanizationResult;
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
    Object? title = null,
    Object? originalText = null,
    Object? humanizedText = null,
    Object? analysisResult = freezed,
    Object? humanizationResult = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      humanizedText: null == humanizedText
          ? _value.humanizedText
          : humanizedText // ignore: cast_nullable_to_non_nullable
              as String,
      analysisResult: freezed == analysisResult
          ? _value.analysisResult
          : analysisResult // ignore: cast_nullable_to_non_nullable
              as TextAnalysisResult?,
      humanizationResult: null == humanizationResult
          ? _value.humanizationResult
          : humanizationResult // ignore: cast_nullable_to_non_nullable
              as HumanizationResult,
    ) as $Val);
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

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HumanizationResultCopyWith<$Res> get humanizationResult {
    return $HumanizationResultCopyWith<$Res>(_value.humanizationResult,
        (value) {
      return _then(_value.copyWith(humanizationResult: value) as $Val);
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
      String title,
      String originalText,
      String humanizedText,
      TextAnalysisResult? analysisResult,
      HumanizationResult humanizationResult});

  @override
  $TextAnalysisResultCopyWith<$Res>? get analysisResult;
  @override
  $HumanizationResultCopyWith<$Res> get humanizationResult;
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
    Object? title = null,
    Object? originalText = null,
    Object? humanizedText = null,
    Object? analysisResult = freezed,
    Object? humanizationResult = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: null == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String,
      humanizedText: null == humanizedText
          ? _value.humanizedText
          : humanizedText // ignore: cast_nullable_to_non_nullable
              as String,
      analysisResult: freezed == analysisResult
          ? _value.analysisResult
          : analysisResult // ignore: cast_nullable_to_non_nullable
              as TextAnalysisResult?,
      humanizationResult: null == humanizationResult
          ? _value.humanizationResult
          : humanizationResult // ignore: cast_nullable_to_non_nullable
              as HumanizationResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryItemImpl extends _HistoryItem {
  const _$HistoryItemImpl(
      {required this.id,
      required this.timestamp,
      required this.title,
      required this.originalText,
      required this.humanizedText,
      required this.analysisResult,
      required this.humanizationResult})
      : super._();

  factory _$HistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryItemImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final String title;
  @override
  final String originalText;
  @override
  final String humanizedText;
  @override
  final TextAnalysisResult? analysisResult;
  @override
  final HumanizationResult humanizationResult;

  @override
  String toString() {
    return 'HistoryItem(id: $id, timestamp: $timestamp, title: $title, originalText: $originalText, humanizedText: $humanizedText, analysisResult: $analysisResult, humanizationResult: $humanizationResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.humanizedText, humanizedText) ||
                other.humanizedText == humanizedText) &&
            (identical(other.analysisResult, analysisResult) ||
                other.analysisResult == analysisResult) &&
            (identical(other.humanizationResult, humanizationResult) ||
                other.humanizationResult == humanizationResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, timestamp, title,
      originalText, humanizedText, analysisResult, humanizationResult);

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
          required final String title,
          required final String originalText,
          required final String humanizedText,
          required final TextAnalysisResult? analysisResult,
          required final HumanizationResult humanizationResult}) =
      _$HistoryItemImpl;
  const _HistoryItem._() : super._();

  factory _HistoryItem.fromJson(Map<String, dynamic> json) =
      _$HistoryItemImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  String get title;
  @override
  String get originalText;
  @override
  String get humanizedText;
  @override
  TextAnalysisResult? get analysisResult;
  @override
  HumanizationResult get humanizationResult;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryItemImplCopyWith<_$HistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
