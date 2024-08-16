import 'package:flutter/widgets.dart';

/// An inherited widget that sets custom [Gutter] and [GutterPadding] behavior.
class GutterConfigurationData {
  /// Creates a new [GutterConfigurationData] instance.
  const GutterConfigurationData({
    this.widgetToAxis,
    this.dynamicAxisCheck = true,
    this.spacing,
    this.scaling,
  });

  /// The default spacing for a gutter according to the screen size as laid out
  /// by the material breakpoints system.
  ///
  /// For example, a screen that is less than 600 pixels wide will get a base
  /// spacing of 16 so a [Gutter] will be 16 dp large.
  static const MaterialBreakpointSpacing kDefaultSpacing =
      MaterialBreakpointSpacing();

  /// The default scaling of smaller or larger gutters with respect to the base
  /// [Gutter].
  ///
  /// For example, [GutterTiny] is .25 times as large as [Gutter].
  static const GutterScaling kDefaultScaling = GutterScaling();

  /// The spacing according to screen size to use for all [Gutter] widgets.
  ///
  /// See [kDefaultSpacing].
  final MaterialBreakpointSpacing? spacing;

  /// The sizes of smaller and larger gutters relative to the material spacing.
  ///
  /// See [kDefaultScaling].
  final GutterScaling? scaling;

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

/// An inherited widget that sets custom [Gutter] and [GutterPadding] behavior.
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

/// The spacing for a [Gutter] widget according to the current screen size.
class MaterialBreakpointSpacing {
  /// Creates a [MaterialBreakpointSpacing].
  const MaterialBreakpointSpacing({
    this.materialSpacingSmall = kDefaultMaterialSpacingSmall,
    this.materialSpacingMedium = kDefaultMaterialSpacingMediumAndUp,
    this.materialSpacingLarge = kDefaultMaterialSpacingMediumAndUp,
  });

  /// The base gutter spacing to use for small screens.
  final double materialSpacingSmall;

  /// The base gutter spacing for medium screens.
  final double materialSpacingMedium;

  /// The base gutter spacing for large screens.
  final double materialSpacingLarge;

  /// The default spacing used on small screens according to Material Design.
  ///
  /// See: https://m3.material.io/foundations/layout/applying-layout/compact
  static const double kDefaultMaterialSpacingSmall = 16;

  /// The default spacing used on medium and large screens according to Material
  /// Design.
  ///
  /// See: https://m3.material.io/foundations/layout/applying-layout/medium
  static const double kDefaultMaterialSpacingMediumAndUp = 24;
}

/// The scale factors of smaller or larger gutters relative to the default
/// gutter and material spacing.
class GutterScaling {
  /// Creates a [GutterScaling].
  const GutterScaling({
    this.tinyScaleFactor = kDefaultScaleFactorTiny,
    this.smallScaleFactor = kDefaultScaleFactorSmall,
    this.largeScaleFactor = kDefaultScaleFactorLarge,
    this.extraLargeScaleFactor = kDefaultScaleFactorExtraLarge,
    this.marginScaleFactor = kDefaultScaleFactorMargin,
  });

  /// The default scale factor to use for [GutterTiny].
  static const double kDefaultScaleFactorTiny = .25;

  /// The default scale factor to use for [GutterSmall].
  static const double kDefaultScaleFactorSmall = .5;

  /// The default scale factor to use for [GutterLarge].
  static const double kDefaultScaleFactorLarge = 2;

  /// The default scale factor to use for [GutterExtraLarge].
  static const double kDefaultScaleFactorExtraLarge = 4;

  /// The default scale factor to use for [Margin].
  static const double kDefaultScaleFactorMargin = 1;

  /// The scale factor (relative to the base material spacing for the current
  /// breakpoint) to use for [GutterTiny].
  final double tinyScaleFactor;

  /// The scale factor (relative to the base material spacing for the current
  /// breakpoint) to use for [GutterSmall].
  final double smallScaleFactor;

  /// The scale factor (relative to the base material spacing for the current
  /// breakpoint) to use for [GutterLarge].
  final double largeScaleFactor;

  /// The scale factor (relative to the base material spacing for the current
  /// breakpoint) to use for [GutterExtraLarge].
  final double extraLargeScaleFactor;

  /// The scale of a margin relative to a Gutter.
  final double marginScaleFactor;
}
