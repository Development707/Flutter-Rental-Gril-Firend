import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../button/custom_back_button.dart';

class CustomAppbarSliver extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarSliver({
    super.key,
    this.title,
    this.onBackClicked,
    this.actions = const <Widget>[],
    this.titleText,
    this.leading,
    this.bottom,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    this.expandedHeight,
    this.flexibleSpace,
  });

  final Widget? title;
  final Widget? leading;
  final String? titleText;
  final List<Widget> actions;
  final Function()? onBackClicked;
  final PreferredSizeWidget? bottom;
  final bool pinned;
  final bool floating;
  final bool snap;
  final bool stretch;

  final double? expandedHeight;
  final Widget? flexibleSpace;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: CustomBackButton(onPressed: onBackClicked),
      centerTitle: true,
      title: title ??
          Text(titleText ?? '', style: context.typo.titleLarge.weight600),
      actions: actions,
      bottom: bottom,
      pinned: pinned,
      floating: floating,
      snap: snap,
      stretch: stretch,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      (expandedHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0));
}
