import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

import 'package:flutter/material.dart';

extension Breakpoints on BuildContext {
  /// All the breakpoints according to Material Design's breakpoint system.
  BreakpointSystemEntry get breakpoints => getBreakpointEntry(this);

  /// Double the default gutter size.
  double get gutterLarge => breakpoints.gutter * 2;

  /// The gutter size according to Material Design's breakpoints system.
  double get gutter => breakpoints.gutter;

  /// Half the default gutter size.
  double get gutterSmall => breakpoints.gutter / 2;

  /// A quarter the default gutter size.
  double get gutterTiny => breakpoints.gutter / 4;

  /// The margin size according to Material Design's breakpoints system.
  double get margin => breakpoints.margin;

  int get columns => breakpoints.columns;
}
