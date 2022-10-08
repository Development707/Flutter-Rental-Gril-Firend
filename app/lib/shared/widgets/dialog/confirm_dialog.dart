import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../common/common.dart';
import '../app_icon.dart';
import '../button/elevated_button.dart';

extension ConfirmDialog on BuildContext {
  Future<bool> showConfirmDialog<T>({
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
                    style: typo.headlineSmall.weight500,
                    child: title,
                  ),
                  DefaultTextStyle(
                    style: typo.bodyMedium,
                    child: content,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                            child: negative ?? Text(l10n.cancel),
                            onTap: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(false)),
                      ),
                      gaps.w16,
                      Expanded(
                        child: AppElevatedButton(
                            primary: colorScheme.primary,
                            child: positive ?? Text(l10n.confirm),
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true)),
                      ),
                    ],
                  )
                ].applySeparator(separator: gaps.h16),
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
