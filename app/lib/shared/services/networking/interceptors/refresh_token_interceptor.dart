import 'package:dio/dio.dart';

//Helpers
import '../../../common/common.dart';

//Providers
import '../../service.dart';

/// A class that holds intercepting logic for refreshing expired tokens. This
/// is the last interceptor in the queue.
class RefreshTokenInterceptor extends QueuedInterceptor {
  RefreshTokenInterceptor(AuthenticationStorageService service)
      : _service = service;

  /// An instance of [Dio] for network requests

  late final AuthenticationStorageService _service;

  /// This method is used to send a refresh token request if the error
  /// indicates an expired token.
  ///
  /// In case of expired token, it creates a new [Dio] instance, replicates
  /// its options and locks the current instance to prevent further requests.
  /// The new instance retrieves a new token and updates it. The original
  /// request is retried with the new token.
  ///
  /// ** NOTE: ** Any requests from original instance will trigger all attached
  /// interceptors as expected.
  ///
  /// ** The structure of response in case of errors or the refresh request is
  /// dependant on the API and may not always be the same. It might need
  /// changing according to your own API. **
  @override
  Future<void> onError(
    DioError dioError,
    ErrorInterceptorHandler handler,
  ) async {
    if (dioError.response != null) {
      if (_service.checkErrorTokenExpired(dioError.response!)) {
        //Make new dio and lock old one
        final Dio tokenDio = Dio();
        //contentType already set in tokenDio headers
        tokenDio.options = BaseOptions(
          baseUrl: dioError.requestOptions.baseUrl,
          contentType: dioError.requestOptions.contentType,
          headers: <String, dynamic>{
            'accept': 'application/json, text/plain, */*'
          },
        );

        //Make refresh request and get new token
        final String? newToken = await _service.refreshTokenRequest(
          dioError: dioError,
          handler: handler,
          tokenDio: tokenDio,
        );

        if (newToken == null) {
          return super.onError(dioError, handler);
        }

        //Make original req with new token
        final Response<JSON> response = await tokenDio.request<JSON>(
          dioError.requestOptions.path,
          data: dioError.requestOptions.data,
          cancelToken: dioError.requestOptions.cancelToken,
          options: Options(
            headers: <String, Object?>{'Authorization': 'Bearer $newToken'},
          ),
        );

        //Make close dio when finish refresh
        tokenDio.close();
        return handler.resolve(response);
      }
    }

    //if not token expired error, forward it to try catch in dio_service
    return super.onError(dioError, handler);
  }
}
