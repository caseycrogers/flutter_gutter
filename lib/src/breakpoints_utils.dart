import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

import 'package:flutter/material.dart';

extension Breakpoints on BuildContext {
  BreakpointSystemEntry get breakpoints => getBreakpointEntry(this);

  double get gutterLarge => breakpoints.gutter * 2;

  double get gutter => breakpoints.gutter;

  double get gutterSmall => breakpoints.gutter / 2;

  double get gutterTiny => breakpoints.gutter / 4;

  double get margin => breakpoints.margin;

  int get columns => breakpoints.columns;
}
