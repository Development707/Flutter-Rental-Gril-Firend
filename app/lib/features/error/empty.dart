import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../shared/common/common.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.title,
    this.content,
  });

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(AppImages.notFound),
        context.gaps.gapH16,
        Text(title ?? context.l10n.empty_title, style: context.typo.titleLarge),
        context.gaps.gapH4,
        Text('$content', style: context.typo.headlineMedium),
      ],
    );
  }
}
