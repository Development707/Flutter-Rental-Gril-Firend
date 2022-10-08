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
      TokenExpiredException: (_) => Text(l10n.your_session_has_expired),
      OtherException: (String name) => Text(name),
      FormatException: (String name) => Text(name),
      UnrecognizedException: (String name) => Text(name),
      ApiException: (_, __) => Text(l10n.serrver_error),
      orElse: () => Text(l10n.error),
    );

    final Widget content = exception.maybeWhen<Widget>(
      CancelException: (_) => Text(l10n.request_cancelled_prematurely),
      FetchDataException: (_) => Text(l10n.no_internet_connectivity),
      TokenExpiredException: (_) => Text(l10n.token_session_expired),
      OtherException: (_) => Text(l10n.other_error),
      FormatException: (_) => Text(l10n.invalid_format_or_value_error),
      UnrecognizedException: (_) => Text(l10n.unknown_error),
      ApiException: (_, String message) =>
          Text(message, maxLines: 3, overflow: TextOverflow.ellipsis),
      orElse: () => Text(l10n.request_failed),
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
          onPressed: () => Navigator.of(this, rootNavigator: true).pop(1),
          child: Text(l10n.log_in),
        )
      ],
      orElse: () => <Widget>[
        AppElevatedButton(
          onPressed: () => Navigator.of(this, rootNavigator: true).pop(0),
          child: Text(l10n.ok),
        ),
      ],
    );

    final int? result = await showDefaultDialog<int>(
      title: title,
      content: content,
      image: image,
      actions: actions,
    );

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
