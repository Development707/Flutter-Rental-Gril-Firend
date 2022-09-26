import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../common/common.dart';
import '../app_icon.dart';
import '../button/elevated_button.dart';
import '../button/text_button.dart';

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
                        child: AppTextButton(
                            primary: colorScheme.onSecondaryContainer,
                            child: negative ?? Text(l1On.cancel),
                            onPressed: () => Navigator.of(context).pop(false)),
                      ),
                      gaps.gapW16,
                      Expanded(
                        child: AppElevatedButton(
                            primary: colorScheme.error,
                            child: positive ?? Text(l1On.confirm),
                            onPressed: () => Navigator.of(context).pop(true)),
                      ),
                    ],
                  )
                ].applySeparator(separator: gaps.gapH16),
              ),
              Positioned(
                  top: -sizes.p16,
                  right: -sizes.p16,
                  child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: AppIcon(AppIcons.icClose, size: sizes.p24)))
            ],
          ),
        );
      },
    );

    await Future<void>.delayed(const Duration(milliseconds: 500));

    return result ?? false;
  }
}
