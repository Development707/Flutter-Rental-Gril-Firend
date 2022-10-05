import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/common/common.dart';
import '../../../shared/widgets/widgets.dart';
import '../../authentication/authentication.dart';
import '../../help_center/help_center.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppOutlinedButton(
            expandedWith: false,
            child: Text(context.l10n.log_out),
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(const AuthenticationEvent.loggedOut());
            }),
        AppOutlinedButton(
            expandedWith: false,
            child: Text(context.l10n.help_center),
            onPressed: () {
              context.goRouter.go(
                  '${context.goRouter.location}/${HelpCenterPage.routerPath}');
            }),
      ].applySeparator(separator: context.gaps.gapH24),
    );
  }
}
