import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../features/authentication/authentication.dart';
import '../shared/services/service.dart';

final GetIt getIt = GetIt.instance;

Future<void> resolveDependencies({
  bool? isAuthenticated,
}) async {
  getIt

    /// API Service
    ..registerSingleton<Dio>(Dio(BaseOptions(
      // ignore: avoid_redundant_argument_values
      baseUrl: const String.fromEnvironment('BASE_URL'),
      contentType: 'application/json',
    )))
    ..registerSingleton<AuthenticationService>(AuthenticationService())
    ..registerSingleton<DioService>(DioService(
      dioClient: getIt<Dio>(),
      interceptors: <Interceptor>[
        TokenInterceptor(getIt<AuthenticationService>()),
        if (kDebugMode) LoggingInterceptor(),
        RefreshTokenInterceptor(getIt<AuthenticationService>()),
      ],
    ))
    ..registerSingleton<ApiService>(ApiService(getIt<DioService>()))

    /// Authentication
    ..registerSingleton<AuthenticationRepository>(
        AuthenticationRepository(apiService: getIt<ApiService>()))
    ..registerSingleton<AuthenticationBloc>(AuthenticationBloc(getIt()));
}
