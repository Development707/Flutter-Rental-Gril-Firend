import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dio/dio.dart';

import '../../../common/common.dart';

/// A class that intercepts network requests for logging purposes only. This is
/// the second interceptor in case of both request and response.
///
/// ** This interceptor doesn't modify the request or response in any way. And
/// only works in `debug` mode **
class LoggingInterceptor extends Interceptor {
  /// This method intercepts an out-going request before it reaches the
  /// destination.
  ///
  /// [options] contains http request information and configuration.
  /// [handler] is used to forward, resolve, or reject requests.
  ///
  /// This method is used to logPrint details of all out going requests, then pass
  /// it on after that. It may again be intercepted if there are any
  /// after it. If none, it is passed to [Dio].
  ///
  /// The [RequestInterceptorHandler] in each method controls the what will
  /// happen to the intercepted request. It has 3 possible options:
  ///
  /// - [handler.next]/[super.onRequest], if you want to forward the request.
  /// - [handler.resolve]/[super.onResponse], if you want to resolve the
  /// request with your custom [Response]. All ** request ** interceptors are ignored.
  /// - [handler.reject]/[super.onError], if you want to fail the request
  /// with your custom [DioError].
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final String httpMethod = options.method.toUpperCase();
    final String url = options.baseUrl + options.path;

    _printHeader(title: httpMethod, text: url);

    logPrint('\tHeaders:');
    options.headers.forEach((String k, Object? v) => logPrint('\t\t$k: $v'));

    if (options.queryParameters.isNotEmpty) {
      logPrint('\tQueryParams:');
      options.queryParameters
          .forEach((String k, Object? v) => logPrint('\t\t$k: $v'));
    }

    if (options.data is JSON) {
      logPrint('\tBody:\n\t ${_getBody(options.data)}');
    }

    _printFooter(title: httpMethod);

    return super.onRequest(options, handler);
  }

  /// This method intercepts an incoming response before it reaches Dio.
  ///
  /// [response] contains http [Response] info.
  /// [handler] is used to forward, resolve, or reject responses.
  ///
  /// This method is used to logPrint all details of incoming responses, then pass
  /// it on after that. It may again be intercepted if there are any
  /// after it. If none, it is passed to [Dio].
  ///
  /// The [RequestInterceptorHandler] in each method controls the what will
  /// happen to the intercepted response. It has 3 possible options:
  ///
  /// - [handler.next]/[super.onRequest], if you want to forward the [Response].
  /// - [handler.resolve]/[super.onResponse], if you want to resolve the
  /// [Response] with your custom data. All ** response ** interceptors are ignored.
  /// - [handler.reject]/[super.onError], if you want to fail the response
  /// with your custom [DioError].
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final RequestOptions requestOp = response.requestOptions;
    _printHeader(
        title:
            'HTTP ║ ${requestOp.method} ║ Status: ${response.statusCode} ${response.statusMessage}',
        text: requestOp.uri.toString(),
        type: 1);

    logPrint('\tResponse: ${_getBody(response.data)}', type: 1);

    _printFooter(title: 'HTTP', type: 1);

    return super.onResponse(response, handler);
  }

  /// This method intercepts any exceptions thrown by Dio, or passed from a
  /// previous interceptor.
  ///
  /// [dioError] contains dioErroror info when the request failed.
  /// [handler] is used to forward, resolve, or reject dioErrorors.
  ///
  /// This method is used to logPrint all details of the dioErroror arising due to the
  /// failed request, then pass it on after that. It may again be intercepted
  /// if there are any after it. If none, it is passed to [Dio].
  ///
  /// ** The structure of response in case of dioErrorors is dependant on the API and
  /// may not always be the same. It might need changing according to your
  /// own API. **
  ///
  /// The [RequestInterceptorHandler] in each method controls the what will
  /// happen to the intercepted dioErroror. It has 3 possible options:
  ///
  /// - [handler.next]/[super.onRequest], if you want to forward the [Response].
  /// - [handler.resolve]/[super.onResponse], if you want to resolve the
  /// [Response] with your custom data. All ** dioErroror ** interceptors are ignored.
  /// - [handler.reject]/[super.onError], if you want to fail the response
  /// with your custom [DioError].
  @override
  void onError(
    DioError dioError,
    ErrorInterceptorHandler handler,
  ) {
    if (dioError.response != null) {
      final Response<dynamic> response = dioError.response!;
      _printHeader(
          title:
              'ERROR ║ DioError: ${response.statusCode} ${response.statusMessage}',
          text: response.requestOptions.uri.toString(),
          type: 2);

      logPrint('\tException: ${response.statusMessage}', type: 2);
      try {
        final String? message =
            (((response.data as JSON)['errors'] as List<dynamic>).first
                as JSON)['message'] as String?;
        logPrint('\tMessage: $message', type: 2);
      } catch (_) {}
    } else if (dioError.type == DioErrorType.other &&
        dioError.message.contains(ExceptionConstants.SocketException)) {
      _printHeader(
          title: 'ERROR ║ Exception: FetchDataException',
          text: 'Message: No internet connectivity',
          type: 2);
    } else {
      _printHeader(
          title: 'ERROR ║ Exception: Unknown Error',
          text: 'Message: Unknown Error',
          type: 2);
    }

    _printFooter(title: 'ERROR', type: 2);

    try {
      logPrint(cURLRepresentation(dioError.requestOptions));
    } catch (err) {
      logPrint('\x1B[37munable to create a CURL representation of the errored');
    }

    return super.onError(dioError, handler);
  }

  /// [type] color log
  /// - 0 request
  /// - 1 reponse
  /// - 2 error
  void logPrint(String message, {int type = 0}) {
    switch (type) {
      case 0:
        dev.log('\x1B[33m$message', name: 'Dio');
        break;
      case 1:
        dev.log('\x1B[32m$message', name: 'Dio');
        break;
      case 2:
        dev.log('\x1B[31m$message', name: 'Dio');
        break;
      default:
        dev.log(message, name: 'Dio');
    }
  }

  void _printHeader({String? title, String? text, int type = 0}) {
    logPrint('╔╣ $title', type: type);
    logPrint('║ $text', type: type);
  }

  void _printFooter({String? title, int type = 0}) {
    logPrint('╚═ END $title', type: type);
  }

  String? _getBody(dynamic data) {
    try {
      return jsonEncode(data);
    } catch (_) {
      return data.toString();
    }
  }

  String cURLRepresentation(RequestOptions options) {
    final List<String> components = <String>['\x1B[37mcurl'];
    components.add('-L "${options.uri.toString()}"');
    components.add('-X "${options.method.toUpperCase()}"');
    options.headers.forEach((String k, dynamic v) {
      if (!<String>['Cookie', 'content-length'].contains(k)) {
        components.add('-H "$k: $v"');
      }
    });
    if (options.data != null) {
      String data = json.encode(options.data);
      data = data.replaceAll('"', r'\"');
      components.add('-d "$data"');
    }
    return components.join(' ');
  }
}
