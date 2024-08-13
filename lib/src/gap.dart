import 'package:flutter/material.dart';

import 'axis_aware_orientation.dart';

/// Creates a gap along the main axis of the nearest enclosing vertically or
/// horizontally aligned widget  (`Row`, `Column`, `Scrollable`, etc.).
class Gap extends StatelessWidget {
  /// Creates a gap of the given [size];
  const Gap({super.key, required this.size});

  /// The size of the gap along the main axis of the nearest enclosing
  /// vertically or horizontally aligned multi child widget.
  final double size;

  @override
  Widget build(BuildContext context) {
    return AxisAwareOrientation(
      key: key,
      builder: (BuildContext context, Orientation orientation) {
        return SizedBox(
          width: orientation == Orientation.landscape ? size : null,
          height: orientation != Orientation.portrait ? null : size,
        );
      },
    );
  }
}
