import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router.dart';
import '../../shared/common/common.dart';
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
      body: Row(
        children: <Widget>[
          if (!context.isPhone) SafeArea(child: _navigationRail(context)),
          Expanded(
            child: SafeArea(
              top: false,
              child: widget.child,
            ),
          ),
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
          icon: Icon(Icons.home_outlined, color: context.colorScheme.outline),
          selectedIcon: Icon(Icons.home, color: context.colorScheme.primary),
          label: Text(context.l10n.home),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search_outlined, color: context.colorScheme.outline),
          selectedIcon: Icon(Icons.zoom_in, color: context.colorScheme.primary),
          label: Text(context.l10n.explore),
        ),
        NavigationRailDestination(
          icon:
              Icon(Icons.favorite_outline, color: context.colorScheme.outline),
          selectedIcon:
              Icon(Icons.favorite, color: context.colorScheme.primary),
          label: Text(context.l10n.favorites),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.forum_outlined, color: context.colorScheme.outline),
          selectedIcon: Icon(Icons.forum, color: context.colorScheme.primary),
          label: Text(context.l10n.message),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outline, color: context.colorScheme.outline),
          selectedIcon: Icon(Icons.person, color: context.colorScheme.primary),
          label: Text(context.l10n.profile),
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
          icon: Icon(Icons.home_outlined, color: context.colorScheme.outline),
          selectedIcon: Icon(Icons.home, color: context.colorScheme.primary),
          label: context.l10n.home,
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined, color: context.colorScheme.outline),
          selectedIcon: Icon(Icons.zoom_in, color: context.colorScheme.primary),
          label: context.l10n.explore,
        ),
        NavigationDestination(
          icon:
              Icon(Icons.favorite_outline, color: context.colorScheme.outline),
          selectedIcon:
              Icon(Icons.favorite, color: context.colorScheme.primary),
          label: context.l10n.favorites,
        ),
        NavigationDestination(
          icon: Icon(Icons.forum_outlined, color: context.colorScheme.outline),
          selectedIcon: Icon(Icons.forum, color: context.colorScheme.primary),
          label: context.l10n.message,
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline, color: context.colorScheme.outline),
          selectedIcon: Icon(Icons.person, color: context.colorScheme.primary),
          label: context.l10n.profile,
        ),
      ],
    );
  }

  static String _indexToRoute(int index) {
    switch (index) {
      case 0:
        return Routes.home;
      case 1:
        return Routes.search;
      case 2:
        return Routes.favorite;
      case 3:
        return Routes.chat;
      case 4:
        return Routes.profile;
      default:
        return Routes.home;
    }
  }

  static int _routeToIndex(String route) {
    if (route.contains(Routes.search)) {
      return 1;
    } else if (route.contains(Routes.favorite)) {
      return 2;
    } else if (route.contains(Routes.chat)) {
      return 3;
    } else if (route.contains(Routes.profile)) {
      return 4;
    } else {
      return 0;
    }
  }
}
