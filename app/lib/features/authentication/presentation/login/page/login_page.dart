import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/app_icons.dart';
import '../../../../../constants/app_images.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../cubit/login_cubit.dart';
import 'login_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routePath = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = LoginCubit();
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>.value(
      value: _cubit,
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            body: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(child: Image.asset(AppImages.icProd)),
                  context.gaps.h24,
                  Text("Let's you in",
                      style: context.typo.displaySmall.weight600),
                  context.gaps.h24,
                  Padding(
                    padding: context.insets.h16,
                    child: AppOutlinedIconButton(
                        dense: false,
                        primary: context.colorScheme.outline.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(context.sizes.p12),
                        icon: Icon(
                          Icons.facebook,
                          size: context.sizes.p40,
                          color: Colors.blue,
                        ),
                        label: Text(
                          'Continue with Facebook',
                          style: context.typo.titleMedium
                              .copyWith(color: context.colorScheme.onSurface),
                        ),
                        onPressed: () {
                          context.read<LoginCubit>().login();
                        }),
                  ),
                  context.gaps.h12,
                  Padding(
                    padding: context.insets.h16,
                    child: AppOutlinedIconButton(
                        dense: false,
                        primary: context.colorScheme.outline.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(context.sizes.p12),
                        icon:
                            AppIcon(AppIcons.icGoogle, size: context.sizes.p40),
                        label: Text(
                          'Continue with Google',
                          style: context.typo.titleMedium
                              .copyWith(color: context.colorScheme.onSurface),
                        ),
                        onPressed: () {
                          context.read<LoginCubit>().login();
                        }),
                  ),
                  context.gaps.h12,
                  Padding(
                    padding: context.insets.h16,
                    child: AppOutlinedIconButton(
                        dense: false,
                        primary: context.colorScheme.outline.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(context.sizes.p12),
                        icon: Icon(
                          Icons.apple,
                          size: context.sizes.p40,
                          color: context.colorScheme.onBackground,
                        ),
                        label: Text(
                          'Continue with apple',
                          style: context.typo.titleMedium
                              .copyWith(color: context.colorScheme.onSurface),
                        ),
                        onPressed: () {
                          context.read<LoginCubit>().login();
                        }),
                  ),
                  context.gaps.h16,
                  Text(context.l10n.or, style: context.typo.titleMedium),
                  context.gaps.h16,
                  Padding(
                    padding: context.insets.h16,
                    child: AppElevatedButton(
                      dense: false,
                      borderRadius: BorderRadius.circular(context.sizes.p40),
                      onPressed: () {
                        context.goRouter.go(
                            '${context.goRouter.location}/${LoginPasswordPage.routerPath}');
                      },
                      child: Text(context.l10n.sign_in_with_password),
                    ),
                  ),
                  context.gaps.h32,
                  Text.rich(TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              color: context.colorScheme.primary,
                            )),
                      ],
                      style: context.typo.titleSmall.weight500
                          .copyWith(color: context.colorScheme.outline))),
                  context.gaps.h8,
                ]),
          );
        },
      ),
    );
  }
}
