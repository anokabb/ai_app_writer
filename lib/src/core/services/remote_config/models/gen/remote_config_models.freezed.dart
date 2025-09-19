// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../remote_config_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfigModel _$RemoteConfigModelFromJson(Map<String, dynamic> json) {
  return _RemoteConfigModel.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigModel {
  ApiConfigModel get api => throw _privateConstructorUsedError;
  SettingsConfigModel get settings => throw _privateConstructorUsedError;

  /// Serializes this RemoteConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteConfigModelCopyWith<RemoteConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigModelCopyWith<$Res> {
  factory $RemoteConfigModelCopyWith(
          RemoteConfigModel value, $Res Function(RemoteConfigModel) then) =
      _$RemoteConfigModelCopyWithImpl<$Res, RemoteConfigModel>;
  @useResult
  $Res call({ApiConfigModel api, SettingsConfigModel settings});

  $ApiConfigModelCopyWith<$Res> get api;
  $SettingsConfigModelCopyWith<$Res> get settings;
}

/// @nodoc
class _$RemoteConfigModelCopyWithImpl<$Res, $Val extends RemoteConfigModel>
    implements $RemoteConfigModelCopyWith<$Res> {
  _$RemoteConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? api = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      api: null == api
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as ApiConfigModel,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingsConfigModel,
    ) as $Val);
  }

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiConfigModelCopyWith<$Res> get api {
    return $ApiConfigModelCopyWith<$Res>(_value.api, (value) {
      return _then(_value.copyWith(api: value) as $Val);
    });
  }

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingsConfigModelCopyWith<$Res> get settings {
    return $SettingsConfigModelCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RemoteConfigModelImplCopyWith<$Res>
    implements $RemoteConfigModelCopyWith<$Res> {
  factory _$$RemoteConfigModelImplCopyWith(_$RemoteConfigModelImpl value,
          $Res Function(_$RemoteConfigModelImpl) then) =
      __$$RemoteConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiConfigModel api, SettingsConfigModel settings});

  @override
  $ApiConfigModelCopyWith<$Res> get api;
  @override
  $SettingsConfigModelCopyWith<$Res> get settings;
}

