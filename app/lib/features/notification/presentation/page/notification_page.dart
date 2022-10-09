import 'package:flutter/material.dart';

import '../../../../shared/common/common.dart';
import '../../../../shared/widgets/widgets.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const String routerPath = 'notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: context.l10n.notification),
      body: DefaultTextStyle(
        style: context.typo.titleMedium.copyWith(
          color: context.colorScheme.onSurface,
        ),
        child: ListView(
          padding: context.insets.a16,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.general_notification)),
              AppSwitch(
                value: true,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.sound)),
              AppSwitch(
                value: true,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.vibrate)),
              AppSwitch(
                value: false,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.special_offers)),
              AppSwitch(
                value: true,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.promo_and_discount)),
              AppSwitch(
                value: false,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.payments)),
              AppSwitch(
                value: true,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.cashback)),
              AppSwitch(
                value: true,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.app_update)),
              AppSwitch(
                value: true,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.new_service_available)),
              AppSwitch(
                value: false,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.new_tip_available)),
              AppSwitch(
                value: false,
                onChanged: (bool value) {},
              )
            ]),
          ].applySeparator(context.gaps.h24),
        ),
      ),
    );
  }
}
