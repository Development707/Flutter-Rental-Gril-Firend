import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/app_icons.dart';
import '../../../../../../shared/common/common.dart';
import '../../../../../../shared/widgets/widgets.dart';
import '../../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Welcom to Rental Girl Friend',
          style: context.typo.headlineLarge.weight600,
          textAlign: TextAlign.center,
        ),
        AppOutlinedInput(
            prefixIcon: const AppIcon(AppIcons.icSms),
            hintText: context.l10n.account),
        AppOutlinedInput(
          prefixIcon: const AppIcon(AppIcons.icLock),
          hintText: context.l10n.password,
          suffixIcon: const AppIcon(AppIcons.icEye),
        ),
        AppElevatedButton(
            onPressed: () {
              context.read<LoginCubit>().login();
            },
            child: Text(context.l10n.log_in)),
      ].applySeparator(separator: context.gaps.gapH16),
    );
  }
}
