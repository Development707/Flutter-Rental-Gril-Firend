// ignore_for_file: non_constant_identifier_names
import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//Helpers
import '../../common/common.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException implements Exception {
  const NetworkException._() : super();

  const factory NetworkException.FormatException({
    @Default(ExceptionConstants.FormatException) String name,
  }) = _FormatException;

  const factory NetworkException.FetchDataException({
    @Default(ExceptionConstants.FetchDataException) String name,
  }) = _FetchDataException;

  const factory NetworkException.TokenExpiredException({
    @Default(ExceptionConstants.TokenExpiredException) String name,
  }) = _TokenExpiredException;

  const factory NetworkException.OtherException({
    @Default(ExceptionConstants.OtherException) String name,
  }) = _OtherException;

  const factory NetworkException.UnrecognizedException({
    @Default(ExceptionConstants.UnrecognizedException) String name,
  }) = _UnrecognizedException;

  const factory NetworkException.CancelException({
    @Default(ExceptionConstants.CancelException) String name,
  }) = _CancelException;

  const factory NetworkException.ConnectTimeoutException({
    @Default(ExceptionConstants.ConnectTimeoutException) String name,
  }) = _ConnectTimeoutException;

  const factory NetworkException.ReceiveTimeoutException({
    @Default(ExceptionConstants.ReceiveTimeoutException) String name,
  }) = _ReceiveTimeoutException;

  const factory NetworkException.SendTimeoutException({
    @Default(ExceptionConstants.SendTimeoutException) String name,
  }) = _SendTimeoutException;

  const factory NetworkException.ApiException({
    @Default(ExceptionConstants.FormatException) String name,
    required String message,
  }) = _ApiException;

  static NetworkException getDioException(Object error) {
    if (kDebugMode) {
      StackTrace? stackTrace;
      if (error is Error) {
        stackTrace = error.stackTrace;
      }
      dev.log('\x1B[33mError type: ${error.runtimeType}',
          error: error, stackTrace: stackTrace);
    }

    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          return const NetworkException.CancelException();
        case DioErrorType.connectTimeout:
          return const NetworkException.ConnectTimeoutException();
        case DioErrorType.sendTimeout:
          return const NetworkException.SendTimeoutException();
        case DioErrorType.receiveTimeout:
          return const NetworkException.ReceiveTimeoutException();
        case DioErrorType.response:
        case DioErrorType.other:
          if (error.message.contains(ExceptionConstants.SocketException)) {
            return const NetworkException.FetchDataException();
          } else if (error.response?.statusCode == 400) {
            return const NetworkException.FormatException();
          }

          String? message;
          try {
            message =
                (((error.response?.data as JSON)['errors'] as List<dynamic>)
                    .first as JSON)['message'] as String?;
          } catch (_) {}

          switch (message) {
            case 'Your session expire, please login again':
              return const NetworkException.TokenExpiredException();
            default:
              return NetworkException.ApiException(
                message: message ?? error.message,
              );
          }
      }
    } else if (error is FormatException || error is TypeError) {
      return const NetworkException.FormatException();
    } else if (error is Exception || error is Error) {
      return const NetworkException.OtherException();
    } else {
      return const NetworkException.UnrecognizedException();
    }
  }
}
