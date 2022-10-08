import 'package:flutter/material.dart';

import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';
import 'components/my_booking_active.dart';
import 'components/my_booking_completed.dart';

class ProfileMyBookingPage extends StatelessWidget {
  const ProfileMyBookingPage({super.key});

  static const String routerPath = 'my-booking';

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      const Tab(text: 'Active'),
      const Tab(text: 'Completed'),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: 'My Booking',
          actions: <Widget>[
            Icon(Icons.more_horiz, size: context.sizes.p32),
            context.gaps.w16,
          ],
          bottom: TabBar(
            padding: context.insets.h16,
            labelStyle: context.typo.titleMedium.weight700,
            labelColor: context.colorScheme.primary,
            unselectedLabelStyle: context.typo.titleMedium,
            unselectedLabelColor: context.colorScheme.outline,
            indicatorColor: context.colorScheme.primary,
            tabs: tabs,
          ),
        ),
        body: const TabBarView(children: <Widget>[
          MyBookingActive(),
          MyBookingCompleted(),
        ]),
      ),
    );
  }
}
