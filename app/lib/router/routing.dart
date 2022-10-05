import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/service/app_notifier.dart';
import '../config/dependency_container.dart';
import '../features/authentication/authentication.dart';
import '../features/error/error_page.dart';
import '../features/help_center/help_center.dart';
import '../features/home/home.dart';
import '../features/notification/notification.dart';
import '../features/rental_girl/rental_girl.dart';
import '../features/search/search.dart';
import 'router.dart';
import 'transition_page.dart';

class Routing {
  const Routing._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> _shellKey = GlobalKey();

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.auth,
    debugLogDiagnostics: true,
    refreshListenable: AppNotifier(),
    redirect: (_, GoRouterState goState) {
      // Page allow all user
      if (Routes.pageNotAuthen.any(goState.subloc.contains)) {
        return null;
      }

      final bool isAuth = goState.subloc.contains(Routes.auth);

      final String? page = getIt<AuthenticationBloc>().state.when<String?>(
            authenticated: (_) => isAuth ? Routes.home : null,
            unauthenticated: () => !isAuth ? Routes.auth : null,
          );

      return page;
    },
    routes: <RouteBase>[
      GoRoute(path: '/', redirect: (_, __) => Routes.home),
      GoRoute(
        path: Routes.auth,
        pageBuilder: (_, __) =>
            const CupertinoDialogTransitionPage(child: LoginPage()),
        routes: _authRouting,
      ),
      GoRoute(
        path: Routes.otp,
        pageBuilder: (_, __) =>
            const CupertinoDialogTransitionPage(child: OtpPage()),
      ),
      ShellRoute(
        navigatorKey: _shellKey,
        builder: (_, GoRouterState state, Widget child) =>
            HomePage(location: state.location, child: child),
        routes: <RouteBase>[
          GoRoute(
            path: Routes.home,
            name: Routes.home,
            pageBuilder: (_, __) =>
                const FadeTransitionPage(child: RentalGirlPage()),
            routes: _homeRouting,
          ),
          GoRoute(
            path: Routes.search,
            name: Routes.search,
            pageBuilder: (_, __) =>
                const FadeTransitionPage(child: SearchPage()),
            routes: _searchRouting,
          ),
          GoRoute(
            path: Routes.notification,
            name: Routes.notification,
            pageBuilder: (_, __) =>
                const FadeTransitionPage(child: NotificationPage()),
            routes: _notificationRouting,
          ),
          GoRoute(
            path: Routes.menu,
            name: Routes.menu,
            pageBuilder: (_, __) => const FadeTransitionPage(child: MenuPage()),
            routes: _menuRouting,
          ),
        ],
      ),
    ],
    errorPageBuilder: (_, GoRouterState state) =>
        ScaleTransitionPage(child: ErrorPage(error: state.error)),
  );

  static final List<RouteBase> _authRouting = <RouteBase>[];

  static final List<RouteBase> _homeRouting = <RouteBase>[
    GoRoute(
      path: RentalGirlDetailPage.routerPath,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: RentalGirlDetailPage()),
    )
  ];

  static final List<RouteBase> _searchRouting = <RouteBase>[];

  static final List<RouteBase> _notificationRouting = <RouteBase>[];

  static final List<RouteBase> _menuRouting = <RouteBase>[
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: HelpCenterPage.routerPath,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: HelpCenterPage()),
    )
  ];
}
