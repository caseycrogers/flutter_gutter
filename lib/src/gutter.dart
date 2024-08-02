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
    this.scaleFactor = 1,
  });

  /// The spacing used on small screens according to Material Design's
  static const double materialSpacingSmall = 16.0;

  /// The spacing used on medium and large screens according to Material Design's
  static const double materialSpacingMediumAndUp = 24.0;

  /// The default scale factor for a small increase.
  static const int scaleFactorSmallDefault = 2;

  /// The default scale factor for a medium increase.
  static const int scaleFactorMediumDefault = 4;

  /// The type of gutter to create.
  final GutterType type;

  /// The size of the gap.
  final double? size;

  /// The scale factor to apply to the gutter size.
  final double scaleFactor;

  /// Creates a new [Gutter] widget with a single line size.
  const Gutter.singleLine({super.key})
      : size = 1,
        type = GutterType.expand,
        scaleFactor = 1;

  /// Creates a new [Gutter] widget with a tiny size.
  const Gutter.tiny({super.key, this.scaleFactor = 1})
      : size = null,
        type = GutterType.tiny;

  /// Creates a new [Gutter] widget with a small size.
  const Gutter.small({super.key, this.scaleFactor = 1})
      : size = null,
        type = GutterType.small;

  /// Creates a new [Gutter] widget with a medium size.
  const Gutter.medium({super.key, this.scaleFactor = 1})
      : size = null,
        type = GutterType.medium;

  /// Creates a new [Gutter] widget with a large size.
  const Gutter.large({super.key, this.scaleFactor = 1})
      : size = null,
        type = GutterType.large;

  /// Creates a new [Gutter] widget with an extra large size.
  const Gutter.extraLarge({super.key, this.scaleFactor = 1})
      : size = null,
        type = GutterType.extraLarge;

  /// Creates a new [Gutter] widget with an expand size.
  const Gutter.expand({super.key, this.scaleFactor = 1})
      : size = null,
        type = GutterType.expand;

  @override
  Widget build(BuildContext context) {
    return AxisAware(
      key: key,
      builder: (BuildContext context, Orientation orientation) {
        final double gapSize =
            calculateGapSize(context, size, type, scaleFactor);

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

/// calculates the gap size based on the size, type and scale factor.
double calculateGapSize(
    BuildContext context, double? size, GutterType type, double scaleFactor) {
  return size != null
      ? (size * scaleFactor)
      : context.gutter(type: type, scaleFactor: scaleFactor);
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
  const Margin({super.key, super.size, super.type, super.scaleFactor});
}

/// A widget that insets its child by the material padding or the given padding.
class GutterPadding extends Gutter {
  /// Creates a new [GutterPadding] widget with custom padding.
  const GutterPadding({
    super.key,
    this.child,
    super.size,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  })  : left = null,
        top = null,
        right = null,
        bottom = null;

  /// Creates a new [GutterPadding] widget with specific edge insets.
  const GutterPadding.only({
    super.key,
    this.child,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  });

  /// Creates a new [GutterPadding] widget with symmetric padding.
  const GutterPadding.symmetric({
    super.key,
    this.child,
    double? vertical = 0,
    double? horizontal = 0,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  /// Creates a new [GutterPadding] widget with uniform padding.
  const GutterPadding.all(
    double? padding, {
    super.key,
    this.child,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  })  : left = padding,
        top = padding,
        right = padding,
        bottom = padding;

  /// The child widget.
  final Widget? child;

  /// The offset from the left.
  final double? left;

  /// The offset from the right.
  final double? right;

  /// The offset from the top.
  final double? top;

  /// The offset from the bottom.
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    final double gapSize = calculateGapSize(context, size, type, scaleFactor);

    return Padding(
      padding: EdgeInsets.only(
        left: left ?? gapSize,
        top: top ?? gapSize,
        right: right ?? gapSize,
        bottom: bottom ?? gapSize,
      ),
      child: child,
    );
  }
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
