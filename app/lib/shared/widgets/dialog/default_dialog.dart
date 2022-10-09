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
          contentPadding: context.insets.h16,
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
                  context.gaps.h24,
                ],
                DefaultTextStyle(
                  style: typo.titleLarge.weight600,
                  child: title,
                ),
                context.gaps.h8,
                DefaultTextStyle(
                  style: typo.bodyLarge,
                  child: content,
                ),
                context.gaps.h24,
                ...actions.applySeparator(context.gaps.h8).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
