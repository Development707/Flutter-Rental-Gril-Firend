import 'package:flutter/material.dart';

import '../../common/common.dart';

extension DefaultDialog on BuildContext {
  Future<T?> showDefaultDialog<T>({
    Widget? image,
    required Widget title,
    required Widget content,
    List<Widget> actions = const <Widget>[],
    double? radius,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    double? dialogWidth,
  }) {
    return showDialog<T?>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? sizes.p12),
          ),
          contentPadding: context.insets.fromLTRB(
            context.sizes.p16,
            context.sizes.p24,
            context.sizes.p16,
            context.sizes.p12,
          ),
          content: SizedBox(
            width: dialogWidth ?? context.width * .85,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: <Widget>[
                if (image != null) ...<Widget>[
                  Center(child: image),
                  context.gaps.gapH24,
                ],
                DefaultTextStyle(
                  style: typo.titleLarge.weight600,
                  child: title,
                ),
                context.gaps.gapH8,
                DefaultTextStyle(
                  style: typo.bodyLarge,
                  child: content,
                ),
                context.gaps.gapH24,
                ...actions
                    .applySeparator(
                      separator: context.gaps.gapH8,
                    )
                    .toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}