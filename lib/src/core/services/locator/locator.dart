import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/src/core/constants/env_config.dart';
import 'package:flutter_app_template/src/core/network/client/dio_factory.dart';
import 'package:flutter_app_template/src/core/network/client/interceptors/logger_interceptor.dart';
import 'package:flutter_app_template/src/core/network/client/interceptors/mock_logger_interceptor.dart';
import 'package:flutter_app_template/src/features/documents/data/repos/history_repo.dart';
import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_cubit.dart';
import 'package:flutter_app_template/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter_app_template/src/features/writer/data/api/gemini_writer_api.dart';
import 'package:flutter_app_template/src/features/writer/data/api/openai_writer_api.dart';
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
  locator.registerLazySingleton<GeminiWriterApi>(() => GeminiWriterApi(locator<Dio>()));
  locator.registerLazySingleton<OpenAIWriterApi>(() => OpenAIWriterApi(locator<Dio>()));

  // 3. Repositories
  locator.registerLazySingleton<HistoryRepo>(() => HistoryRepo());

  if (isMockTesting) {
    // locator.registerLazySingleton<AuthRepo>(() => MockAuthRepo());
  } else {
    // locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(locator<AuthApi>()));
    // For now, use mock writer repo. In production, you would register the appropriate repo based on user preference
  }

  // 4. Cubits
  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  locator.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  locator.registerLazySingleton<HistoryCubit>(() => HistoryCubit(locator<HistoryRepo>()));
  // locator.registerLazySingleton<AuthCubit>(() => AuthCubit(locator<AuthRepo>()));
}

void onLoggedIn(GetIt instance) async {
  log('Locator onLoggedIn');
}

List<BlocProvider> blocProviders = [
  BlocProvider<ThemeCubit>.value(value: locator<ThemeCubit>()),
  BlocProvider<LanguageCubit>.value(value: locator<LanguageCubit>()),
  BlocProvider<HistoryCubit>.value(value: locator<HistoryCubit>()),
  // BlocProvider<AuthCubit>(create: (_) => locator<AuthCubit>(), lazy: false),
];
