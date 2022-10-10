import 'package:flutter/material.dart';

import '../../../../../../shared/common/common.dart';
import '../../../../../../shared/widgets/widgets.dart';
import '../../../../chat.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.insets.a16,
      children: <Widget>[
        Bounceable(
          onTap: () {
            context.goRouter.go(
                '${context.goRouter.location}/${ChatDetailPage.routerPath}');
          },
          child: BaseCard(
            padding: context.insets.v4,
            decoration: const BoxDecoration(),
            leading: const RoundedImage(),
            leadingGap: context.sizes.p4,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Truong Nhat Long',
                    style: context.typo.titleMedium.weight700),
                Text('Okay... Do we have a deal?',
                    style: context.typo.bodyMedium),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    width: context.sizes.p32,
                    height: context.sizes.p32,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Text('3',
                        style: context.typo.bodyMedium.copyWith(
                          color: context.colorScheme.onPrimary,
                        ))),
                Text(DateTimeUtils.relative(DateTime.now(),
                    timeShowNow: const Duration(minutes: 1))),
              ],
            ),
          ),
        ),
        BaseCard(
          padding: context.insets.v4,
          decoration: const BoxDecoration(),
          leading: const RoundedImage(),
          leadingGap: context.sizes.p4,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Truong Nhat Long 2',
                  style: context.typo.titleMedium.weight700),
              Text('Okay... Do we have a deal?',
                  style: context.typo.bodyMedium),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  width: context.sizes.p32,
                  height: context.sizes.p32,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text('9+',
                      style: context.typo.bodyMedium.copyWith(
                        color: context.colorScheme.onPrimary,
                      ))),
              Text(DateTimeUtils.relative(
                  DateTime.now().subtract(const Duration(minutes: 3)),
                  timeShowNow: const Duration(minutes: 1))),
            ],
          ),
        ),
        BaseCard(
          padding: context.insets.v4,
          decoration: const BoxDecoration(),
          leading: const RoundedImage(),
          leadingGap: context.sizes.p4,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Truong Nhat Long 3',
                  style: context.typo.titleMedium.weight700),
              Text('Okay... Do we have a deal?',
                  style: context.typo.bodyMedium),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox.square(dimension: context.sizes.p32),
              Text(DateTimeUtils.relative(DateTime(2022, 10),
                  timeShowNow: const Duration(minutes: 1))),
            ],
          ),
        ),
        BaseCard(
          padding: context.insets.v4,
          decoration: const BoxDecoration(),
          leading: const RoundedImage(),
          leadingGap: context.sizes.p4,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Truong Nhat Long 4',
                  style: context.typo.titleMedium.weight700),
              Text('Okay... Do we have a deal?',
                  style: context.typo.bodyMedium),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox.square(dimension: context.sizes.p32),
              Text(DateTimeUtils.relative(DateTime(2022, 7),
                  timeShowNow: const Duration(minutes: 1))),
            ],
          ),
        ),
      ],
    );
  }
}
