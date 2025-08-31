// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../humanizer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HumanizerModel _$HumanizerModelFromJson(Map<String, dynamic> json) {
  return _HumanizerModel.fromJson(json);
}

/// @nodoc
mixin _$HumanizerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this HumanizerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HumanizerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HumanizerModelCopyWith<HumanizerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HumanizerModelCopyWith<$Res> {
  factory $HumanizerModelCopyWith(
          HumanizerModel value, $Res Function(HumanizerModel) then) =
      _$HumanizerModelCopyWithImpl<$Res, HumanizerModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$HumanizerModelCopyWithImpl<$Res, $Val extends HumanizerModel>
    implements $HumanizerModelCopyWith<$Res> {
  _$HumanizerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HumanizerModel
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
abstract class _$$HumanizerModelImplCopyWith<$Res>
    implements $HumanizerModelCopyWith<$Res> {
  factory _$$HumanizerModelImplCopyWith(_$HumanizerModelImpl value,
          $Res Function(_$HumanizerModelImpl) then) =
      __$$HumanizerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$HumanizerModelImplCopyWithImpl<$Res>
    extends _$HumanizerModelCopyWithImpl<$Res, _$HumanizerModelImpl>
    implements _$$HumanizerModelImplCopyWith<$Res> {
  __$$HumanizerModelImplCopyWithImpl(
      _$HumanizerModelImpl _value, $Res Function(_$HumanizerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HumanizerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$HumanizerModelImpl(
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
class _$HumanizerModelImpl implements _HumanizerModel {
  const _$HumanizerModelImpl({required this.id, required this.name});

  factory _$HumanizerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HumanizerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'HumanizerModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HumanizerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of HumanizerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HumanizerModelImplCopyWith<_$HumanizerModelImpl> get copyWith =>
      __$$HumanizerModelImplCopyWithImpl<_$HumanizerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HumanizerModelImplToJson(
      this,
    );
  }
}

abstract class _HumanizerModel implements HumanizerModel {
  const factory _HumanizerModel(
      {required final String id,
      required final String name}) = _$HumanizerModelImpl;

  factory _HumanizerModel.fromJson(Map<String, dynamic> json) =
      _$HumanizerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of HumanizerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HumanizerModelImplCopyWith<_$HumanizerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
