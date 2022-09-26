import 'package:dio/dio.dart';

abstract class AuthenticationStorageService {
  /// Returns last authentication token
  Future<String?> getAuthToken();

  /// Check error type to be token expired error
  bool checkErrorTokenExpired(Response<dynamic> response);

  /// Make refresh request and get new token
  Future<String?> refreshTokenRequest({
    required DioError dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
  });
}
