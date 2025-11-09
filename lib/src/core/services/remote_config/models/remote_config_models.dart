import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/remote_config_models.freezed.dart';
part 'gen/remote_config_models.g.dart';

/// Main remote config model that contains essential configuration
@freezed
class RemoteConfigModel with _$RemoteConfigModel {
  const factory RemoteConfigModel({
    @Default(ApiConfigModel()) ApiConfigModel api,
    @Default(SettingsConfigModel()) SettingsConfigModel settings,
    @Default(RevenueCatConfigModel()) RevenueCatConfigModel revenueCat,
  }) = _RemoteConfigModel;

  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) => _$RemoteConfigModelFromJson(json);
}

/// RevenueCat configuration settings
@freezed
class RevenueCatConfigModel with _$RevenueCatConfigModel {
  const factory RevenueCatConfigModel({
    @Default('') String revenueIOSApiKey,
    @Default('') String revenueAndroidApiKey,
    @Default('pro') String defaultEntitlementIdentifier,
    @Default(1) int freeLimit,
    @Default(5) int closeButtonDelay,
    @Default(false) bool showDiscountAfterPaywall,
    @Default('') String hideDiscountPaywallForVersion,
  }) = _RevenueCatConfigModel;

  factory RevenueCatConfigModel.fromJson(Map<String, dynamic> json) => _$RevenueCatConfigModelFromJson(json);
}

/// API configuration settings
@freezed
class ApiConfigModel with _$ApiConfigModel {
  const factory ApiConfigModel({
    @Default('') String openaiApiKey,
    @Default('https://api.openai.com/v1') String openaiBaseUrl,
    @Default('gpt-3.5-turbo') String defaultModel,
    @Default('https://beta.aiadmin.pro') String backendBaseUrlBeta,
    @Default('https://aiadmin.pro') String backendBaseUrlProduction,
    @Default('') String backendApiKeyBeta,
    @Default('') String backendApiKeyProduction,
  }) = _ApiConfigModel;

  factory ApiConfigModel.fromJson(Map<String, dynamic> json) => _$ApiConfigModelFromJson(json);
}

/// Settings configuration - essential settings data
@freezed
class SettingsConfigModel with _$SettingsConfigModel {
  const factory SettingsConfigModel({
    // Legal & Support URLs
    @Default('') String privacyPolicyUrl,
    @Default('') String termsOfServiceUrl,
    @Default('') String aboutUrl,
    @Default('') String helpAndSupportUrl,
    @Default('') String contactUsEmail,

    // Account management
    @Default(true) bool enableAccountDeletion,
    @Default(true) bool enableDataDeletion,
    @Default('') String accountDeletionUrl,

    // App updates
    @Default(false) bool forceUpdate,
  }) = _SettingsConfigModel;

  factory SettingsConfigModel.fromJson(Map<String, dynamic> json) => _$SettingsConfigModelFromJson(json);
}

/// Remote config keys constants
class RemoteConfigKeys {
  // API Config
  static const String openaiApiKey = 'openai_api_key';
  static const String openaiBaseUrl = 'openai_base_url';
  static const String defaultModel = 'default_model';
  static const String backendBaseUrlBeta = 'backend_base_url_beta';
  static const String backendBaseUrlProduction = 'backend_base_url_production';
  static const String backendApiKeyBeta = 'backend_api_key_beta';
  static const String backendApiKeyProduction = 'backend_api_key_production';
  static const String maxTokens = 'max_tokens';
  static const String temperature = 'temperature';

  // Settings Config
  static const String privacyPolicyUrl = 'privacy_policy_url';
  static const String termsOfServiceUrl = 'terms_of_service_url';
  static const String helpAndSupportUrl = 'help_and_support_url';
  static const String contactUsUrl = 'contact_us_url';
  static const String aboutUrl = 'about_url';
  static const String enableAccountDeletion = 'enable_account_deletion';
  static const String enableDataDeletion = 'enable_data_deletion';
  static const String accountDeletionUrl = 'account_deletion_url';
  static const String contactUsEmail = 'contact_us_email';
  static const String forceUpdate = 'force_update';

  // RevenueCat Config
  static const String revenueIOSApiKey = 'revenue_ios_api_key';
  static const String revenueAndroidApiKey = 'revenue_android_api_key';
  static const String closeButtonDelay = 'close_button_delay';
  static const String freeLimit = 'free_limit';
  static const String showDiscountAfterPaywall = 'show_discount_after_paywall';
  static const String hideDiscountPaywallForVersion = 'hide_discount_paywall_for_version';
}
