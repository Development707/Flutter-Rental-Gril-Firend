import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../shared/common/common.dart';
import 'components/call_tab.dart';
import 'components/chat_tab.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      Tab(text: context.l10n.chats),
      Tab(text: context.l10n.calls),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(AppImages.icProd, height: context.sizes.p40),
              context.gaps.w8,
              Text(context.l10n.message),
            ],
          ),
          titleTextStyle: context.typo.headlineSmall.weight600.copyWith(
            color: context.colorScheme.onBackground,
          ),
          actions: <Widget>[
            Icon(Icons.search, size: context.sizes.p32),
            context.gaps.w8,
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
          ChatTab(),
          CallTab(),
        ]),
      ),
    );
  }
}
