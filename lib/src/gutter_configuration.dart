import 'package:flutter/widgets.dart';

/// An inherited widget that sets custom [Gutter] and [GutterPadding] behavior.
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
