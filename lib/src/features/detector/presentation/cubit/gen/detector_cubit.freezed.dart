// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../detector_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetectorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TextAnalysisResult result) loaded,
    required TResult Function(AppError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TextAnalysisResult result)? loaded,
    TResult? Function(AppError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TextAnalysisResult result)? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetectorStateInitial value) initial,
    required TResult Function(DetectorStateLoading value) loading,
    required TResult Function(DetectorStateLoaded value) loaded,
    required TResult Function(DetectorStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetectorStateInitial value)? initial,
    TResult? Function(DetectorStateLoading value)? loading,
    TResult? Function(DetectorStateLoaded value)? loaded,
    TResult? Function(DetectorStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetectorStateInitial value)? initial,
    TResult Function(DetectorStateLoading value)? loading,
    TResult Function(DetectorStateLoaded value)? loaded,
    TResult Function(DetectorStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectorStateCopyWith<$Res> {
  factory $DetectorStateCopyWith(
          DetectorState value, $Res Function(DetectorState) then) =
      _$DetectorStateCopyWithImpl<$Res, DetectorState>;
}

/// @nodoc
class _$DetectorStateCopyWithImpl<$Res, $Val extends DetectorState>
    implements $DetectorStateCopyWith<$Res> {
  _$DetectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DetectorStateInitialImplCopyWith<$Res> {
  factory _$$DetectorStateInitialImplCopyWith(_$DetectorStateInitialImpl value,
          $Res Function(_$DetectorStateInitialImpl) then) =
      __$$DetectorStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetectorStateInitialImplCopyWithImpl<$Res>
    extends _$DetectorStateCopyWithImpl<$Res, _$DetectorStateInitialImpl>
    implements _$$DetectorStateInitialImplCopyWith<$Res> {
  __$$DetectorStateInitialImplCopyWithImpl(_$DetectorStateInitialImpl _value,
      $Res Function(_$DetectorStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetectorStateInitialImpl implements DetectorStateInitial {
  const _$DetectorStateInitialImpl();

  @override
  String toString() {
    return 'DetectorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectorStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TextAnalysisResult result) loaded,
    required TResult Function(AppError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TextAnalysisResult result)? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TextAnalysisResult result)? loaded,
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
    required TResult Function(DetectorStateInitial value) initial,
    required TResult Function(DetectorStateLoading value) loading,
    required TResult Function(DetectorStateLoaded value) loaded,
    required TResult Function(DetectorStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetectorStateInitial value)? initial,
    TResult? Function(DetectorStateLoading value)? loading,
    TResult? Function(DetectorStateLoaded value)? loaded,
    TResult? Function(DetectorStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetectorStateInitial value)? initial,
    TResult Function(DetectorStateLoading value)? loading,
    TResult Function(DetectorStateLoaded value)? loaded,
    TResult Function(DetectorStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DetectorStateInitial implements DetectorState {
  const factory DetectorStateInitial() = _$DetectorStateInitialImpl;
}

/// @nodoc
abstract class _$$DetectorStateLoadingImplCopyWith<$Res> {
  factory _$$DetectorStateLoadingImplCopyWith(_$DetectorStateLoadingImpl value,
          $Res Function(_$DetectorStateLoadingImpl) then) =
      __$$DetectorStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetectorStateLoadingImplCopyWithImpl<$Res>
    extends _$DetectorStateCopyWithImpl<$Res, _$DetectorStateLoadingImpl>
    implements _$$DetectorStateLoadingImplCopyWith<$Res> {
  __$$DetectorStateLoadingImplCopyWithImpl(_$DetectorStateLoadingImpl _value,
      $Res Function(_$DetectorStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetectorStateLoadingImpl implements DetectorStateLoading {
  const _$DetectorStateLoadingImpl();

  @override
  String toString() {
    return 'DetectorState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectorStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TextAnalysisResult result) loaded,
    required TResult Function(AppError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TextAnalysisResult result)? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TextAnalysisResult result)? loaded,
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
    required TResult Function(DetectorStateInitial value) initial,
    required TResult Function(DetectorStateLoading value) loading,
    required TResult Function(DetectorStateLoaded value) loaded,
    required TResult Function(DetectorStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetectorStateInitial value)? initial,
    TResult? Function(DetectorStateLoading value)? loading,
    TResult? Function(DetectorStateLoaded value)? loaded,
    TResult? Function(DetectorStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetectorStateInitial value)? initial,
    TResult Function(DetectorStateLoading value)? loading,
    TResult Function(DetectorStateLoaded value)? loaded,
    TResult Function(DetectorStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DetectorStateLoading implements DetectorState {
  const factory DetectorStateLoading() = _$DetectorStateLoadingImpl;
}

/// @nodoc
abstract class _$$DetectorStateLoadedImplCopyWith<$Res> {
  factory _$$DetectorStateLoadedImplCopyWith(_$DetectorStateLoadedImpl value,
          $Res Function(_$DetectorStateLoadedImpl) then) =
      __$$DetectorStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TextAnalysisResult result});

  $TextAnalysisResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$DetectorStateLoadedImplCopyWithImpl<$Res>
    extends _$DetectorStateCopyWithImpl<$Res, _$DetectorStateLoadedImpl>
    implements _$$DetectorStateLoadedImplCopyWith<$Res> {
  __$$DetectorStateLoadedImplCopyWithImpl(_$DetectorStateLoadedImpl _value,
      $Res Function(_$DetectorStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$DetectorStateLoadedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as TextAnalysisResult,
    ));
  }

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextAnalysisResultCopyWith<$Res> get result {
    return $TextAnalysisResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$DetectorStateLoadedImpl implements DetectorStateLoaded {
  const _$DetectorStateLoadedImpl(this.result);

  @override
  final TextAnalysisResult result;

  @override
  String toString() {
    return 'DetectorState.loaded(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectorStateLoadedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectorStateLoadedImplCopyWith<_$DetectorStateLoadedImpl> get copyWith =>
      __$$DetectorStateLoadedImplCopyWithImpl<_$DetectorStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TextAnalysisResult result) loaded,
    required TResult Function(AppError error) error,
  }) {
    return loaded(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TextAnalysisResult result)? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return loaded?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TextAnalysisResult result)? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetectorStateInitial value) initial,
    required TResult Function(DetectorStateLoading value) loading,
    required TResult Function(DetectorStateLoaded value) loaded,
    required TResult Function(DetectorStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetectorStateInitial value)? initial,
    TResult? Function(DetectorStateLoading value)? loading,
    TResult? Function(DetectorStateLoaded value)? loaded,
    TResult? Function(DetectorStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetectorStateInitial value)? initial,
    TResult Function(DetectorStateLoading value)? loading,
    TResult Function(DetectorStateLoaded value)? loaded,
    TResult Function(DetectorStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DetectorStateLoaded implements DetectorState {
  const factory DetectorStateLoaded(final TextAnalysisResult result) =
      _$DetectorStateLoadedImpl;

  TextAnalysisResult get result;

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectorStateLoadedImplCopyWith<_$DetectorStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetectorStateErrorImplCopyWith<$Res> {
  factory _$$DetectorStateErrorImplCopyWith(_$DetectorStateErrorImpl value,
          $Res Function(_$DetectorStateErrorImpl) then) =
      __$$DetectorStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$DetectorStateErrorImplCopyWithImpl<$Res>
    extends _$DetectorStateCopyWithImpl<$Res, _$DetectorStateErrorImpl>
    implements _$$DetectorStateErrorImplCopyWith<$Res> {
  __$$DetectorStateErrorImplCopyWithImpl(_$DetectorStateErrorImpl _value,
      $Res Function(_$DetectorStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DetectorStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  /// Create a copy of DetectorState
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

class _$DetectorStateErrorImpl implements DetectorStateError {
  const _$DetectorStateErrorImpl(this.error);

  @override
  final AppError error;

  @override
  String toString() {
    return 'DetectorState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectorStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectorStateErrorImplCopyWith<_$DetectorStateErrorImpl> get copyWith =>
      __$$DetectorStateErrorImplCopyWithImpl<_$DetectorStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TextAnalysisResult result) loaded,
    required TResult Function(AppError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TextAnalysisResult result)? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TextAnalysisResult result)? loaded,
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
    required TResult Function(DetectorStateInitial value) initial,
    required TResult Function(DetectorStateLoading value) loading,
    required TResult Function(DetectorStateLoaded value) loaded,
    required TResult Function(DetectorStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetectorStateInitial value)? initial,
    TResult? Function(DetectorStateLoading value)? loading,
    TResult? Function(DetectorStateLoaded value)? loaded,
    TResult? Function(DetectorStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetectorStateInitial value)? initial,
    TResult Function(DetectorStateLoading value)? loading,
    TResult Function(DetectorStateLoaded value)? loaded,
    TResult Function(DetectorStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DetectorStateError implements DetectorState {
  const factory DetectorStateError(final AppError error) =
      _$DetectorStateErrorImpl;

  AppError get error;

  /// Create a copy of DetectorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectorStateErrorImplCopyWith<_$DetectorStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
