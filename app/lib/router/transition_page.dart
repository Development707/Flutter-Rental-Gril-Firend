import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

CurveTween _curveTween = CurveTween(curve: Curves.fastOutSlowIn);

class FadeTransitionPage extends CustomTransitionPage<void> {
  const FadeTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: animation.drive(_curveTween),
        child: child,
      );
}

class ScaleTransitionPage extends CustomTransitionPage<void> {
  const ScaleTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      ScaleTransition(
        scale: animation.drive(_curveTween),
        child: child,
      );
}

class SlideTransitionPage extends CustomTransitionPage<void> {
  SlideTransitionPage({
    Offset begin = const Offset(1.0, 0.0),
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
            transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: begin,
                    end: Offset.zero,
                  ).animate(animation.drive(_curveTween)),
                  child: child,
                ));
}

class RotationTransitionPage extends CustomTransitionPage<void> {
  const RotationTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      RotationTransition(
        turns: Tween<double>(begin: 0.35, end: 0)
            .animate(animation)
            .drive(_curveTween),
        alignment: Alignment.bottomCenter,
        child: child,
      );
}

class SizeTransitionPage extends CustomTransitionPage<void> {
  const SizeTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      Align(
        child: SizeTransition(
          sizeFactor: animation.drive(_curveTween),
          child: child,
        ),
      );
}

class CupertinoTransitionPage extends CustomTransitionPage<void> {
  const CupertinoTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      CupertinoPageTransition(
        primaryRouteAnimation: animation,
        secondaryRouteAnimation: secondaryAnimation,
        linearTransition: false,
        child: child,
      );
}

class CupertinoDialogTransitionPage extends CustomTransitionPage<void> {
  const CupertinoDialogTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(transitionsBuilder: _transitionsBuilder);

  static Widget _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      CupertinoFullscreenDialogTransition(
        primaryRouteAnimation: animation,
        secondaryRouteAnimation: secondaryAnimation,
        linearTransition: false,
        child: child,
      );
}