/// @nodoc
class __$$RemoteConfigModelImplCopyWithImpl<$Res>
    extends _$RemoteConfigModelCopyWithImpl<$Res, _$RemoteConfigModelImpl>
    implements _$$RemoteConfigModelImplCopyWith<$Res> {
  __$$RemoteConfigModelImplCopyWithImpl(_$RemoteConfigModelImpl _value,
      $Res Function(_$RemoteConfigModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? api = null,
    Object? settings = null,
  }) {
    return _then(_$RemoteConfigModelImpl(
      api: null == api
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as ApiConfigModel,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingsConfigModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteConfigModelImpl implements _RemoteConfigModel {
  const _$RemoteConfigModelImpl(
      {this.api = const ApiConfigModel(),
      this.settings = const SettingsConfigModel()});

  factory _$RemoteConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteConfigModelImplFromJson(json);

  @override
  @JsonKey()
  final ApiConfigModel api;
  @override
  @JsonKey()
  final SettingsConfigModel settings;

  @override
  String toString() {
    return 'RemoteConfigModel(api: $api, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigModelImpl &&
            (identical(other.api, api) || other.api == api) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, api, settings);

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigModelImplCopyWith<_$RemoteConfigModelImpl> get copyWith =>
      __$$RemoteConfigModelImplCopyWithImpl<_$RemoteConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigModelImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigModel implements RemoteConfigModel {
  const factory _RemoteConfigModel(
      {final ApiConfigModel api,
      final SettingsConfigModel settings}) = _$RemoteConfigModelImpl;

  factory _RemoteConfigModel.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigModelImpl.fromJson;

  @override
  ApiConfigModel get api;
  @override
  SettingsConfigModel get settings;

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteConfigModelImplCopyWith<_$RemoteConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiConfigModel _$ApiConfigModelFromJson(Map<String, dynamic> json) {
  return _ApiConfigModel.fromJson(json);
}

/// @nodoc
mixin _$ApiConfigModel {
  String get openaiApiKey => throw _privateConstructorUsedError;
  String get openaiBaseUrl => throw _privateConstructorUsedError;
  String get defaultModel => throw _privateConstructorUsedError;

  /// Serializes this ApiConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiConfigModelCopyWith<ApiConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiConfigModelCopyWith<$Res> {
  factory $ApiConfigModelCopyWith(
          ApiConfigModel value, $Res Function(ApiConfigModel) then) =
      _$ApiConfigModelCopyWithImpl<$Res, ApiConfigModel>;
  @useResult
  $Res call({String openaiApiKey, String openaiBaseUrl, String defaultModel});
}

/// @nodoc
class _$ApiConfigModelCopyWithImpl<$Res, $Val extends ApiConfigModel>
    implements $ApiConfigModelCopyWith<$Res> {
  _$ApiConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openaiApiKey = null,
    Object? openaiBaseUrl = null,
    Object? defaultModel = null,
  }) {
    return _then(_value.copyWith(
      openaiApiKey: null == openaiApiKey
          ? _value.openaiApiKey
          : openaiApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      openaiBaseUrl: null == openaiBaseUrl
          ? _value.openaiBaseUrl
          : openaiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      defaultModel: null == defaultModel
          ? _value.defaultModel
          : defaultModel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiConfigModelImplCopyWith<$Res>
    implements $ApiConfigModelCopyWith<$Res> {
  factory _$$ApiConfigModelImplCopyWith(_$ApiConfigModelImpl value,
          $Res Function(_$ApiConfigModelImpl) then) =
      __$$ApiConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String openaiApiKey, String openaiBaseUrl, String defaultModel});
}

/// @nodoc
class __$$ApiConfigModelImplCopyWithImpl<$Res>
    extends _$ApiConfigModelCopyWithImpl<$Res, _$ApiConfigModelImpl>
    implements _$$ApiConfigModelImplCopyWith<$Res> {
  __$$ApiConfigModelImplCopyWithImpl(
      _$ApiConfigModelImpl _value, $Res Function(_$ApiConfigModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openaiApiKey = null,
    Object? openaiBaseUrl = null,
    Object? defaultModel = null,
  }) {
    return _then(_$ApiConfigModelImpl(
      openaiApiKey: null == openaiApiKey
          ? _value.openaiApiKey
          : openaiApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      openaiBaseUrl: null == openaiBaseUrl
          ? _value.openaiBaseUrl
          : openaiBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      defaultModel: null == defaultModel
          ? _value.defaultModel
          : defaultModel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiConfigModelImpl implements _ApiConfigModel {
  const _$ApiConfigModelImpl(
      {this.openaiApiKey = '',
      this.openaiBaseUrl = 'https://api.openai.com/v1',
      this.defaultModel = 'gpt-3.5-turbo'});

  factory _$ApiConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiConfigModelImplFromJson(json);

  @override
  @JsonKey()
  final String openaiApiKey;
  @override
  @JsonKey()
  final String openaiBaseUrl;
  @override
  @JsonKey()
  final String defaultModel;

  @override
  String toString() {
    return 'ApiConfigModel(openaiApiKey: $openaiApiKey, openaiBaseUrl: $openaiBaseUrl, defaultModel: $defaultModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiConfigModelImpl &&
            (identical(other.openaiApiKey, openaiApiKey) ||
                other.openaiApiKey == openaiApiKey) &&
            (identical(other.openaiBaseUrl, openaiBaseUrl) ||
                other.openaiBaseUrl == openaiBaseUrl) &&
            (identical(other.defaultModel, defaultModel) ||
                other.defaultModel == defaultModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, openaiApiKey, openaiBaseUrl, defaultModel);

  /// Create a copy of ApiConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiConfigModelImplCopyWith<_$ApiConfigModelImpl> get copyWith =>
      __$$ApiConfigModelImplCopyWithImpl<_$ApiConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiConfigModelImplToJson(
      this,
    );
  }
}

abstract class _ApiConfigModel implements ApiConfigModel {
  const factory _ApiConfigModel(
      {final String openaiApiKey,
      final String openaiBaseUrl,
      final String defaultModel}) = _$ApiConfigModelImpl;

  factory _ApiConfigModel.fromJson(Map<String, dynamic> json) =
      _$ApiConfigModelImpl.fromJson;

  @override
  String get openaiApiKey;
  @override
  String get openaiBaseUrl;
  @override
  String get defaultModel;

  /// Create a copy of ApiConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiConfigModelImplCopyWith<_$ApiConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SettingsConfigModel _$SettingsConfigModelFromJson(Map<String, dynamic> json) {
  return _SettingsConfigModel.fromJson(json);
}

/// @nodoc
mixin _$SettingsConfigModel {
// Legal & Support URLs
  String get privacyPolicyUrl => throw _privateConstructorUsedError;
  String get termsOfServiceUrl => throw _privateConstructorUsedError;
  String get aboutUrl => throw _privateConstructorUsedError;
  String get helpAndSupportUrl => throw _privateConstructorUsedError;
  String get contactUsEmail =>
      throw _privateConstructorUsedError; // Account management
  bool get enableAccountDeletion => throw _privateConstructorUsedError;
  bool get enableDataDeletion => throw _privateConstructorUsedError;
  String get accountDeletionUrl =>
      throw _privateConstructorUsedError; // App updates
  bool get forceUpdate => throw _privateConstructorUsedError;

  /// Serializes this SettingsConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingsConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsConfigModelCopyWith<SettingsConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsConfigModelCopyWith<$Res> {
  factory $SettingsConfigModelCopyWith(
          SettingsConfigModel value, $Res Function(SettingsConfigModel) then) =
      _$SettingsConfigModelCopyWithImpl<$Res, SettingsConfigModel>;
  @useResult
  $Res call(
      {String privacyPolicyUrl,
      String termsOfServiceUrl,
      String aboutUrl,
      String helpAndSupportUrl,
      String contactUsEmail,
      bool enableAccountDeletion,
      bool enableDataDeletion,
      String accountDeletionUrl,
      bool forceUpdate});
}

/// @nodoc
class _$SettingsConfigModelCopyWithImpl<$Res, $Val extends SettingsConfigModel>
    implements $SettingsConfigModelCopyWith<$Res> {
  _$SettingsConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacyPolicyUrl = null,
    Object? termsOfServiceUrl = null,
    Object? aboutUrl = null,
    Object? helpAndSupportUrl = null,
    Object? contactUsEmail = null,
    Object? enableAccountDeletion = null,
    Object? enableDataDeletion = null,
    Object? accountDeletionUrl = null,
    Object? forceUpdate = null,
  }) {
    return _then(_value.copyWith(
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _value.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      aboutUrl: null == aboutUrl
          ? _value.aboutUrl
          : aboutUrl // ignore: cast_nullable_to_non_nullable
              as String,
      helpAndSupportUrl: null == helpAndSupportUrl
          ? _value.helpAndSupportUrl
          : helpAndSupportUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactUsEmail: null == contactUsEmail
          ? _value.contactUsEmail
          : contactUsEmail // ignore: cast_nullable_to_non_nullable
              as String,
      enableAccountDeletion: null == enableAccountDeletion
          ? _value.enableAccountDeletion
          : enableAccountDeletion // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDataDeletion: null == enableDataDeletion
          ? _value.enableDataDeletion
          : enableDataDeletion // ignore: cast_nullable_to_non_nullable
              as bool,
      accountDeletionUrl: null == accountDeletionUrl
          ? _value.accountDeletionUrl
          : accountDeletionUrl // ignore: cast_nullable_to_non_nullable
              as String,
      forceUpdate: null == forceUpdate
          ? _value.forceUpdate
          : forceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsConfigModelImplCopyWith<$Res>
    implements $SettingsConfigModelCopyWith<$Res> {
  factory _$$SettingsConfigModelImplCopyWith(_$SettingsConfigModelImpl value,
          $Res Function(_$SettingsConfigModelImpl) then) =
      __$$SettingsConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String privacyPolicyUrl,
      String termsOfServiceUrl,
      String aboutUrl,
      String helpAndSupportUrl,
      String contactUsEmail,
      bool enableAccountDeletion,
      bool enableDataDeletion,
      String accountDeletionUrl,
      bool forceUpdate});
}

/// @nodoc
class __$$SettingsConfigModelImplCopyWithImpl<$Res>
    extends _$SettingsConfigModelCopyWithImpl<$Res, _$SettingsConfigModelImpl>
    implements _$$SettingsConfigModelImplCopyWith<$Res> {
  __$$SettingsConfigModelImplCopyWithImpl(_$SettingsConfigModelImpl _value,
      $Res Function(_$SettingsConfigModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacyPolicyUrl = null,
    Object? termsOfServiceUrl = null,
    Object? aboutUrl = null,
    Object? helpAndSupportUrl = null,
    Object? contactUsEmail = null,
    Object? enableAccountDeletion = null,
    Object? enableDataDeletion = null,
    Object? accountDeletionUrl = null,
    Object? forceUpdate = null,
  }) {
    return _then(_$SettingsConfigModelImpl(
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _value.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      aboutUrl: null == aboutUrl
          ? _value.aboutUrl
          : aboutUrl // ignore: cast_nullable_to_non_nullable
              as String,
      helpAndSupportUrl: null == helpAndSupportUrl
          ? _value.helpAndSupportUrl
          : helpAndSupportUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactUsEmail: null == contactUsEmail
          ? _value.contactUsEmail
          : contactUsEmail // ignore: cast_nullable_to_non_nullable
              as String,
      enableAccountDeletion: null == enableAccountDeletion
          ? _value.enableAccountDeletion
          : enableAccountDeletion // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDataDeletion: null == enableDataDeletion
          ? _value.enableDataDeletion
          : enableDataDeletion // ignore: cast_nullable_to_non_nullable
              as bool,
      accountDeletionUrl: null == accountDeletionUrl
          ? _value.accountDeletionUrl
          : accountDeletionUrl // ignore: cast_nullable_to_non_nullable
              as String,
      forceUpdate: null == forceUpdate
          ? _value.forceUpdate
          : forceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsConfigModelImpl implements _SettingsConfigModel {
  const _$SettingsConfigModelImpl(
      {this.privacyPolicyUrl = '',
      this.termsOfServiceUrl = '',
      this.aboutUrl = '',
      this.helpAndSupportUrl = '',
      this.contactUsEmail = '',
      this.enableAccountDeletion = true,
      this.enableDataDeletion = true,
      this.accountDeletionUrl = '',
      this.forceUpdate = false});

  factory _$SettingsConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsConfigModelImplFromJson(json);

// Legal & Support URLs
  @override
  @JsonKey()
  final String privacyPolicyUrl;
  @override
  @JsonKey()
  final String termsOfServiceUrl;
  @override
  @JsonKey()
  final String aboutUrl;
  @override
  @JsonKey()
  final String helpAndSupportUrl;
  @override
  @JsonKey()
  final String contactUsEmail;
// Account management
  @override
  @JsonKey()
  final bool enableAccountDeletion;
  @override
  @JsonKey()
  final bool enableDataDeletion;
  @override
  @JsonKey()
  final String accountDeletionUrl;
// App updates
  @override
  @JsonKey()
  final bool forceUpdate;

  @override
  String toString() {
    return 'SettingsConfigModel(privacyPolicyUrl: $privacyPolicyUrl, termsOfServiceUrl: $termsOfServiceUrl, aboutUrl: $aboutUrl, helpAndSupportUrl: $helpAndSupportUrl, contactUsEmail: $contactUsEmail, enableAccountDeletion: $enableAccountDeletion, enableDataDeletion: $enableDataDeletion, accountDeletionUrl: $accountDeletionUrl, forceUpdate: $forceUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsConfigModelImpl &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl) &&
            (identical(other.termsOfServiceUrl, termsOfServiceUrl) ||
                other.termsOfServiceUrl == termsOfServiceUrl) &&
            (identical(other.aboutUrl, aboutUrl) ||
                other.aboutUrl == aboutUrl) &&
            (identical(other.helpAndSupportUrl, helpAndSupportUrl) ||
                other.helpAndSupportUrl == helpAndSupportUrl) &&
            (identical(other.contactUsEmail, contactUsEmail) ||
                other.contactUsEmail == contactUsEmail) &&
            (identical(other.enableAccountDeletion, enableAccountDeletion) ||
                other.enableAccountDeletion == enableAccountDeletion) &&
            (identical(other.enableDataDeletion, enableDataDeletion) ||
                other.enableDataDeletion == enableDataDeletion) &&
            (identical(other.accountDeletionUrl, accountDeletionUrl) ||
                other.accountDeletionUrl == accountDeletionUrl) &&
            (identical(other.forceUpdate, forceUpdate) ||
                other.forceUpdate == forceUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      privacyPolicyUrl,
      termsOfServiceUrl,
      aboutUrl,
      helpAndSupportUrl,
      contactUsEmail,
      enableAccountDeletion,
      enableDataDeletion,
      accountDeletionUrl,
      forceUpdate);

  /// Create a copy of SettingsConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsConfigModelImplCopyWith<_$SettingsConfigModelImpl> get copyWith =>
      __$$SettingsConfigModelImplCopyWithImpl<_$SettingsConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsConfigModelImplToJson(
      this,
    );
  }
}

abstract class _SettingsConfigModel implements SettingsConfigModel {
  const factory _SettingsConfigModel(
      {final String privacyPolicyUrl,
      final String termsOfServiceUrl,
      final String aboutUrl,
      final String helpAndSupportUrl,
      final String contactUsEmail,
      final bool enableAccountDeletion,
      final bool enableDataDeletion,
      final String accountDeletionUrl,
      final bool forceUpdate}) = _$SettingsConfigModelImpl;

  factory _SettingsConfigModel.fromJson(Map<String, dynamic> json) =
      _$SettingsConfigModelImpl.fromJson;

// Legal & Support URLs
  @override
  String get privacyPolicyUrl;
  @override
  String get termsOfServiceUrl;
  @override
  String get aboutUrl;
  @override
  String get helpAndSupportUrl;
  @override
  String get contactUsEmail; // Account management
  @override
  bool get enableAccountDeletion;
  @override
  bool get enableDataDeletion;
  @override
  String get accountDeletionUrl; // App updates
  @override
  bool get forceUpdate;

  /// Create a copy of SettingsConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsConfigModelImplCopyWith<_$SettingsConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
