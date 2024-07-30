import 'package:flutter/material.dart';

import '../flutter_gutter.dart';

enum GutterType { tiny, small, medium, large, extraLarge }

/// A gap of the standard gutter size according to Material Design's breakpoints
/// system.
class Gutter extends StatelessWidget {
  /// Creates a new [Gutter] widget.
  const Gutter({super.key, this.size}) : type = GutterType.medium;

  const Gutter.tiny({super.key, this.size}) : type = GutterType.tiny;

  const Gutter.small({super.key, this.size}) : type = GutterType.small;

  const Gutter.medium({super.key, this.size}) : type = GutterType.medium;

  const Gutter.large({super.key, this.size}) : type = GutterType.large;

  const Gutter.extraLarge({super.key, this.size})
      : type = GutterType.extraLarge;

  final GutterType type;

  final double? size;

  @override
  Widget build(BuildContext context) {
    return size != null ? Gap(size: size!) : Gap(size: context.spacing(type));
  }
}

/// A gap a quarter the standard gutter size according to Material Design's
/// breakpoints system
class GutterTiny extends Gutter {
  const GutterTiny({super.key}) : super.tiny();
}

/// A gap half the standard gutter size according to Material Design's
/// breakpoints system
class GutterSmall extends Gutter {
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
class Margin extends StatelessWidget {
  const Margin({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.margin);
}

/// An inherited widget that sets custom [Gutter] and [Gap] behavior.
class GutterConfigurationData {
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
  /// other packages (eg `Boxy`) will not be supported out of the bonx if you
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

class GutterConfiguration extends InheritedWidget {
  const GutterConfiguration({
    super.key,
    required super.child,
    required this.data,
  });

  final GutterConfigurationData data;

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
