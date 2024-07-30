import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'package:flutter/material.dart';

import '../flutter_gutter.dart';

/// A gap of the standard gutter size according to Material Design's breakpoints
extension BreakpointExtensions on BuildContext {
  /// The margin size according to Material Design's breakpoints system.
  double get margin => materialSpacing;

  /// The size according to Material Design's with a specified [GutterType].
  double spacing(GutterType type) {
    switch (type) {
      case GutterType.tiny:
        return materialSpacing / 4;
      case GutterType.small:
        return materialSpacing / 2;
      case GutterType.medium:
        return materialSpacing;
      case GutterType.large:
        return materialSpacing * 2;
      case GutterType.extraLarge:
        return materialSpacing * 4;
    }
  }

  /// The size according to Material Design's breakpoints system.
  double get materialSpacing {
    if (Breakpoints.small.isActive(this)) {
      // Use the compact screen values.
      // See: https://m3.material.io/foundations/layout/applying-layout/compact
      return 16;
    } else if (Breakpoints.medium.isActive(this)) {
      // Use the medium/expanded screen values.
      // See: https://m3.material.io/foundations/layout/applying-layout/medium
      return 24;
    } else if (Breakpoints.large.isActive(this)) {
      // Use the large screen values.
      // See: https://m3.material.io/foundations/layout/applying-layout/large-extra-large
      return 24;
    } else {
      return 16;
    }
  }
}
