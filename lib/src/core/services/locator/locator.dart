import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/ai_api.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/openai_api.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/repos/ai_repo.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/repos/mock_ai_repo.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/repos/openai_repo.dart';
import 'package:phrasly_ai_tools/src/core/network/client/dio_factory.dart';
import 'package:phrasly_ai_tools/src/core/network/client/interceptors/logger_interceptor.dart';
import 'package:phrasly_ai_tools/src/core/network/client/interceptors/mock_logger_interceptor.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/revenue_cat_service.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/subscription_cubit.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:phrasly_ai_tools/src/features/auth/data/repos/auth_repo.dart';
import 'package:phrasly_ai_tools/src/features/auth/data/repos/firebase_auth_repo.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:phrasly_ai_tools/src/features/detector/data/repos/detector_repo.dart';
import 'package:phrasly_ai_tools/src/features/detector/data/repos/detector_repo_impl.dart';
import 'package:phrasly_ai_tools/src/features/documents/data/repos/history_repo.dart';
import 'package:phrasly_ai_tools/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/repos/generator_repo.dart';
import 'package:phrasly_ai_tools/src/features/generator/data/repos/generator_repo_impl.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/data/repos/humanizer_repo.dart';
import 'package:phrasly_ai_tools/src/features/humanizer/data/repos/humanizer_repo_impl.dart';
import 'package:phrasly_ai_tools/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:phrasly_ai_tools/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:phrasly_ai_tools/src/features/theme/presentation/cubit/theme_cubit.dart';

// TODO: Remove this when not testing
bool isMockTesting = kDebugMode && false;

final locator = GetIt.instance;

void setupLocator() {
  // 1. Dio Client
  locator.registerLazySingleton<Dio>(
    () => DioFactory.create(
      baseUrl: locator<RemoteConfigService>().data.api.openaiBaseUrl,
      interceptors: [
        // AuthInterceptor(() => locator<AuthRepo>().getToken() ?? ''),
        isMockTesting ? MockLoggerInterceptor() : LoggerInterceptor(),
      ],
    ),
  );

  // 2. APIs
  // locator.registerLazySingleton<AuthApi>(() => AuthApi(locator<Dio>()));

  locator.registerLazySingleton<AiApi>(() => OpenAIApi(locator<Dio>()));

  // 3. Services
  locator.registerLazySingleton<RemoteConfigService>(() => RemoteConfigService());
  locator.registerLazySingleton<RevenueCatService>(() => RevenueCatService());

  // 4. Repositories
  locator.registerLazySingleton<HistoryRepo>(() => HistoryRepo());
  locator.registerLazySingleton<AuthRepo>(() => FirebaseAuthRepo());

  if (isMockTesting) {
    locator.registerLazySingleton<AiRepo>(() => MockAiRepo());
  } else {
    locator.registerLazySingleton<AiRepo>(() => OpenAIRepo(api: locator<AiApi>()));
  }
  locator.registerLazySingleton<DetectorRepo>(() => DetectorRepoImpl(locator<AiRepo>()));
  locator.registerLazySingleton<HumanizerRepo>(() => HumanizerRepoImpl(locator<AiRepo>()));
  locator.registerLazySingleton<GeneratorRepo>(() => GeneratorRepoImpl(locator<AiRepo>()));

  // 5. Cubits
  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  locator.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  locator.registerLazySingleton<HistoryCubit>(() => HistoryCubit(locator<HistoryRepo>(), locator<AiRepo>()));
  locator.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
  locator.registerLazySingleton<AuthCubit>(() => AuthCubit(locator<AuthRepo>()));
  locator.registerLazySingleton<SubscriptionCubit>(() => SubscriptionCubit(locator<RemoteConfigService>()));
}

void onLoggedIn(GetIt instance) async {
  log('Locator onLoggedIn');
}

List<BlocProvider> blocProviders = [
  BlocProvider<ThemeCubit>.value(value: locator<ThemeCubit>()),
  BlocProvider<LanguageCubit>.value(value: locator<LanguageCubit>()),
  BlocProvider<HistoryCubit>.value(value: locator<HistoryCubit>()),
  BlocProvider<SettingsCubit>.value(value: locator<SettingsCubit>()),
  BlocProvider<AuthCubit>(create: (_) => locator<AuthCubit>(), lazy: false),
  BlocProvider<SubscriptionCubit>.value(value: locator<SubscriptionCubit>()),
];
