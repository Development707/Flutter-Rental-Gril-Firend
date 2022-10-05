import 'package:flutter/material.dart';

import '../../../router/router.dart';
import '../../../shared/common/common.dart';
import '../../../shared/widgets/app_bar/custom_app_bar.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  static const String routerPath = 'HelpCenterPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Help Center Page',
        onBackClicked: () => context.goRouter.goNamed(Routes.menu),
      ),
    );
  }
}
