import 'package:flutter/material.dart';

import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';

class SettingSecurityPage extends StatelessWidget {
  const SettingSecurityPage({super.key});

  static const String routerPath = 'security';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: context.l10n.security),
      body: DefaultTextStyle(
        style: context.typo.titleMedium.copyWith(
          color: context.colorScheme.onSurface,
        ),
        child: ListView(
          padding: context.insets.a16,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.remember_me)),
              AppSwitch(
                value: true,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              const Expanded(child: Text('Face ID')),
              AppSwitch(
                value: false,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.biometric_id)),
              AppSwitch(
                value: true,
                onChanged: (bool value) {},
              )
            ]),
            Row(children: <Widget>[
              Expanded(child: Text(context.l10n.google_authentication)),
              const Icon(Icons.chevron_right)
            ]),
            AppElevatedButton(
              dense: false,
              primary: context.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(context.sizes.p40),
              child: Text(context.l10n.change_pin,
                  style: TextStyle(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  )),
              onPressed: () {},
            ),
            AppElevatedButton(
              dense: false,
              primary: context.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(context.sizes.p40),
              child: Text(context.l10n.change_password,
                  style: TextStyle(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  )),
              onPressed: () {},
            ),
          ].applySeparator(context.gaps.h24),
        ),
      ),
    );
  }
}
