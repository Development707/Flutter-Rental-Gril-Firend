import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/app_icons.dart';
import '../../../../../constants/app_images.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../cubit/login_cubit.dart';

class LoginPasswordPage extends StatefulWidget {
  const LoginPasswordPage({super.key});

  static const String routerPath = 'login-password';

  @override
  State<LoginPasswordPage> createState() => _LoginPasswordPageState();
}

class _LoginPasswordPageState extends State<LoginPasswordPage> {
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
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: const CustomAppBar(),
              body: Column(
                children: <Widget>[
                  Flexible(child: Image.asset(AppImages.login)),
                  context.gaps.h24,
                  Text('Login to Your Account',
                      style: context.typo.headlineMedium.weight600),
                  context.gaps.h32,
                  Padding(
                    padding: context.insets.h16,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(context.sizes.p16),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: context.colorScheme.primary.withOpacity(0.1),
                        prefixIcon: const Icon(Icons.mail),
                        label: const Text('Email'),
                        labelStyle: context.typo.titleMedium,
                      ),
                    ),
                  ),
                  context.gaps.h16,
                  Padding(
                    padding: context.insets.h16,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(context.sizes.p16),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: context.colorScheme.primary.withOpacity(0.1),
                        prefixIcon: const Icon(Icons.lock),
                        label: const Text('Password'),
                        labelStyle: context.typo.titleMedium,
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  context.gaps.h4,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppCheckbox(value: false, onChanged: (_) {}),
                        Text('Remember me', style: context.typo.titleSmall)
                      ]),
                  context.gaps.h4,
                  Padding(
                    padding: context.insets.h16,
                    child: AppElevatedButton(
                      dense: false,
                      borderRadius: BorderRadius.circular(context.sizes.p40),
                      onPressed: () {
                        context.read<LoginCubit>().login();
                      },
                      child: const Text('Sign in'),
                    ),
                  ),
                  Divider(
                    indent: context.sizes.p32,
                    endIndent: context.sizes.p32,
                    height: context.sizes.p64,
                    thickness: 1.2,
                  ),
                  Padding(
                    padding: context.insets.h24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        AppOutlinedButton(
                            dense: false,
                            padding: context.insets.h32.add(context.insets.v8),
                            borderRadius:
                                BorderRadius.circular(context.sizes.p16),
                            primary:
                                context.colorScheme.outline.withOpacity(0.3),
                            expandedWith: false,
                            child: Icon(
                              Icons.facebook,
                              size: context.sizes.p40,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              context.read<LoginCubit>().login();
                            }),
                        AppOutlinedButton(
                            dense: false,
                            padding: context.insets.h32.add(context.insets.v8),
                            borderRadius:
                                BorderRadius.circular(context.sizes.p16),
                            primary:
                                context.colorScheme.outline.withOpacity(0.3),
                            expandedWith: false,
                            child: AppIcon(
                              AppIcons.icGoogle,
                              size: context.sizes.p40,
                            ),
                            onPressed: () {
                              context.read<LoginCubit>().login();
                            }),
                        AppOutlinedButton(
                            dense: false,
                            padding: context.insets.h32.add(context.insets.v8),
                            borderRadius:
                                BorderRadius.circular(context.sizes.p16),
                            primary:
                                context.colorScheme.outline.withOpacity(0.3),
                            expandedWith: false,
                            child: Icon(
                              Icons.apple,
                              size: context.sizes.p40,
                              color: context.colorScheme.onBackground,
                            ),
                            onPressed: () {
                              context.read<LoginCubit>().login();
                            }),
                      ],
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
