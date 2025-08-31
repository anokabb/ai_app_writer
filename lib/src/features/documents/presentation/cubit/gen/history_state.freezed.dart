// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HistoryItem> items) loaded,
    required TResult Function(AppError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HistoryItem> items)? loaded,
    TResult? Function(AppError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HistoryItem> items)? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryStateInitial value)? initial,
    TResult? Function(HistoryStateLoading value)? loading,
    TResult? Function(HistoryStateLoaded value)? loaded,
    TResult? Function(HistoryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HistoryStateInitialImplCopyWith<$Res> {
  factory _$$HistoryStateInitialImplCopyWith(_$HistoryStateInitialImpl value,
          $Res Function(_$HistoryStateInitialImpl) then) =
      __$$HistoryStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HistoryStateInitialImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateInitialImpl>
    implements _$$HistoryStateInitialImplCopyWith<$Res> {
  __$$HistoryStateInitialImplCopyWithImpl(_$HistoryStateInitialImpl _value,
      $Res Function(_$HistoryStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HistoryStateInitialImpl implements HistoryStateInitial {
  const _$HistoryStateInitialImpl();

  @override
  String toString() {
    return 'HistoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HistoryItem> items) loaded,
    required TResult Function(AppError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HistoryItem> items)? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HistoryItem> items)? loaded,
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
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryStateInitial value)? initial,
    TResult? Function(HistoryStateLoading value)? loading,
    TResult? Function(HistoryStateLoaded value)? loaded,
    TResult? Function(HistoryStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HistoryStateInitial implements HistoryState {
  const factory HistoryStateInitial() = _$HistoryStateInitialImpl;
}

/// @nodoc
abstract class _$$HistoryStateLoadingImplCopyWith<$Res> {
  factory _$$HistoryStateLoadingImplCopyWith(_$HistoryStateLoadingImpl value,
          $Res Function(_$HistoryStateLoadingImpl) then) =
      __$$HistoryStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HistoryStateLoadingImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateLoadingImpl>
    implements _$$HistoryStateLoadingImplCopyWith<$Res> {
  __$$HistoryStateLoadingImplCopyWithImpl(_$HistoryStateLoadingImpl _value,
      $Res Function(_$HistoryStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HistoryStateLoadingImpl implements HistoryStateLoading {
  const _$HistoryStateLoadingImpl();

  @override
  String toString() {
    return 'HistoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HistoryItem> items) loaded,
    required TResult Function(AppError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HistoryItem> items)? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HistoryItem> items)? loaded,
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
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryStateInitial value)? initial,
    TResult? Function(HistoryStateLoading value)? loading,
    TResult? Function(HistoryStateLoaded value)? loaded,
    TResult? Function(HistoryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HistoryStateLoading implements HistoryState {
  const factory HistoryStateLoading() = _$HistoryStateLoadingImpl;
}

/// @nodoc
abstract class _$$HistoryStateLoadedImplCopyWith<$Res> {
  factory _$$HistoryStateLoadedImplCopyWith(_$HistoryStateLoadedImpl value,
          $Res Function(_$HistoryStateLoadedImpl) then) =
      __$$HistoryStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<HistoryItem> items});
}

/// @nodoc
class __$$HistoryStateLoadedImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateLoadedImpl>
    implements _$$HistoryStateLoadedImplCopyWith<$Res> {
  __$$HistoryStateLoadedImplCopyWithImpl(_$HistoryStateLoadedImpl _value,
      $Res Function(_$HistoryStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$HistoryStateLoadedImpl(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HistoryItem>,
    ));
  }
}

/// @nodoc

class _$HistoryStateLoadedImpl implements HistoryStateLoaded {
  const _$HistoryStateLoadedImpl(final List<HistoryItem> items)
      : _items = items;

  final List<HistoryItem> _items;
  @override
  List<HistoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'HistoryState.loaded(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateLoadedImplCopyWith<_$HistoryStateLoadedImpl> get copyWith =>
      __$$HistoryStateLoadedImplCopyWithImpl<_$HistoryStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HistoryItem> items) loaded,
    required TResult Function(AppError error) error,
  }) {
    return loaded(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HistoryItem> items)? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return loaded?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HistoryItem> items)? loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryStateInitial value)? initial,
    TResult? Function(HistoryStateLoading value)? loading,
    TResult? Function(HistoryStateLoaded value)? loaded,
    TResult? Function(HistoryStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HistoryStateLoaded implements HistoryState {
  const factory HistoryStateLoaded(final List<HistoryItem> items) =
      _$HistoryStateLoadedImpl;

  List<HistoryItem> get items;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryStateLoadedImplCopyWith<_$HistoryStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryStateErrorImplCopyWith<$Res> {
  factory _$$HistoryStateErrorImplCopyWith(_$HistoryStateErrorImpl value,
          $Res Function(_$HistoryStateErrorImpl) then) =
      __$$HistoryStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$HistoryStateErrorImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateErrorImpl>
    implements _$$HistoryStateErrorImplCopyWith<$Res> {
  __$$HistoryStateErrorImplCopyWithImpl(_$HistoryStateErrorImpl _value,
      $Res Function(_$HistoryStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$HistoryStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  /// Create a copy of HistoryState
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

class _$HistoryStateErrorImpl implements HistoryStateError {
  const _$HistoryStateErrorImpl(this.error);

  @override
  final AppError error;

  @override
  String toString() {
    return 'HistoryState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateErrorImplCopyWith<_$HistoryStateErrorImpl> get copyWith =>
      __$$HistoryStateErrorImplCopyWithImpl<_$HistoryStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HistoryItem> items) loaded,
    required TResult Function(AppError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<HistoryItem> items)? loaded,
    TResult? Function(AppError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HistoryItem> items)? loaded,
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
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryStateInitial value)? initial,
    TResult? Function(HistoryStateLoading value)? loading,
    TResult? Function(HistoryStateLoaded value)? loaded,
    TResult? Function(HistoryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HistoryStateError implements HistoryState {
  const factory HistoryStateError(final AppError error) =
      _$HistoryStateErrorImpl;

  AppError get error;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryStateErrorImplCopyWith<_$HistoryStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
