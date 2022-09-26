import 'package:flutter/material.dart';

class LoadingOpacity extends StatelessWidget {
  const LoadingOpacity({
    super.key,
    required this.child,
    required this.loading,
  });

  final Widget child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: loading ? .5 : 1,
      child: AbsorbPointer(
        absorbing: loading,
        child: child,
      ),
    );
  }
}
