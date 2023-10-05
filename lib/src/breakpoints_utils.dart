import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

import 'package:flutter/material.dart';

extension Breakpoints on BuildContext {
  /// All the breakpoints according to Material Design's breakpoint system.
  BreakpointSystemEntry get breakpoints => getBreakpointEntry(this);

  /// Double the default gutter size.
  double get gutterLarge => (_material3Value ?? breakpoints.gutter) * 2;

  /// The gutter size according to Material Design's breakpoints system.
  double get gutter => _material3Value ?? breakpoints.gutter;

  /// Half the default gutter size.
  double get gutterSmall => (_material3Value ?? breakpoints.gutter) / 2;

  /// A quarter the default gutter size.
  double get gutterTiny => (_material3Value ?? breakpoints.gutter) / 4;

  /// The margin size according to Material Design's breakpoints system.
  double get margin => _material3Value ?? breakpoints.margin;

  int get columns => breakpoints.columns;

  double? get _material3Value {
    if (!Theme.of(this).useMaterial3) {
      return null;
    }
    final Size size = MediaQuery.of(this).size;
    if (size.width < 600 || size.height < 600) {
      // Use the compact screen values.
      // See: https://m3.material.io/foundations/layout/applying-layout/compact
      return 16;
    }
    // Use the medium/expanded screen values.
    // See: https://m3.material.io/foundations/layout/applying-layout/medium
    return 24;
  }
}
