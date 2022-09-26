import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/router.dart';
import '../../common/common.dart';

class CustomAppbarSliver extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarSliver({
    super.key,
    this.title,
    this.canBack = false,
    this.onBackClicked,
    this.actions = const <Widget>[],
    this.transparentAppBar = false,
    this.titleText,
    this.leading,
    this.bottom,
    this.shape,
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
  final bool canBack;
  final Function()? onBackClicked;
  final bool transparentAppBar;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;
  final bool pinned;
  final bool floating;
  final bool snap;
  final bool stretch;

  final double? expandedHeight;
  final Widget? flexibleSpace;

  @override
  Widget build(BuildContext context) {
    final GoRouter router = context.goRouter;
    return SliverAppBar(
      elevation: 0,
      backgroundColor: transparentAppBar ? context.colors.transparent : null,
      leadingWidth: (router.canPop() || canBack || leading != null)
          ? context.sizes.p32
          : 0,
      leading: (router.canPop() || canBack)
          ? Padding(
              padding: context.insets.v8,
              child: BackButton(
                color: context.colors.primary100,
                onPressed: onBackClicked ??
                    () =>
                        router.canPop() ? router.pop() : router.go(Routes.home),
              ),
            )
          : leading ?? const SizedBox(),
      centerTitle: true,
      title: title ??
          Text(titleText ?? '', style: context.typo.titleLarge.weight600),
      toolbarHeight: 60,
      actions: actions,
      bottom: bottom,
      shape: shape,
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
