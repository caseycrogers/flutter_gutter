import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

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
    final GutterConfigurationData? gutterConfiguration =
        GutterConfiguration.maybeOf(context);
    Orientation? orientation;
    context.visitAncestorElements((element) {
      final Widget widget = element.widget;
      orientation =
          gutterConfiguration?.widgetToAxis?.call(widget)?.toOrientation;
      if (orientation != null) {
        return false;
      }
      if (widget is Scrollable) {
        orientation = widget.axis.toOrientation;
        return false;
      }
      if (widget is Flex) {
        orientation = widget.direction.toOrientation;
        return false;
      }
      if (gutterConfiguration?.dynamicAxisCheck == false) {
        // Skip to the next ancestor element instead of running the dynamic
        // check.
        return true;
      }
      try {
        // Dynamically check for an axis.
        orientation = ((widget as dynamic).direction as Axis).toOrientation;
        return false;
      } catch (_) {
        return true;
      }
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
