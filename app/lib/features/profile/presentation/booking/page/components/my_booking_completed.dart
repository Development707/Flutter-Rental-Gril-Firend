import 'package:flutter/material.dart';

import '../../../../../../shared/common/common.dart';
import 'my_booking_item.dart';

class MyBookingCompleted extends StatelessWidget {
  const MyBookingCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: context.insets.a16,
      separatorBuilder: (BuildContext context, _) => context.gaps.h16,
      itemBuilder: (_, __) => const MyBookingItem(),
    );
  }
}
