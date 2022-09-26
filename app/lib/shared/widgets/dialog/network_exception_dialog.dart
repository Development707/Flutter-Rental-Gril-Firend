import 'package:flutter/material.dart';

import '../../../config/dependency_container.dart';
import '../../../constants/constants.dart';
import '../../../features/authentication/authentication.dart';
import '../../common/common.dart';
import '../../services/service.dart';
import '../button/elevated_button.dart';
import '../dialog/default_dialog.dart';

extension NetworkExceptionDialog on BuildContext {
  Future<int> showNetworkExceptionDialog(NetworkException exception) async {
    final Widget title = exception.maybeWhen<Widget>(
      CancelException: (String name) => Text(name),
      FetchDataException: (String name) => Text(name),
      TokenExpiredException: (_) => Text(l1On.your_session_has_expired),
      OtherException: (String name) => Text(name),
      FormatException: (String name) => Text(name),
      UnrecognizedException: (String name) => Text(name),
      ApiException: (_, __) => Text(l1On.serrver_error),
      orElse: () => Text(l1On.error),
    );

    final Widget content = exception.maybeWhen<Widget>(
      CancelException: (_) => Text(l1On.request_cancelled_prematurely),
      FetchDataException: (_) => Text(l1On.no_internet_connectivity),
      TokenExpiredException: (_) => Text(l1On.token_session_expired),
      OtherException: (_) => Text(l1On.other_error),
      FormatException: (_) => Text(l1On.invalid_format_or_value_error),
      UnrecognizedException: (_) => Text(l1On.unknown_error),
      ApiException: (_, String message) =>
          Text(message, maxLines: 3, overflow: TextOverflow.ellipsis),
      orElse: () => Text(l1On.request_failed),
    );

    final Widget? image = exception.maybeWhen<Widget?>(
      ConnectTimeoutException: (_) => Image.asset(AppImages.noInternet),
      FetchDataException: (_) => Image.asset(AppImages.noInternet),
      CancelException: (_) => Image.asset(AppImages.requestFail),
      SendTimeoutException: (_) => Image.asset(AppImages.requestFail),
      ReceiveTimeoutException: (_) => Image.asset(AppImages.requestFail),
      TokenExpiredException: (_) => Image.asset(AppImages.login),
      FormatException: (_) => Image.asset(AppImages.banError),
      orElse: () => Image.asset(AppImages.otherError),
    );

    final List<Widget> actions = exception.maybeWhen<List<Widget>>(
      TokenExpiredException: (_) => <Widget>[
        AppElevatedButton(
          onPressed: () => Navigator.of(this).pop(1),
          child: Text(l1On.log_in),
        )
      ],
      orElse: () => <Widget>[
        AppElevatedButton(
          onPressed: () => Navigator.of(this).pop(0),
          child: Text(l1On.ok),
        ),
      ],
    );

    final int? result = await showDefaultDialog<int>(
      title: title,
      content: content,
      image: image,
      actions: actions,
    );

    // Fix animation close dialog
    await Future<void>.delayed(const Duration(milliseconds: 500));

    /// The returned result will perform the action
    /// 0. no action
    /// 1. go login
    /// 2. ...
    if (result == 1) {
      getIt<AuthenticationBloc>().add(const AuthenticationEvent.loggedOut());
    }

    return result ?? 0;
  }
}
