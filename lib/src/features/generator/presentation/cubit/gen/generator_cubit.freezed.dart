// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../generator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeneratorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(AppError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(AppError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorStateInitial value) initial,
    required TResult Function(GeneratorStateLoading value) loading,
    required TResult Function(GeneratorStateLoaded value) loaded,
    required TResult Function(GeneratorStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorStateInitial value)? initial,
    TResult? Function(GeneratorStateLoading value)? loading,
    TResult? Function(GeneratorStateLoaded value)? loaded,
    TResult? Function(GeneratorStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorStateInitial value)? initial,
    TResult Function(GeneratorStateLoading value)? loading,
    TResult Function(GeneratorStateLoaded value)? loaded,
    TResult Function(GeneratorStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratorStateCopyWith<$Res> {
  factory $GeneratorStateCopyWith(
          GeneratorState value, $Res Function(GeneratorState) then) =
      _$GeneratorStateCopyWithImpl<$Res, GeneratorState>;
}

/// @nodoc
class _$GeneratorStateCopyWithImpl<$Res, $Val extends GeneratorState>
    implements $GeneratorStateCopyWith<$Res> {
  _$GeneratorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GeneratorStateInitialImplCopyWith<$Res> {
  factory _$$GeneratorStateInitialImplCopyWith(
          _$GeneratorStateInitialImpl value,
          $Res Function(_$GeneratorStateInitialImpl) then) =
      __$$GeneratorStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeneratorStateInitialImplCopyWithImpl<$Res>
    extends _$GeneratorStateCopyWithImpl<$Res, _$GeneratorStateInitialImpl>
    implements _$$GeneratorStateInitialImplCopyWith<$Res> {
  __$$GeneratorStateInitialImplCopyWithImpl(_$GeneratorStateInitialImpl _value,
      $Res Function(_$GeneratorStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GeneratorStateInitialImpl implements GeneratorStateInitial {
  const _$GeneratorStateInitialImpl();

  @override
  String toString() {
    return 'GeneratorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratorStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(AppError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorStateInitial value) initial,
    required TResult Function(GeneratorStateLoading value) loading,
    required TResult Function(GeneratorStateLoaded value) loaded,
    required TResult Function(GeneratorStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorStateInitial value)? initial,
    TResult? Function(GeneratorStateLoading value)? loading,
    TResult? Function(GeneratorStateLoaded value)? loaded,
    TResult? Function(GeneratorStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorStateInitial value)? initial,
    TResult Function(GeneratorStateLoading value)? loading,
    TResult Function(GeneratorStateLoaded value)? loaded,
    TResult Function(GeneratorStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GeneratorStateInitial implements GeneratorState {
  const factory GeneratorStateInitial() = _$GeneratorStateInitialImpl;
}

/// @nodoc
abstract class _$$GeneratorStateLoadingImplCopyWith<$Res> {
  factory _$$GeneratorStateLoadingImplCopyWith(
          _$GeneratorStateLoadingImpl value,
          $Res Function(_$GeneratorStateLoadingImpl) then) =
      __$$GeneratorStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeneratorStateLoadingImplCopyWithImpl<$Res>
    extends _$GeneratorStateCopyWithImpl<$Res, _$GeneratorStateLoadingImpl>
    implements _$$GeneratorStateLoadingImplCopyWith<$Res> {
  __$$GeneratorStateLoadingImplCopyWithImpl(_$GeneratorStateLoadingImpl _value,
      $Res Function(_$GeneratorStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GeneratorStateLoadingImpl implements GeneratorStateLoading {
  const _$GeneratorStateLoadingImpl();

  @override
  String toString() {
    return 'GeneratorState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratorStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(AppError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorStateInitial value) initial,
    required TResult Function(GeneratorStateLoading value) loading,
    required TResult Function(GeneratorStateLoaded value) loaded,
    required TResult Function(GeneratorStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorStateInitial value)? initial,
    TResult? Function(GeneratorStateLoading value)? loading,
    TResult? Function(GeneratorStateLoaded value)? loaded,
    TResult? Function(GeneratorStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorStateInitial value)? initial,
    TResult Function(GeneratorStateLoading value)? loading,
    TResult Function(GeneratorStateLoaded value)? loaded,
    TResult Function(GeneratorStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GeneratorStateLoading implements GeneratorState {
  const factory GeneratorStateLoading() = _$GeneratorStateLoadingImpl;
}

/// @nodoc
abstract class _$$GeneratorStateLoadedImplCopyWith<$Res> {
  factory _$$GeneratorStateLoadedImplCopyWith(_$GeneratorStateLoadedImpl value,
          $Res Function(_$GeneratorStateLoadedImpl) then) =
      __$$GeneratorStateLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeneratorStateLoadedImplCopyWithImpl<$Res>
    extends _$GeneratorStateCopyWithImpl<$Res, _$GeneratorStateLoadedImpl>
    implements _$$GeneratorStateLoadedImplCopyWith<$Res> {
  __$$GeneratorStateLoadedImplCopyWithImpl(_$GeneratorStateLoadedImpl _value,
      $Res Function(_$GeneratorStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GeneratorStateLoadedImpl implements GeneratorStateLoaded {
  const _$GeneratorStateLoadedImpl();

  @override
  String toString() {
    return 'GeneratorState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratorStateLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(AppError error) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorStateInitial value) initial,
    required TResult Function(GeneratorStateLoading value) loading,
    required TResult Function(GeneratorStateLoaded value) loaded,
    required TResult Function(GeneratorStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorStateInitial value)? initial,
    TResult? Function(GeneratorStateLoading value)? loading,
    TResult? Function(GeneratorStateLoaded value)? loaded,
    TResult? Function(GeneratorStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorStateInitial value)? initial,
    TResult Function(GeneratorStateLoading value)? loading,
    TResult Function(GeneratorStateLoaded value)? loaded,
    TResult Function(GeneratorStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GeneratorStateLoaded implements GeneratorState {
  const factory GeneratorStateLoaded() = _$GeneratorStateLoadedImpl;
}

/// @nodoc
abstract class _$$GeneratorStateErrorImplCopyWith<$Res> {
  factory _$$GeneratorStateErrorImplCopyWith(_$GeneratorStateErrorImpl value,
          $Res Function(_$GeneratorStateErrorImpl) then) =
      __$$GeneratorStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$GeneratorStateErrorImplCopyWithImpl<$Res>
    extends _$GeneratorStateCopyWithImpl<$Res, _$GeneratorStateErrorImpl>
    implements _$$GeneratorStateErrorImplCopyWith<$Res> {
  __$$GeneratorStateErrorImplCopyWithImpl(_$GeneratorStateErrorImpl _value,
      $Res Function(_$GeneratorStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GeneratorStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res> get error {
    return $AppErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$GeneratorStateErrorImpl implements GeneratorStateError {
  const _$GeneratorStateErrorImpl(this.error);

  @override
  final AppError error;

  @override
  String toString() {
    return 'GeneratorState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratorStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratorStateErrorImplCopyWith<_$GeneratorStateErrorImpl> get copyWith =>
      __$$GeneratorStateErrorImplCopyWithImpl<_$GeneratorStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(AppError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorStateInitial value) initial,
    required TResult Function(GeneratorStateLoading value) loading,
    required TResult Function(GeneratorStateLoaded value) loaded,
    required TResult Function(GeneratorStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorStateInitial value)? initial,
    TResult? Function(GeneratorStateLoading value)? loading,
    TResult? Function(GeneratorStateLoaded value)? loaded,
    TResult? Function(GeneratorStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorStateInitial value)? initial,
    TResult Function(GeneratorStateLoading value)? loading,
    TResult Function(GeneratorStateLoaded value)? loaded,
    TResult Function(GeneratorStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GeneratorStateError implements GeneratorState {
  const factory GeneratorStateError(final AppError error) =
      _$GeneratorStateErrorImpl;

  AppError get error;

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratorStateErrorImplCopyWith<_$GeneratorStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
