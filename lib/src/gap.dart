import 'package:flutter/material.dart';

/// Creates a `SizedBox` with a height of size corresponding to the layout axis
/// of the first `Scrollable`, `Row` or `Column` above this widget.
class Gap extends StatelessWidget {
  const Gap({super.key, required this.size});

  /// The size of the gap.
  final double size;

  @override
  Widget build(BuildContext context) {
    return _AxisAware(
      builder: (context, orientation) {
        return SizedBox(
          width: orientation == Orientation.landscape ? size : null,
          height: orientation != Orientation.portrait ? null : size,
        );
      },
    );
  }
}

class _AxisAware extends StatelessWidget {
  const _AxisAware({required this.builder});

  final OrientationWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    Orientation? orientation;
    context.visitAncestorElements((element) {
      final Widget widget = element.widget;
      if (widget is Row) {
        orientation = Orientation.landscape;
        return false;
      }
      if (widget is Column) {
        orientation = Orientation.portrait;
        return false;
      }
      if (widget is Scrollable) {
        switch (widget.axis) {
          case Axis.horizontal:
            orientation = Orientation.landscape;
            break;
          case Axis.vertical:
            orientation = Orientation.portrait;
            break;
        }
        return false;
      }
      return true;
    });
    assert(
      orientation != null,
      'Could not find an ancestor row, column or scrollable.',
    );
    return builder(context, orientation!);
  }
}
