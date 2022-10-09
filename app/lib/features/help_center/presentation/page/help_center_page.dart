import 'package:flutter/material.dart';

import '../../../../shared/common/common.dart';
import '../../../../shared/widgets/widgets.dart';
import 'components/help_contact_us.dart';
import 'components/help_faq.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  static const String routerPath = 'help-center';

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      Tab(text: context.l10n.frequently_asked_questions),
      Tab(text: context.l10n.contact_us),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: context.l10n.help_center,
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
          HelpFaq(),
          HelpContactUs(),
        ]),
      ),
    );
  }
}
