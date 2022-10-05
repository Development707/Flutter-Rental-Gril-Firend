import 'package:flutter/material.dart';

import '../../../../../../shared/common/common.dart';

class RentalGirlDetailPage extends StatelessWidget {
  const RentalGirlDetailPage({super.key});

  static const String routerPath = 'RentalGirlDetailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Rental Girl Detail Page',
        style: context.typo.headlineLarge,
      )),
    );
  }
}
