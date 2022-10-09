import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../common/common.dart';
import '../app_icon.dart';
import '../button/elevated_button.dart';

extension WarningDialog on BuildContext {
  Future<bool> showWarnigDialog<T>({
    Widget? image,
    required Widget title,
    required Widget content,
    Widget? negative,
    Widget? positive,
    double? dialogWidth,
  }) async {
    final bool? result = await showDialog<bool>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(sizes.p12),
          ),
          contentPadding: insets.a24,
          content: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (image != null) ...<Widget>[
                    Center(child: image),
                  ],
                  DefaultTextStyle(
                    style: typo.headlineSmall.weight500.copyWith(
                      color: colorScheme.error,
                    ),
                    child: title,
                  ),
                  DefaultTextStyle(
                    style: typo.bodyMedium.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    child: content,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context, rootNavigator: true)
                                  .pop(false),
                          child: Padding(
                            padding: insets.h16.add(insets.v8),
                            child: Center(child: negative ?? Text(l10n.cancel)),
                          ),
                        ),
                      ),
                      gaps.w16,
                      Expanded(
                        child: AppElevatedButton(
                            dense: false,
                            primary: colorScheme.errorContainer,
                            child: positive ??
                                Text(
                                  l10n.confirm,
                                  style: typo.labelLarge.copyWith(
                                    color: colorScheme.onErrorContainer,
                                  ),
                                ),
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true)),
                      ),
                    ],
                  )
                ].applySeparator(gaps.h16),
              ),
              Positioned(
                  top: -sizes.p16,
                  right: -sizes.p16,
                  child: GestureDetector(
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).pop(false),
                      child: AppIcon(AppIcons.icClose, size: sizes.p24)))
            ],
          ),
        );
      },
    );

    return result ?? false;
  }
}
