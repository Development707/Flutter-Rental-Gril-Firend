import 'package:flutter/widgets.dart';

/// Allows you to insert widgets inside a CustomScrollView
extension WidgetSliverBoxExtension on Widget {
  Widget get sliverBox => SliverToBoxAdapter(child: this);
}
