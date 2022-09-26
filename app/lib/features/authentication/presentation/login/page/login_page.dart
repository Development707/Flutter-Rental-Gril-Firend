import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/app_images.dart';
import '../../../../../shared/common/common.dart';
import '../cubit/login_cubit.dart';
import 'components/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routePath = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    final Flex body = context.responsiveValue(
      desktop: Row(children: <Widget>[
        Expanded(flex: 2, child: Image.asset(AppImages.login)),
        Expanded(
          child: Padding(
            padding: context.insets.h16,
            child: const LoginForm(),
          ),
        ),
      ]),
      tablet: Row(children: <Widget>[
        Expanded(child: Image.asset(AppImages.login)),
        Expanded(
          child: Padding(
            padding: context.insets.h16,
            child: const LoginForm(),
          ),
        ),
      ]),
      mobile: Column(children: <Widget>[
        Expanded(child: Image.asset(AppImages.login)),
        Expanded(
          child: Padding(
            padding: context.insets.h16,
            child: const LoginForm(),
          ),
        ),
      ]),
    );

    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: body,
        ),
      ),
    );
  }
}
