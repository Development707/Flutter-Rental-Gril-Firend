import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../common/common.dart';
import '../widgets.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (!context.goRouter.canPop()) {
      return const SizedBox();
    }

    return IconButton(
      icon: AppIcon(
        AppIcons.icArrowLeft,
        color: context.colorScheme.onPrimaryContainer,
      ),
      onPressed: onPressed ??
          () => context.goRouter.canPop()
              ? context.goRouter.pop()
              : context.goRouter.go('/'),
    );
  }
}
