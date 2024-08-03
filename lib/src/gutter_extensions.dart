import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../flutter_gutter.dart';

/// Extension to add gutter sizes according to Material Design's breakpoints system.
extension GutterExtensions on BuildContext {
  /// The margin size according to Material Design's breakpoints system.
  double get margin => materialSpacing;

  static double? _gutterTiny;
  static double? _gutterSmall;
  static double? _gutterMedium;
  static double? _gutterLarge;
  static double? _gutterExtraLarge;

  /// A quarter the default gutter size.
  double get gutterTiny => _gutterTiny ??= gutterSize(type: GutterType.tiny);

  /// Half the default gutter size.
  double get gutterSmall => _gutterSmall ??= gutterSize(type: GutterType.small);

  /// The default gutter size.
  double get gutter => gutterMedium;

  /// The default gutter size.
  double get gutterMedium =>
      _gutterMedium ??= gutterSize(type: GutterType.medium);

  /// Double the default gutter size.
  double get gutterLarge => _gutterLarge ??= gutterSize(type: GutterType.large);

  /// Triple the default gutter size.
  double get gutterExtraLarge =>
      _gutterExtraLarge ??= gutterSize(type: GutterType.extraLarge);

  /// The size according to Material Design's with a specified [GutterType].
  /// If [size] is provided, it will be used instead of the default size.
  /// If [scaleFactor] is provided, it will be used to scale the size.
  double gutterSize({
    GutterType type = GutterType.medium,
    double? size,
    double scaleFactor = 1,
  }) {
    return size != null
        ? (size * scaleFactor)
        : scaleFactor *
            switch (type) {
              GutterType.tiny =>
                materialSpacing / Gutter.scaleFactorMediumDefault,
              GutterType.small =>
                materialSpacing / Gutter.scaleFactorSmallDefault,
              GutterType.medium => materialSpacing,
              GutterType.large =>
                materialSpacing * Gutter.scaleFactorSmallDefault,
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
