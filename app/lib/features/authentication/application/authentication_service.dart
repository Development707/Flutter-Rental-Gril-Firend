import 'package:dio/dio.dart';

import '../../../shared/common/common.dart';
import '../../../shared/services/service.dart';
import '../data/authentication_endpoint.dart';

class AuthenticationService extends AuthenticationStorageService {
  /// The name of authentication access token key
  static const String _tokenKey = 'authTokenKey';
  static const String _userKey = 'userKey';

  final KeyValueStorageBase _keyValueStorage = KeyValueStorageBase.instance;

  @override
  bool checkErrorTokenExpired(Response<dynamic> response) {
    return response.statusCode == 401 &&
        response.data is String &&
        response.data == 'tokenExpiredException';
  }

  @override
  Future<String?> getAuthToken() async =>
      _keyValueStorage.getEncrypted(_tokenKey);

  Future<bool> saveAuthToken(String token) =>
      _keyValueStorage.setEncrypted(_tokenKey, token);

  @override
  Future<String?> refreshTokenRequest({
    required DioError dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
  }) async {
    try {
      final String? token = await getAuthToken();

      final Response<JSON> response = await tokenDio.post<JSON>(
        ApiEndpoint.authentication(AuthenticationEndpoint.REFRESH_TOKEN),
        data: token,
      );

      return (response.data! as QueryParams)['token'];
    } on DioError catch (de) {
      //only caught here for logging
      //forward to try-catch in dio_service for handling
      handler.reject(de);
      return null;
    } on Exception catch (_) {
      //only caught here for logging
      //forward to try-catch in dio_service for handling
      return null;
    }
  }

  Future<String?> getUser() => _keyValueStorage.getEncrypted(_userKey);
  Future<bool> saveUser(String user) =>
      _keyValueStorage.setEncrypted(_userKey, user);

  /// Resets the authentication. Even though these methods are asynchronous, we
  /// don't care about their completion which is why we don't use `await` and
  /// let them execute in the background.
  void resetKeys() {
    _keyValueStorage.clearBox();
    _keyValueStorage.clearEncrypted();
  }
}
