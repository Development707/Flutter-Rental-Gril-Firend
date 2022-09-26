import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/service/go_router_refresh_stream.dart';
import '../config/dependency_container.dart';
import '../features/authentication/authentication.dart';
import '../features/error/error_page.dart';
import '../features/home/home.dart';
import '../features/home/page/menu_page.dart';
import '../features/notification/notification.dart';
import 'router.dart';
import 'transition_page.dart';

class Routing {
  const Routing._();

  static GoRouter route() {
    final AuthenticationBloc authBloc = getIt<AuthenticationBloc>();
    return GoRouter(
      redirectLimit: 10,
      initialLocation: Routes.home,
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (_, GoRouterState goState) {
        // Page allow all user
        if (Routes.pageNotAuthen
            .any((String path) => goState.subloc.contains(path))) {
          return null;
        }

        final bool isLogin = goState.subloc.contains(Routes.auth);

        final String? page = authBloc.state.whenOrNull<String?>(
          authenticated: (_) => isLogin ? Routes.home : null,
          unauthenticated: () => !isLogin ? Routes.auth : null,
        );

        return page;
      },
      routes: <RouteBase>[
        GoRoute(path: '/', redirect: (_, __) => Routes.home),
        GoRoute(
          path: Routes.auth,
          pageBuilder: (_, __) =>
              const CupertinoDialogTransitionPage(child: LoginPage()),
        ),
        ShellRoute(
          builder: (_, GoRouterState state, Widget child) =>
              HomePage(location: state.location, child: child),
          routes: <RouteBase>[
            GoRoute(
              path: Routes.home,
              name: Routes.home,
              pageBuilder: (_, __) => FadeTransitionPage(child: Container()),
            ),
            GoRoute(
              path: Routes.search,
              name: Routes.search,
              pageBuilder: (_, __) => FadeTransitionPage(child: Container()),
            ),
            GoRoute(
              path: Routes.notification,
              name: Routes.notification,
              pageBuilder: (_, __) =>
                  const FadeTransitionPage(child: NotificationPage()),
            ),
            GoRoute(
              path: Routes.menu,
              name: Routes.menu,
              pageBuilder: (_, __) =>
                  const FadeTransitionPage(child: MenuPage()),
            ),
          ],
        ),
      ],
      errorPageBuilder: (_, GoRouterState state) =>
          ScaleTransitionPage(child: ErrorPage(error: state.error)),
    );
  }
}
