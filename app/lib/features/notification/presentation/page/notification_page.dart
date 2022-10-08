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
    );
  }
}
