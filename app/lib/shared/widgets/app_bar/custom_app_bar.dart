import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../button/custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onBackClicked,
    this.title,
    this.actions = const <Widget>[],
    this.titleText,
    this.bottom,
  });

  final Function()? onBackClicked;
  final Widget? title;
  final String? titleText;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const CustomBackButton(),
      centerTitle: true,
      title: title ??
          Text(titleText ?? '', style: context.typo.titleLarge.weight600),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
