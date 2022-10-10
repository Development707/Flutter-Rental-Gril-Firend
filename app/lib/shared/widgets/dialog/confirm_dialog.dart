import 'package:flutter/material.dart';

import '../../common/common.dart';
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
          content: Column(
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
                        onTap: () => Navigator.of(context, rootNavigator: true)
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
            ].applySeparator(gaps.h16),
          ),
        );
      },
    );

    return result ?? false;
  }
}
