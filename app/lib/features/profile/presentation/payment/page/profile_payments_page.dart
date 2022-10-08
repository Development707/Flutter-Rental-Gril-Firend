import 'package:flutter/material.dart';

import '../../../../../constants/app_icons.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';
import 'components/payments_item.dart';

class ProfilePaymentsPage extends StatelessWidget {
  const ProfilePaymentsPage({super.key});

  static const String routerPath = 'payments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Payments',
        actions: <Widget>[
          Icon(Icons.qr_code_scanner, size: context.sizes.p32),
          context.gaps.w16,
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: context.insets.a16,
          children: <Widget>[
            const PaymentsItem(
              icon: AppIcon(AppIcons.icPaypal),
              title: 'Paypal',
            ),
            const PaymentsItem(
              icon: AppIcon(AppIcons.icGoogle),
              title: 'Google pay',
            ),
            PaymentsItem(
              icon: Icon(
                Icons.apple,
                color: context.colorScheme.onBackground,
                size: context.sizes.p40,
              ),
              title: 'Apple',
            ),
            const PaymentsItem(
              icon: AppIcon(AppIcons.icMasterCard),
              title: '**** ***** ***** 1234',
            ),
            const PaymentsItem(
              icon: AppIcon(AppIcons.icMasterCard),
              title: '**** ***** ***** 5678',
            ),
            const PaymentsItem(
              icon: AppIcon(AppIcons.icMasterCard),
              title: '**** ***** ***** 9999',
            ),
          ].applySeparator(separator: context.gaps.h16),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: context.insets.h16.add(const EdgeInsets.only(bottom: 8)),
        child: AppElevatedButton(
          borderRadius: BorderRadius.circular(context.sizes.p40),
          dense: false,
          onPressed: () {},
          child: const Text('Add new Payments'),
        ),
      ),
    );
  }
}
