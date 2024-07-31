import 'package:flutter/widgets.dart';

import '../flutter_gutter.dart';

/// A gap of the standard gutter size according to Material Design's breakpoints
/// system.
/// Creates a `SizedBox` with a height of size corresponding to the layout axis
/// of the first `Scrollable`, `Row` or `Column` above this widget.
class Gutter extends StatelessWidget {
  /// Creates a new [Gutter] widget.
  const Gutter({
    super.key,
    this.size,
    this.type = GutterType.medium,
    this.scaleFactor,
  });

  /// Creates a new [Gutter] widget with a tiny size.
  const Gutter.tiny({super.key})
      : size = null,
        type = GutterType.tiny,
        scaleFactor = null;

  /// Creates a new [Gutter] widget with a small size.
  const Gutter.small({super.key})
      : size = null,
        type = GutterType.small,
        scaleFactor = null;

  /// Creates a new [Gutter] widget with a medium size.
  const Gutter.medium({super.key})
      : size = null,
        type = GutterType.medium,
        scaleFactor = null;

  /// Creates a new [Gutter] widget with a large size.
  const Gutter.large({super.key})
      : size = null,
        type = GutterType.large,
        scaleFactor = null;

  /// Creates a new [Gutter] widget with an extra large size.
  const Gutter.extraLarge({super.key})
      : size = null,
        type = GutterType.extraLarge,
        scaleFactor = null;

  /// The type of gutter to create.
  final GutterType type;

  /// The size of the gap.
  final double? size;

  /// The scale factor to apply to the gutter size.
  final double? scaleFactor;

  @override
  Widget build(BuildContext context) {
    return AxisAware(
      key: key,
      builder: (BuildContext context, Orientation orientation) {
        final double gapSize = size != null && scaleFactor != null
            ? size! * scaleFactor!
            : size ?? context.gutter(type: type, scaleFactor: scaleFactor);
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

/// A gap a quarter the standard gutter size according to Material Design's
/// breakpoints system
class GutterTiny extends Gutter {
  /// Creates a new [GutterTiny] widget.
  const GutterTiny({super.key}) : super.tiny();
}

/// A gap half the standard gutter size according to Material Design's
/// breakpoints system
class GutterSmall extends Gutter {
  /// Creates a new [GutterSmall] widget.
  const GutterSmall({super.key}) : super.small();
}

/// A gap twice the standard gutter size according to Material Design's
/// breakpoints system.
class GutterLarge extends Gutter {
  /// Creates a new [GutterLarge] widget.
  const GutterLarge({super.key}) : super.large();
}

/// A gap four times the standard gutter size according to Material Design's
/// breakpoints system.
class GutterExtraLarge extends Gutter {
  /// Creates a new [GutterExtraLarge] widget.
  const GutterExtraLarge({super.key}) : super.extraLarge();
}

/// A gap of the standard margin size according to Material Design's breakpoints
/// system
class Margin extends Gutter {
  /// Creates a new [Margin] widget.
  const Margin({super.key});
}

/// An inherited widget that sets custom [Gutter] and [Gap] behavior.
class GutterConfigurationData {
  /// Creates a new [GutterConfigurationData] instance.
  const GutterConfigurationData({
    this.widgetToAxis,
    this.dynamicAxisCheck = true,
  });

  /// A function to get the axis of a widget not supported by flutter_gutter.
  ///
  /// This should return an `Axis` if a widget is recognized and should return
  /// null if it is not.
  ///
  /// Note that this is not necessary if your widget already has an
  /// `Axis.direction` attribute as Flutter Gutter will find the axis from this
  /// automatically.
  ///
  /// ```dart
  /// widgetToAxis: (widget) {
  ///    if (widget is MyCustomHorizontalWidget) {
  ///     return Axis.horizontal;
  ///   }
  ///   return null;
  /// },
  /// ```
  final Axis? Function(Widget widget)? widgetToAxis;

  /// Whether or not gutter widgets should dynamically check for an `axis`
  /// argument on unrecognized widgets.
  ///
  /// Turning this off is useful if you have breakpoints on uncaught exceptions
  /// on as the dynamic check relies on a try...catch. However, widgets from
  /// other packages (eg `Boxy`) will not be supported out of the box if you
  /// turn off the dynamic check.
  ///
  /// Defaults to true.
  final bool dynamicAxisCheck;

  @override
  bool operator ==(Object other) {
    return other is GutterConfigurationData &&
        other.widgetToAxis == widgetToAxis;
  }

  @override
  int get hashCode => widgetToAxis.hashCode;
}

/// An inherited widget that sets custom [Gutter] and [Gap] behavior.
class GutterConfiguration extends InheritedWidget {
  /// Creates a new [GutterConfiguration] instance.
  const GutterConfiguration({
    super.key,
    required super.child,
    required this.data,
  });

  /// The configuration data.
  final GutterConfigurationData data;

  /// Gets the [GutterConfigurationData] from the nearest [GutterConfiguration]
  static GutterConfigurationData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GutterConfiguration>()
        ?.data;
  }

  @override
  bool updateShouldNotify(GutterConfiguration oldWidget) {
    return oldWidget.data == data;
  }
}
