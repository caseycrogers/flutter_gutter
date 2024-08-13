import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import 'gutter_configuration.dart';

/// Extension to add gutter sizes according to Material Design's breakpoints system.
extension GutterExtensions on BuildContext {
  /// The margin size according to Material Design's breakpoints system.
  double get margin => materialSpacing;

  /// A quarter the default gutter size.
  double get gutterTiny => materialSpacing * _scaling.tinyScaleFactor;

  /// Half the default gutter size.
  double get gutterSmall => materialSpacing * _scaling.smallScaleFactor;

  /// The default gutter size.
  double get gutter => materialSpacing;

  /// Double the default gutter size.
  double get gutterLarge => materialSpacing * _scaling.largeScaleFactor;

  /// Triple the default gutter size.
  double get gutterExtraLarge =>
      materialSpacing * _scaling.extraLargeScaleFactor;

  /// The size according to Material Design's breakpoints system.
  double get materialSpacing {
    if (Breakpoints.small.isActive(this)) {
      return _spacing.materialSpacingSmall;
    } else if (Breakpoints.mediumAndUp.isActive(this)) {
      return _spacing.materialSpacingMedium;
    } else {
      return _spacing.materialSpacingSmall;
    }
  }

  MaterialBreakpointSpacing get _spacing =>
      GutterConfiguration.maybeOf(this)?.spacing ??
      GutterConfigurationData.kDefaultSpacing;

  GutterScaling get _scaling =>
      GutterConfiguration.maybeOf(this)?.scaling ??
      GutterConfigurationData.kDefaultScaling;
}
