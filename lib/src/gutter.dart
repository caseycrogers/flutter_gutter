import 'package:flutter/material.dart';

import 'package:flutter_gutter/flutter_gutter.dart';

/// A gap twice the standard gutter size according to Material Design's
/// breakpoints system.
class GutterLarge extends StatelessWidget {
  const GutterLarge({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.gutterLarge);
}

/// A gap of the standard gutter size according to Material Design's breakpoints
/// system.
class Gutter extends StatelessWidget {
  const Gutter({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.gutter);
}

/// A gap half the standard gutter size according to Material Design's
/// breakpoints system
class GutterSmall extends StatelessWidget {
  const GutterSmall({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.gutterSmall);
}

/// A gap a quarter the standard gutter size according to Material Design's
/// breakpoints system
class GutterTiny extends StatelessWidget {
  const GutterTiny({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.gutterTiny);
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
  const GutterConfigurationData(this.widgetToAxis);

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
  final Axis? Function(Widget widget) widgetToAxis;

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
