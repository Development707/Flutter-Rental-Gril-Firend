import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_icons.dart';
import '../../router/router.dart';
import '../../shared/common/common.dart';
import '../../shared/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.location,
    required this.child,
  });

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: _routeToTitleText(context, location)),
      body: Row(
        children: <Widget>[
          if (!context.isPhone) _navigationRail(context),
          Expanded(child: child),
        ],
      ),
      bottomNavigationBar:
          context.isPhone ? _bottomNavigationBar(context) : null,
    );
  }

  NavigationRail _navigationRail(BuildContext context) {
    return NavigationRail(
      extended: context.isDesktopOrWider,
      selectedIndex: _routeToIndex(location),
      onDestinationSelected: (int index) {
        context.goNamed(_indexToRoute(index));
      },
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined, color: context.colorScheme.primary),
          selectedIcon: Icon(Icons.home, color: context.colorScheme.primary),
          label: Text(context.l1On.home),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search_outlined, color: context.colorScheme.primary),
          selectedIcon: Icon(Icons.search, color: context.colorScheme.primary),
          label: Text(context.l1On.search),
        ),
        NavigationRailDestination(
          icon: AppIcon(
            AppIcons.icNotify,
            color: context.colorScheme.primary,
          ),
          selectedIcon: AppIcon(
            AppIcons.icNotifyBold,
            color: context.colorScheme.primary,
          ),
          label: Text(context.l1On.notification),
        ),
        NavigationRailDestination(
          icon: AppIcon(
            AppIcons.icProfile,
            color: context.colorScheme.primary,
          ),
          selectedIcon: AppIcon(
            AppIcons.icProfileBold,
            color: context.colorScheme.primary,
          ),
          label: Text(context.l1On.profile),
        ),
      ],
    );
  }

  NavigationBar _bottomNavigationBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: _routeToIndex(location),
      onDestinationSelected: (int index) {
        context.goNamed(_indexToRoute(index));
      },
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: context.colorScheme.primary),
          selectedIcon: Icon(Icons.home, color: context.colorScheme.primary),
          label: context.l1On.home,
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined, color: context.colorScheme.primary),
          selectedIcon: Icon(Icons.search, color: context.colorScheme.primary),
          label: context.l1On.search,
        ),
        NavigationDestination(
          icon: AppIcon(
            AppIcons.icNotify,
            color: context.colorScheme.primary,
          ),
          selectedIcon: AppIcon(
            AppIcons.icNotifyBold,
            color: context.colorScheme.primary,
          ),
          label: context.l1On.notification,
        ),
        NavigationDestination(
          icon: AppIcon(
            AppIcons.icProfile,
            color: context.colorScheme.primary,
          ),
          selectedIcon: AppIcon(
            AppIcons.icProfileBold,
            color: context.colorScheme.primary,
          ),
          label: context.l1On.profile,
        ),
      ],
    );
  }

  String _routeToTitleText(BuildContext context, String route) {
    switch (route) {
      case Routes.home:
        return context.l1On.home;
      case Routes.search:
        return context.l1On.search;
      case Routes.notification:
        return context.l1On.notification;
      case Routes.menu:
        return context.l1On.profile;
      default:
        return context.l1On.home;
    }
  }

  static String _indexToRoute(int index) {
    switch (index) {
      case 0:
        return Routes.home;
      case 1:
        return Routes.search;
      case 2:
        return Routes.notification;
      case 3:
        return Routes.menu;
      default:
        return Routes.home;
    }
  }

  static int _routeToIndex(String route) {
    switch (route) {
      case Routes.home:
        return 0;
      case Routes.search:
        return 1;
      case Routes.notification:
        return 2;
      case Routes.menu:
        return 3;
      default:
        return 0;
    }
  }
}
