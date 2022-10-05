import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_icons.dart';
import '../../router/router.dart';
import '../../shared/common/common.dart';
import '../../shared/widgets/widgets.dart';
import '../notification/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.location,
    required this.child,
  });

  final String location;
  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    NotificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(titleText: _routeToTitleText(context, widget.location)),
      body: Row(
        children: <Widget>[
          if (!context.isPhone) _navigationRail(context),
          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar:
          context.isPhone ? _bottomNavigationBar(context) : null,
    );
  }

  NavigationRail _navigationRail(BuildContext context) {
    return NavigationRail(
      extended: context.isDesktopOrWider,
      minExtendedWidth: context.sizes.p4 * 45,
      labelType: context.isDesktopOrWider ? null : NavigationRailLabelType.all,
      selectedIndex: _routeToIndex(widget.location),
      onDestinationSelected: (int index) {
        context.goNamed(_indexToRoute(index));
      },
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined, color: context.colorScheme.primary),
          selectedIcon: Icon(Icons.home, color: context.colorScheme.primary),
          label: Text(context.l10n.home),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search_outlined, color: context.colorScheme.primary),
          selectedIcon: Icon(Icons.search, color: context.colorScheme.primary),
          label: Text(context.l10n.search),
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
          label: Text(context.l10n.notification),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.menu_outlined, color: context.colorScheme.primary),
          selectedIcon:
              Icon(Icons.menu_open, color: context.colorScheme.primary),
          label: Text(context.l10n.menu),
        ),
      ],
    );
  }

  NavigationBar _bottomNavigationBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: _routeToIndex(widget.location),
      onDestinationSelected: (int index) {
        context.goNamed(_indexToRoute(index));
      },
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: context.colorScheme.primary),
          selectedIcon: Icon(Icons.home, color: context.colorScheme.primary),
          label: context.l10n.home,
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined, color: context.colorScheme.primary),
          selectedIcon: Icon(Icons.search, color: context.colorScheme.primary),
          label: context.l10n.search,
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
          label: context.l10n.notification,
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
          label: context.l10n.menu,
        ),
      ],
    );
  }

  static String? _routeToTitleText(BuildContext context, String route) {
    if (route.contains(Routes.home)) {
      return context.l10n.home;
    } else if (route.contains(Routes.search)) {
      return context.l10n.search;
    } else if (route.contains(Routes.notification)) {
      return context.l10n.notification;
    } else if (route.contains(Routes.menu)) {
      return context.l10n.menu;
    } else {
      return null;
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
