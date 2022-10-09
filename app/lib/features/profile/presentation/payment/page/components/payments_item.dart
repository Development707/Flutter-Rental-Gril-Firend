import 'package:flutter/material.dart';

import '../../../../../../shared/common/common.dart';
import '../../../../../../shared/widgets/widgets.dart';

class PaymentsItem extends StatelessWidget {
  const PaymentsItem({
    super.key,
    required this.icon,
    required this.title,
  });

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      leading: icon,
      content: Text(title, style: context.typo.titleLarge.weight600),
      trailing: Text(context.l10n.connected,
          style: context.typo.titleMedium.weight500.copyWith(
            color: context.colorScheme.primary,
          )),
    );
  }
}
