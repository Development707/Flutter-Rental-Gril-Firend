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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child: Image.asset(AppImages.notFound)),
        context.gaps.h4,
        Text(content ?? '', style: context.typo.headlineMedium),
      ],
    );
  }
}
