import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router.dart';
import '../../shared/common/common.dart';
import '../../shared/widgets/widgets.dart';
import 'empty.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    final Flex body = context.responsiveValue(
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(flex: 2, child: EmptyWidget(title: error.toString())),
          context.gaps.w16,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _actionButton(context),
            ),
          )
        ],
      ),
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: EmptyWidget(content: error.toString())),
          ..._actionButton(context),
        ],
      ),
    );
    return Scaffold(
      body: Padding(padding: context.insets.a16, child: body),
    );
  }

  List<Widget> _actionButton(BuildContext context) => <Widget>[
        AppOutlinedButton(
          dense: false,
          child: Text(context.l10n.back),
          onPressed: () =>
              context.canPop() ? context.pop() : context.go(Routes.home),
        ),
        context.gaps.h8,
        AppElevatedButton(
          dense: false,
          child: Text(context.l10n.back_to_home),
          onPressed: () => context.go(Routes.home),
        )
      ];
}
