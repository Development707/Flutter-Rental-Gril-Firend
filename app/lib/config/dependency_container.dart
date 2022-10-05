// ignore_for_file: avoid_redundant_argument_values

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
    ..registerSingleton(AuthenticationService())
    ..registerSingleton(Dio(BaseOptions(
      baseUrl: const String.fromEnvironment('BASE_URL'),
      contentType: 'application/json',
      headers: <String, dynamic>{'accept': 'application/json, text/plain, */*'},
    )))
    ..registerSingleton(DioService(
      dioClient: getIt(),
      interceptors: <Interceptor>[
        TokenInterceptor(getIt<AuthenticationService>()),
        if (kDebugMode) LoggingInterceptor(),
        RefreshTokenInterceptor(getIt<AuthenticationService>()),
      ],
    ))
    ..registerSingleton(ApiService(getIt()))

    /// Authentication
    ..registerSingleton(AuthenticationRepository(getIt()))
    ..registerSingleton(AuthenticationBloc(getIt()));

  await getIt.allReady();
}
