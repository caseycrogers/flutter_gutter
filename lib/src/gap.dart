import 'package:flutter/material.dart';
import '../flutter_gutter.dart';

/// Creates a `SizedBox` with a height of size corresponding to the layout axis
/// of the first `Scrollable`, `Row` or `Column` above this widget.
class Gap extends StatelessWidget {
  /// Creates a new [Gap] widget.
  const Gap({super.key, required this.type, this.size});

  /// The type of gutter to create.
  final GutterType type;

  /// The size of the gutter.
  final double? size;

  @override
  Widget build(BuildContext context) {
    return _AxisAware(
      builder: (BuildContext context, Orientation orientation) {
        final double gapSize = size ?? context.gutter(type: type);
        if (type == GutterType.expand) {
          return Expanded(
            child: SizedBox(
              width: orientation == Orientation.landscape ? gapSize : null,
              height: orientation != Orientation.portrait ? null : gapSize,
            ),
          );
        } else {
          return SizedBox(
            width: orientation == Orientation.landscape ? gapSize : null,
            height: orientation != Orientation.portrait ? null : gapSize,
          );
        }
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
    context.visitAncestorElements((Element element) {
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

/// An extension on [Axis] to convert it to an [Orientation].
extension AxisUtils on Axis {
  /// Converts this [Axis] to an [Orientation].
  Orientation get toOrientation => switch (this) {
        Axis.horizontal => Orientation.landscape,
        Axis.vertical => Orientation.portrait,
      };
}
