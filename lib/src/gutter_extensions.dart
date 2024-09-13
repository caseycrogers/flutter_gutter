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
    return switch (Breakpoint.activeBreakpointOf(this)) {
      <= Breakpoints.small => _spacing.materialSpacingSmall,
      <= Breakpoints.medium => _spacing.materialSpacingMedium,
      // Default case for anything larger than medium.
      Breakpoint() => _spacing.materialSpacingLarge,
    };
  }

  MaterialBreakpointSpacing get _spacing =>
      GutterConfiguration.maybeOf(this)?.spacing ??
      GutterConfigurationData.kDefaultSpacing;

  GutterScaling get _scaling =>
      GutterConfiguration.maybeOf(this)?.scaling ??
      GutterConfigurationData.kDefaultScaling;
}
