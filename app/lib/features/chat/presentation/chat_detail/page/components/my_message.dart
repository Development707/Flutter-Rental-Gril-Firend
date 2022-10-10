import 'package:flutter/material.dart';

import '../../../../../../shared/common/common.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: context.insets.v4.add(EdgeInsets.only(left: context.sizes.p40)),
        padding: context.insets.a8,
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(context.sizes.p16)
              .subtract(BorderRadius.only(
            bottomRight: Radius.circular(context.sizes.p8),
          )),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Text(
                  'Apart from reversing the list, another solution could be putting the ListView inside an Align widget with alignment: Alignment.topCenter . Also shrinkWrap: true needed inside ListView',
                  style: context.typo.bodyLarge.copyWith(
                    color: context.colorScheme.onPrimary,
                  )),
            ),
            Text(
                DateTimeUtils.relative(DateTime.now(),
                    timeShowNow: const Duration(minutes: 1)),
                style: context.typo.bodySmall.copyWith(
                  color: context.colorScheme.onPrimary.withOpacity(0.6),
                )),
            context.gaps.w4,
            Icon(
              Icons.done_all_outlined,
              size: context.sizes.p16,
              color: context.colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
