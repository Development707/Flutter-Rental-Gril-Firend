import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import '../config/dependency_container.dart';
import '../features/authentication/authentication.dart';
import '../localization/generated/l10n.dart';
import '../router/routing.dart';
import '../shared/common/common.dart';
import '../shared/theme/theme.dart';
import 'service/app_connect/app_connect_cubit.dart';
import 'service/app_settings/app_settings_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AppSettingsCubit>(create: (_) => AppSettingsCubit()),
        BlocProvider<AppConnectCubit>(create: (_) => AppConnectCubit()),
        BlocProvider<AuthenticationBloc>(create: (_) => getIt()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late GoRouter appRouter;

  @override
  void initState() {
    context.read<AuthenticationBloc>().add(const AuthenticationEvent.init());

    appRouter = Routing.router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (BuildContext context, AppSettingsState state) {
        return MaterialApp.router(
          builder: (BuildContext context, Widget? child) {
            return BlocListener<AppConnectCubit, AppConnectState>(
              listener: (BuildContext context2, AppConnectState state) {
                state.when(connected: () {
                  context.scaffoldMessenger.showSnackBar(const SnackBar(
                    key: Key('Internet Connected'),
                    content: Text('Internet Connected'),
                  ));
                }, disconnected: () {
                  context.scaffoldMessenger.showSnackBar(const SnackBar(
                    key: Key('Internet Lost'),
                    content: Text('Internet Lost'),
                  ));
                });
              },
              child: ThemeProvider(
                data: state.themeDataContainer,
                child: child!,
              ),
            );
          },
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          theme: state.themeDataContainer.lightTheme(),
          darkTheme: state.themeDataContainer.darkTheme(),
          routeInformationParser: appRouter.routeInformationParser,
          routerDelegate: appRouter.routerDelegate,
          routeInformationProvider: appRouter.routeInformationProvider,
          supportedLocales: AppLanguage.delegate.supportedLocales,
          locale: state.locale,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLanguage.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
