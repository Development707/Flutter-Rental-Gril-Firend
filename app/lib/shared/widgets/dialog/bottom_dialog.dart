import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';

extension BottomModal on BuildContext {
  Future<T?> showDefaultBottomModal<T>({
    required Widget child,
    BorderRadius? borderRadius,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    EdgeInsets? padding,
  }) async {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ??
            BorderRadius.vertical(top: Radius.circular(sizes.p16)),
      ),
      context: this,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: padding ?? context.mediaQueryViewInsets,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    widthFactor: 0.1,
                    child: Container(
                      padding: insets.h8,
                      height: sizes.p8,
                      decoration: BoxDecoration(
                        color: colorScheme.outline,
                        borderRadius:
                            BorderRadius.all(Radius.circular(sizes.p12)),
                      ),
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        );
      },
    );
  }

  Future<T?> showCupertinoDialog<T>({
    Widget? image,
    Widget? title,
    Widget? content,
    List<Widget> actions = const <Widget>[],
    double? radius,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    double? dialogHeight,
    Widget? child,
  }) {
    assert((title != null && content != null) || child != null,
        'Dialog must have title - context not null or child not null');

    child ??= Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: FractionallySizedBox(
            widthFactor: 0.1,
            child: Container(
              height: sizes.p8,
              decoration: BoxDecoration(
                color: colorScheme.outline,
                borderRadius: BorderRadius.all(Radius.circular(sizes.p12)),
              ),
            ),
          ),
        ),
        gaps.h8,
        if (image != null) ...<Widget>[
          Center(child: image),
          gaps.h24,
        ],
        DefaultTextStyle(
          style: typo.titleLarge.weight600,
          child: title!,
        ),
        gaps.h16,
        Expanded(
          child: DefaultTextStyle(
            style: typo.bodyLarge,
            child: content!,
          ),
        ),
        gaps.h24,
        ...actions.applySeparator(gaps.h8).toList(),
      ],
    );

    return showCupertinoModalPopup<T>(
        context: this,
        builder: (BuildContext context) => Container(
              height: dialogHeight ?? context.height * 0.35,
              width: context.width,
              padding: insets.a16,
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: context.mediaQueryViewInsets,
              // Provide a background color for the popup.
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground.resolveFrom(context),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(sizes.p16)),
              ),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(top: false, child: child!),
            ));
  }
}
