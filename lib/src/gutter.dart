import 'package:flutter/widgets.dart';

import 'gap.dart';
import 'gutter_extensions.dart';

/// A gap of the standard gutter size according to Material Design's breakpoints
/// system.
///
/// Creates a `SizedBox` with a height of size corresponding to the layout axis
/// of the first `Scrollable`, `Row` or `Column` above this widget.
///
/// Use alternate widgets ([GutterTiny], etc) or the alternate constructors
/// ([Gutter.gutterTiny], etc) to create spaces that are multiples of the base
/// gutter size.
///
/// The default spacing of a gutter, and the relative sizes of the smaller or
/// larger gutters, are set by [GutterConfigurationData]. See
/// [GutterConfiguration] if you'd like to override the spacing behavior.
class Gutter extends StatelessWidget {
  /// Creates a new [Gutter] widget.
  const Gutter({
    super.key,
    this.scaleFactor = 1,
  });

  /// Additional scale factor to apply to the gutter size.
  ///
  /// This is useful if you want to create a spacing that is some multiple of a
  /// base gutter:
  /// ```dart
  /// children: [
  ///   // A gutter that is 1.5x the typical size.
  ///   Gutter(scaleFactor: 1.5),
  /// ],
  /// ```
  final double scaleFactor;

  /// Creates a new [Gutter] widget with a tiny size.
  ///
  /// Equivalent to [GutterTiny].
  factory Gutter.tiny({Key? key, double scaleFactor = 1}) =>
      GutterTiny(key: key, scaleFactor: scaleFactor);

  /// Creates a new [Gutter] widget with a small size.
  ///
  /// Equivalent to [GutterSmall].
  factory Gutter.small({Key? key, double scaleFactor = 1}) =>
      GutterSmall(key: key, scaleFactor: scaleFactor);

  /// Creates a new [Gutter] widget with a medium size.
  ///
  /// This is equivalent to a [Gutter] as `medium` is the default gutter size.
  factory Gutter.medium({Key? key, double scaleFactor = 1}) =>
      Gutter(key: key, scaleFactor: scaleFactor);

  /// Creates a new [Gutter] widget with a large size.
  ///
  /// Equivalent to [GutterLarge].
  factory Gutter.large({Key? key, double scaleFactor = 1}) =>
      GutterLarge(key: key, scaleFactor: scaleFactor);

  /// Creates a new [Gutter] widget with an extra large size.
  ///
  /// Equivalent to [GutterExtraLarge].
  factory Gutter.extraLarge({Key? key, double scaleFactor = 1}) =>
      GutterExtraLarge(key: key, scaleFactor: scaleFactor);

  // Use a method to get the size so that sub-class can override the size logic.
  double _getSize(BuildContext context) => context.gutter;

  @override
  Widget build(BuildContext context) {
    return Gap(size: scaleFactor * _getSize(context));
  }
}

/// A gap a quarter the standard gutter size according to Material Design's
/// breakpoints system
class GutterTiny extends Gutter {
  /// Creates a new [GutterTiny] widget.
  const GutterTiny({super.key, super.scaleFactor});

  @override
  double _getSize(BuildContext context) => context.gutterTiny;
}

/// A gap half the standard gutter size according to Material Design's
/// breakpoints system
class GutterSmall extends Gutter {
  /// Creates a new [GutterSmall] widget.
  const GutterSmall({super.key, super.scaleFactor});

  @override
  double _getSize(BuildContext context) => context.gutterSmall;
}

/// A gap twice the standard gutter size according to Material Design's
/// breakpoints system.
class GutterLarge extends Gutter {
  /// Creates a new [GutterLarge] widget.
  const GutterLarge({super.key, super.scaleFactor});

  @override
  double _getSize(BuildContext context) => context.gutterLarge;
}

/// A gap four times the standard gutter size according to Material Design's
/// breakpoints system.
class GutterExtraLarge extends Gutter {
  /// Creates a new [GutterExtraLarge] widget.
  const GutterExtraLarge({super.key, super.scaleFactor});

  @override
  double _getSize(BuildContext context) => context.gutterExtraLarge;
}
