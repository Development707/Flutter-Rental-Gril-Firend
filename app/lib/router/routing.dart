import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/service/app_service.dart';
import '../config/dependency_container.dart';
import '../features/authentication/authentication.dart';
import '../features/chat/chat.dart';
import '../features/error/error_page.dart';
import '../features/favorite/favorite.dart';
import '../features/help_center/help_center.dart';
import '../features/home/home.dart';
import '../features/notification/notification.dart';
import '../features/profile/profile.dart';
import '../features/rental/rental.dart';
import '../features/search/search.dart';
import '../features/settings/settings.dart';
import 'router.dart';
import 'transition_page.dart';

class Routing {
  const Routing._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> _shellKey = GlobalKey();

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    observers: <NavigatorObserver>[HeroController()],
    debugLogDiagnostics: true,
    initialLocation: Routes.auth,
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
                const FadeTransitionPage(child: RentalPage()),
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
            path: Routes.favorite,
            name: Routes.favorite,
            pageBuilder: (_, __) =>
                const FadeTransitionPage(child: FavoritePage()),
            routes: _favoriteRouting,
          ),
          GoRoute(
            path: Routes.chat,
            name: Routes.chat,
            pageBuilder: (_, __) => const FadeTransitionPage(child: ChatPage()),
            routes: _chatRouting,
          ),
          GoRoute(
            path: Routes.profile,
            name: Routes.profile,
            pageBuilder: (_, __) =>
                const FadeTransitionPage(child: ProfilePage()),
            routes: _profileRouting,
          ),
        ],
      ),
    ],
    errorPageBuilder: (_, GoRouterState state) =>
        ScaleTransitionPage(child: ErrorPage(error: state.error)),
  );

  /* ------------- Authentication Router -------------------- */

  static final List<RouteBase> _authRouting = <RouteBase>[
    GoRoute(
      path: LoginPasswordPage.routerPath,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: LoginPasswordPage()),
    ),
  ];

  /* ------------- Main Router ------------------------------ */

  static final List<RouteBase> _homeRouting = <RouteBase>[];

  static final List<RouteBase> _searchRouting = <RouteBase>[];

  static final List<RouteBase> _favoriteRouting = <RouteBase>[];

  static final List<RouteBase> _chatRouting = <RouteBase>[
    GoRoute(
      path: ChatDetailPage.routerPath,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: ChatDetailPage()),
    ),
  ];

  static final List<RouteBase> _profileRouting = <RouteBase>[
    GoRoute(
      path: ProfileMyBookingPage.routerPath,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: ProfileMyBookingPage()),
    ),
    GoRoute(
      path: ProfilePaymentsPage.routerPath,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: ProfilePaymentsPage()),
    ),
    GoRoute(
      path: MyProfilePage.routerPath,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: MyProfilePage()),
    ),
    GoRoute(
      path: ProfileImviteFriendPage.routerPath,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: ProfileImviteFriendPage()),
    ),
    GoRoute(
      path: NotificationPage.routerPath,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: NotificationPage()),
    ),
    GoRoute(
      path: SettingSecurityPage.routerPath,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: SettingSecurityPage()),
    ),
    GoRoute(
      path: SettingLanguagePage.routerPath,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: SettingLanguagePage()),
    ),
    GoRoute(
      path: SettingThemeModePage.routerPath,
      parentNavigatorKey: navigatorKey,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: SettingThemeModePage()),
    ),
    GoRoute(
      path: HelpCenterPage.routerPath,
      pageBuilder: (_, __) =>
          const CupertinoTransitionPage(child: HelpCenterPage()),
    ),
  ];
}
