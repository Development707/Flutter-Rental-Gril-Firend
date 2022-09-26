import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.size, this.strokeWidth = 4.0});

  /// If non-null, requires the child to have exactly this size.
  final double? size;

  /// The width of the line used to draw the circle.
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox.square(
            dimension: size,
            child: CircularProgressIndicator(strokeWidth: strokeWidth)));
  }
}
