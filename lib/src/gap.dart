import 'package:flutter/material.dart';

/// Creates a `SizedBox` with a height of size corresponding to the layout axis
/// of the first `Scrollable`, `Row` or `Column` above this widget.
class Gap extends StatelessWidget {
  const Gap({super.key, required this.size});

  /// A function to check the axis of widgets not already supported by
  /// flutter_gutter.
  ///
  /// This should return an `Axis` if a widget is recognized and should return
  /// null if it is not.
  ///
  /// Set this function once in your app (in main, in an initState at the top of
  /// your widget tree, etc) if you want to use [Gutter] or [Gap] in
  /// widgets other than the Flutter built-ins.
  ///
  /// For example, the following would allow you to put [Gutter]'s in widgets
  /// from `Boxy` (https://pub.dev/packages/boxy):
  ///
  /// ```dart
  /// // In `main()`.
  /// Gap.customWidgetToAxis = (widget) {
  /// if (widget is BoxyRow) {
  ///   return Axis.horizontal;
  /// }
  /// if (widget is BoxyColumn) {
  ///   return Axis.vertical;
  /// }
  /// return null;
  /// };
  /// ```
  static Axis? Function(Widget widget)? customWidgetToAxis;

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
      orientation = Gap.customWidgetToAxis?.call(widget)?.toOrientation;
      if (orientation != null) {
        return false;
      }
      if (widget is Scrollable) {
        orientation = widget.axis.toOrientation;
        return false;
      }
      try {
        // Dynamically check for an axis.
        orientation = ((widget as dynamic).direction as Axis).toOrientation;
        return false;
      } catch (_) {
        return true;
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

extension AxisUtils on Axis {
  Orientation get toOrientation => switch (this) {
        Axis.horizontal => Orientation.landscape,
        Axis.vertical => Orientation.portrait,
      };
}
