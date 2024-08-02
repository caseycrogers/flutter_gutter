import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../flutter_gutter.dart';

/// A gap of the standard gutter size according to Material Design's breakpoints
extension GutterExtensions on BuildContext {
  /// The margin size according to Material Design's breakpoints system.
  double get margin => materialSpacing;

  /// The size according to Material Design's with a specified [GutterType].
  double gutter({GutterType type = GutterType.medium, double scaleFactor = 1}) {
    return scaleFactor *
        switch (type) {
          GutterType.tiny => materialSpacing / Gutter.scaleFactorMediumDefault,
          GutterType.small => materialSpacing / Gutter.scaleFactorSmallDefault,
          GutterType.medium => materialSpacing,
          GutterType.large => materialSpacing * Gutter.scaleFactorSmallDefault,
          GutterType.extraLarge =>
            materialSpacing * Gutter.scaleFactorMediumDefault,
          GutterType.expand => double.infinity,
        };
  }

  /// The size according to Material Design's breakpoints system.
  double get materialSpacing {
    if (Breakpoints.small.isActive(this)) {
      // Use the compact screen values.
      // See: https://m3.material.io/foundations/layout/applying-layout/compact
      return Gutter.materialSpacingSmall;
    } else if (Breakpoints.medium.isActive(this)) {
      // Use the medium/expanded screen values.
      // See: https://m3.material.io/foundations/layout/applying-layout/medium
      return Gutter.materialSpacingMediumAndUp;
    } else if (Breakpoints.large.isActive(this)) {
      // Use the large screen values.
      // See: https://m3.material.io/foundations/layout/applying-layout/large-extra-large
      return Gutter.materialSpacingMediumAndUp;
    } else {
      return Gutter.materialSpacingSmall;
    }
  }
}

/// Extension to add a gutter between the items of an iterable.
extension SeparatedIterable on Iterable<Widget> {
  /// Allows to insert a [Gutter] between the items of the iterable.
  List<Widget> withGutter({Gutter gutter = const Gutter.medium()}) {
    final List<Widget> result = <Widget>[];
    final Iterator<Widget> iterator = this.iterator;
    if (iterator.moveNext()) {
      result.add(iterator.current);
      while (iterator.moveNext()) {
        result
          ..add(gutter)
          ..add(iterator.current);
      }
    }
    return result;
  }
}
