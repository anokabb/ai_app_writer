// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../remote_config_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigModelImpl _$$RemoteConfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteConfigModelImpl(
      api: json['api'] == null
          ? const ApiConfigModel()
          : ApiConfigModel.fromJson(json['api'] as Map<String, dynamic>),
      settings: json['settings'] == null
          ? const SettingsConfigModel()
          : SettingsConfigModel.fromJson(
              json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RemoteConfigModelImplToJson(
        _$RemoteConfigModelImpl instance) =>
    <String, dynamic>{
      'api': instance.api,
      'settings': instance.settings,
    };

_$ApiConfigModelImpl _$$ApiConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$ApiConfigModelImpl(
      openaiApiKey: json['openai_api_key'] as String? ?? '',
      openaiBaseUrl:
          json['openai_base_url'] as String? ?? 'https://api.openai.com/v1',
      defaultModel: json['default_model'] as String? ?? 'gpt-3.5-turbo',
    );

Map<String, dynamic> _$$ApiConfigModelImplToJson(
        _$ApiConfigModelImpl instance) =>
    <String, dynamic>{
      'openai_api_key': instance.openaiApiKey,
      'openai_base_url': instance.openaiBaseUrl,
      'default_model': instance.defaultModel,
    };

_$SettingsConfigModelImpl _$$SettingsConfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingsConfigModelImpl(
      privacyPolicyUrl: json['privacy_policy_url'] as String? ?? '',
      termsOfServiceUrl: json['terms_of_service_url'] as String? ?? '',
      aboutUrl: json['about_url'] as String? ?? '',
      helpAndSupportUrl: json['help_and_support_url'] as String? ?? '',
      contactUsEmail: json['contact_us_email'] as String? ?? '',
      enableAccountDeletion: json['enable_account_deletion'] as bool? ?? true,
      enableDataDeletion: json['enable_data_deletion'] as bool? ?? true,
      accountDeletionUrl: json['account_deletion_url'] as String? ?? '',
      forceUpdate: json['force_update'] as bool? ?? false,
    );

Map<String, dynamic> _$$SettingsConfigModelImplToJson(
        _$SettingsConfigModelImpl instance) =>
    <String, dynamic>{
      'privacy_policy_url': instance.privacyPolicyUrl,
      'terms_of_service_url': instance.termsOfServiceUrl,
      'about_url': instance.aboutUrl,
      'help_and_support_url': instance.helpAndSupportUrl,
      'contact_us_email': instance.contactUsEmail,
      'enable_account_deletion': instance.enableAccountDeletion,
      'enable_data_deletion': instance.enableDataDeletion,
      'account_deletion_url': instance.accountDeletionUrl,
      'force_update': instance.forceUpdate,
    };
