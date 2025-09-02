import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/src/core/constants/env_config.dart';
import 'package:flutter_app_template/src/core/network/ai_api/ai_api.dart';
import 'package:flutter_app_template/src/core/network/ai_api/openai_api.dart';
import 'package:flutter_app_template/src/core/network/ai_api/repos/ai_repo.dart';
import 'package:flutter_app_template/src/core/network/ai_api/repos/mock_ai_repo.dart';
import 'package:flutter_app_template/src/core/network/ai_api/repos/openai_repo.dart';
import 'package:flutter_app_template/src/core/network/client/dio_factory.dart';
import 'package:flutter_app_template/src/core/network/client/interceptors/logger_interceptor.dart';
import 'package:flutter_app_template/src/core/network/client/interceptors/mock_logger_interceptor.dart';
import 'package:flutter_app_template/src/features/detector/data/repos/detector_repo.dart';
import 'package:flutter_app_template/src/features/detector/data/repos/detector_repo_impl.dart';
import 'package:flutter_app_template/src/features/documents/data/repos/history_repo.dart';
import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:flutter_app_template/src/features/generator/data/repos/generator_repo.dart';
import 'package:flutter_app_template/src/features/generator/data/repos/generator_repo_impl.dart';
import 'package:flutter_app_template/src/features/humanizer/data/repos/humanizer_repo.dart';
import 'package:flutter_app_template/src/features/humanizer/data/repos/humanizer_repo_impl.dart';
import 'package:flutter_app_template/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:flutter_app_template/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// TODO: Remove this when not testing
bool isMockTesting = kDebugMode && false;

final locator = GetIt.instance;

void setupLocator() {
  // 1. Dio Client
  locator.registerLazySingleton<Dio>(
    () => DioFactory.create(
      baseUrl: EnvConfig.baseUrl,
      interceptors: [
        // AuthInterceptor(() => locator<AuthRepo>().getToken() ?? ''),
        isMockTesting ? MockLoggerInterceptor() : LoggerInterceptor(),
      ],
    ),
  );

  // 2. APIs
  // locator.registerLazySingleton<AuthApi>(() => AuthApi(locator<Dio>()));

  locator.registerLazySingleton<AiApi>(() => OpenAIApi(locator<Dio>()));

  // 3. Repositories
  locator.registerLazySingleton<HistoryRepo>(() => HistoryRepo());

  if (isMockTesting) {
    locator.registerLazySingleton<AiRepo>(() => MockAiRepo());
  } else {
    locator.registerLazySingleton<AiRepo>(() => OpenAIRepo(api: locator<AiApi>(), apiKey: EnvConfig.OPENAI_API_KEY));
  }
  locator.registerLazySingleton<DetectorRepo>(() => DetectorRepoImpl(locator<AiRepo>()));
  locator.registerLazySingleton<HumanizerRepo>(() => HumanizerRepoImpl(locator<AiRepo>()));
  locator.registerLazySingleton<GeneratorRepo>(() => GeneratorRepoImpl(locator<AiRepo>()));

  // 4. Cubits
  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  locator.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  locator.registerLazySingleton<HistoryCubit>(() => HistoryCubit(locator<HistoryRepo>(), locator<AiRepo>()));
  locator.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
  // locator.registerLazySingleton<AuthCubit>(() => AuthCubit(locator<AuthRepo>()));
}

void onLoggedIn(GetIt instance) async {
  log('Locator onLoggedIn');
}

List<BlocProvider> blocProviders = [
  BlocProvider<ThemeCubit>.value(value: locator<ThemeCubit>()),
  BlocProvider<LanguageCubit>.value(value: locator<LanguageCubit>()),
  BlocProvider<HistoryCubit>.value(value: locator<HistoryCubit>()),
  BlocProvider<SettingsCubit>.value(value: locator<SettingsCubit>()),
  // BlocProvider<AuthCubit>(create: (_) => locator<AuthCubit>(), lazy: false),
];
