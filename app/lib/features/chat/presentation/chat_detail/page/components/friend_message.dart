import 'package:flutter/material.dart';

import '../../../../../../shared/common/common.dart';

class FriendMessage extends StatelessWidget {
  const FriendMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin:
            context.insets.v4.add(EdgeInsets.only(right: context.sizes.p40)),
        padding: context.insets.a8,
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(context.sizes.p16)
              .subtract(BorderRadius.only(
            topLeft: Radius.circular(context.sizes.p8),
          )),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Text('Apart from reversing the list true ',
                  style: context.typo.bodyLarge.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  )),
            ),
            Text(
                DateTimeUtils.relative(DateTime.now(),
                    timeShowNow: const Duration(minutes: 1)),
                style: context.typo.bodySmall.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.6),
                )),
          ],
        ),
      ),
    );
  }
}
