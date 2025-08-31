// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../generator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneratorModel _$GeneratorModelFromJson(Map<String, dynamic> json) {
  return _GeneratorModel.fromJson(json);
}

/// @nodoc
mixin _$GeneratorModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this GeneratorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneratorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneratorModelCopyWith<GeneratorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratorModelCopyWith<$Res> {
  factory $GeneratorModelCopyWith(
          GeneratorModel value, $Res Function(GeneratorModel) then) =
      _$GeneratorModelCopyWithImpl<$Res, GeneratorModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$GeneratorModelCopyWithImpl<$Res, $Val extends GeneratorModel>
    implements $GeneratorModelCopyWith<$Res> {
  _$GeneratorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneratorModel
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
abstract class _$$GeneratorModelImplCopyWith<$Res>
    implements $GeneratorModelCopyWith<$Res> {
  factory _$$GeneratorModelImplCopyWith(_$GeneratorModelImpl value,
          $Res Function(_$GeneratorModelImpl) then) =
      __$$GeneratorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$GeneratorModelImplCopyWithImpl<$Res>
    extends _$GeneratorModelCopyWithImpl<$Res, _$GeneratorModelImpl>
    implements _$$GeneratorModelImplCopyWith<$Res> {
  __$$GeneratorModelImplCopyWithImpl(
      _$GeneratorModelImpl _value, $Res Function(_$GeneratorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$GeneratorModelImpl(
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
class _$GeneratorModelImpl implements _GeneratorModel {
  const _$GeneratorModelImpl({required this.id, required this.name});

  factory _$GeneratorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneratorModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'GeneratorModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of GeneratorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratorModelImplCopyWith<_$GeneratorModelImpl> get copyWith =>
      __$$GeneratorModelImplCopyWithImpl<_$GeneratorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneratorModelImplToJson(
      this,
    );
  }
}

abstract class _GeneratorModel implements GeneratorModel {
  const factory _GeneratorModel(
      {required final String id,
      required final String name}) = _$GeneratorModelImpl;

  factory _GeneratorModel.fromJson(Map<String, dynamic> json) =
      _$GeneratorModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of GeneratorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratorModelImplCopyWith<_$GeneratorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
