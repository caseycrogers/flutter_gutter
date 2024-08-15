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
/// Use [Gap] or [Gutter.custom] to create a spacing with an arbitrary size.
///
/// The default spacing of a gutter, and the relative sizes of the smaller or
/// larger gutters, are set by [GutterConfigurationData]. See
/// [GutterConfiguration] if you'd like to override the spacing behavior.
class Gutter extends StatelessWidget {
  // A private constructor with private fields used to manage having both
  // alternate constructors and alternate widgets.
  const Gutter._(
    this._customSize,
    this._getSize, {
    super.key,
    required this.scaleFactor,
  })  : assert(
          _customSize == null || (_getSize == null && scaleFactor == null),
          'Custom size and get size cannot both be null.',
        ),
        assert(
          _customSize != null || (_getSize != null && scaleFactor != null),
          'You must specify either a custom size or get size.',
        );

  /// Creates a new [Gutter] widget.
  const Gutter({
    Key? key,
    double scaleFactor = 1,
  }) : this._(null, _sizeOf, key: key, scaleFactor: scaleFactor);

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
  final double? scaleFactor;

  final double? _customSize;

  // We use an instance variable for the size getter so that each alternate
  // constructor can have different sizes while still being const.
  final double Function(BuildContext context)? _getSize;

  /// Creates a new [Gutter] widget with a tiny size.
  ///
  /// Equivalent to [GutterTiny].
  const Gutter.tiny({Key? key, double scaleFactor = 1})
      : this._(null, GutterTiny._sizeOf, key: key, scaleFactor: scaleFactor);

  /// Creates a new [Gutter] widget with a small size.
  ///
  /// Equivalent to [GutterSmall].
  const Gutter.small({Key? key, double scaleFactor = 1})
      : this._(null, GutterSmall._sizeOf, key: key, scaleFactor: scaleFactor);

  /// Creates a new [Gutter] widget with a medium size.
  ///
  /// This is equivalent to a [Gutter] as `medium` is the default gutter size.
  const Gutter.medium({Key? key, double scaleFactor = 1})
      : this(key: key, scaleFactor: scaleFactor);

  /// Creates a new [Gutter] widget with a large size.
  ///
  /// Equivalent to [GutterLarge].
  const Gutter.large({Key? key, double scaleFactor = 1})
      : this._(null, GutterLarge._sizeOf, key: key, scaleFactor: scaleFactor);

  /// Creates a new [Gutter] widget with an extra large size.
  ///
  /// Equivalent to [GutterExtraLarge].
  const Gutter.extraLarge({Key? key, double scaleFactor = 1})
      : this._(
          null,
          GutterExtraLarge._sizeOf,
          key: key,
          scaleFactor: scaleFactor,
        );

  /// Creates a new [Gutter] widget with a custom size.
  ///
  /// Equivalent to [Gap].
  const Gutter.custom({Key? key, required double size})
      : this._(size, null, key: key, scaleFactor: null);

  static double _sizeOf(BuildContext context) => context.gutter;

  @override
  Widget build(BuildContext context) {
    // If custom size is non-null, it's safe to use `!` as the assert in the
    // private constructor ensures that they will be non-null.
    return Gap(size: _customSize ?? (scaleFactor! * _getSize!(context)));
  }
}

/// A gap a quarter the standard gutter size according to Material Design's
/// breakpoints system
class GutterTiny extends Gutter {
  /// Creates a new [GutterTiny] widget.
  const GutterTiny({super.key, super.scaleFactor = 1}) : super._(null, _sizeOf);

  static double _sizeOf(BuildContext context) => context.gutterTiny;
}

/// A gap half the standard gutter size according to Material Design's
/// breakpoints system
class GutterSmall extends Gutter {
  /// Creates a new [GutterSmall] widget.
  const GutterSmall({super.key, super.scaleFactor = 1})
      : super._(null, _sizeOf);

  static double _sizeOf(BuildContext context) => context.gutterSmall;
}

/// A gap the standard gutter size according to Material Design's breakpoints
/// system.
class GutterMedium extends Gutter {
  /// Creates a new [GutterMedium] widget.
  const GutterMedium({super.key, super.scaleFactor = 1});
}

/// A gap twice the standard gutter size according to Material Design's
/// breakpoints system.
class GutterLarge extends Gutter {
  /// Creates a new [GutterLarge] widget.
  const GutterLarge({super.key, super.scaleFactor = 1})
      : super._(null, _sizeOf);

  static double _sizeOf(BuildContext context) => context.gutterLarge;
}

/// A gap four times the standard gutter size according to Material Design's
/// breakpoints system.
class GutterExtraLarge extends Gutter {
  /// Creates a new [GutterExtraLarge] widget.
  const GutterExtraLarge({super.key, super.scaleFactor = 1})
      : super._(null, _sizeOf);

  static double _sizeOf(BuildContext context) => context.gutterExtraLarge;
}
