// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../detector_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetectorModel _$DetectorModelFromJson(Map<String, dynamic> json) {
  return _DetectorModel.fromJson(json);
}

/// @nodoc
mixin _$DetectorModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this DetectorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectorModelCopyWith<DetectorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectorModelCopyWith<$Res> {
  factory $DetectorModelCopyWith(
          DetectorModel value, $Res Function(DetectorModel) then) =
      _$DetectorModelCopyWithImpl<$Res, DetectorModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$DetectorModelCopyWithImpl<$Res, $Val extends DetectorModel>
    implements $DetectorModelCopyWith<$Res> {
  _$DetectorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectorModelImplCopyWith<$Res>
    implements $DetectorModelCopyWith<$Res> {
  factory _$$DetectorModelImplCopyWith(
          _$DetectorModelImpl value, $Res Function(_$DetectorModelImpl) then) =
      __$$DetectorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$DetectorModelImplCopyWithImpl<$Res>
    extends _$DetectorModelCopyWithImpl<$Res, _$DetectorModelImpl>
    implements _$$DetectorModelImplCopyWith<$Res> {
  __$$DetectorModelImplCopyWithImpl(
      _$DetectorModelImpl _value, $Res Function(_$DetectorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$DetectorModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectorModelImpl implements _DetectorModel {
  const _$DetectorModelImpl({required this.id, required this.name});

  factory _$DetectorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectorModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'DetectorModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of DetectorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectorModelImplCopyWith<_$DetectorModelImpl> get copyWith =>
      __$$DetectorModelImplCopyWithImpl<_$DetectorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectorModelImplToJson(
      this,
    );
  }
}

abstract class _DetectorModel implements DetectorModel {
  const factory _DetectorModel(
      {required final String id,
      required final String name}) = _$DetectorModelImpl;

  factory _DetectorModel.fromJson(Map<String, dynamic> json) =
      _$DetectorModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of DetectorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectorModelImplCopyWith<_$DetectorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
