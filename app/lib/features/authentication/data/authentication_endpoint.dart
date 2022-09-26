// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an authentication [endpoint].
  static String authentication(AuthenticationEndpoint endpoint, {int? id}) {
    const String path = '/authentication';
    switch (endpoint) {
      case AuthenticationEndpoint.LOGIN:
        return path;
      case AuthenticationEndpoint.REFRESH_TOKEN:
        return path;
      case AuthenticationEndpoint.FORGOT_PASSWORD:
        return '$path/password/request';
      case AuthenticationEndpoint.SUBMIT_OTP:
        return '$path/otp';
    }
  }
}

enum AuthenticationEndpoint {
  LOGIN,

  REFRESH_TOKEN,

  FORGOT_PASSWORD,

  SUBMIT_OTP,
}
