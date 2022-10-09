import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

extension ListExtension<T> on List<T?> {
  void addOrRemove(T? data) {
    contains(data) ? remove(data) : add(data);
  }

  void addIfNotContains(T? data) {
    if (!contains(data)) {
      add(data);
    }
  }

  void addAllIfNotContains(Iterable<T> data) {
    for (final T x in data) {
      if (!contains(x)) {
        add(x);
      }
    }
  }

  void removeAllIfContains(Iterable<T> data) {
    for (final T x in data) {
      if (contains(x)) {
        remove(x);
      }
    }
  }

  bool containsWhere(bool Function(T? item) test) =>
      firstWhereOrNull(test) != null;
}

extension IterableDividerExtension on Iterable<Widget> {
  Iterable<Widget> applySeparator(Widget separator) {
    return mapIndexed((int index, Widget item) => <Widget>[
          if (index != 0) separator,
          item,
        ]).expand((List<Widget> element) => element);
  }
}

extension ListDividerExtension on List<Widget> {
  List<Widget> applySeparator(Widget separator) {
    return mapIndexed((int index, Widget item) => <Widget>[
          if (index != 0) separator,
          item,
        ]).expand((List<Widget> element) => element).toList();
  }
}

extension IterableExt<T> on Iterable<T> {
  /// The first element, or `null` if the iterable is empty.
  T? get firstOrNull {
    final Iterator<T> iterator = this.iterator;
    if (iterator.moveNext()) {
      return iterator.current;
    }
    return null;
  }
}
