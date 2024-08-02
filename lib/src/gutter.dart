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

  /// The size of the [Gutter].
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
    return AxisAwareOrientation(
      key: key,
      builder: (BuildContext context, Orientation orientation) {
        final double gutterSize =
            calculateSize(context, size, type, scaleFactor);

        if (type == GutterType.expand) {
          return Expanded(
            child: SizedBox(
              width: orientation == Orientation.landscape ? gutterSize : null,
              height: orientation != Orientation.portrait ? null : gutterSize,
            ),
          );
        } else {
          return SizedBox(
            width: orientation == Orientation.landscape ? gutterSize : null,
            height: orientation != Orientation.portrait ? null : gutterSize,
          );
        }
      },
    );
  }

  /// calculates the gap size based on the size, type and scale factor.
  static double calculateSize(
      BuildContext context, double? size, GutterType type, double scaleFactor) {
    return size != null
        ? (size * scaleFactor)
        : context.gutter(type: type, scaleFactor: scaleFactor);
  }
}

/// A gap a quarter the standard gutter size according to Material Design's
/// breakpoints system
@Deprecated('Use Gutter.tiny instead')
class GutterTiny extends Gutter {
  /// Creates a new [GutterTiny] widget.
  const GutterTiny({super.key}) : super.tiny();
}

/// A gap half the standard gutter size according to Material Design's
/// breakpoints system
@Deprecated('Use Gutter.small instead')
class GutterSmall extends Gutter {
  /// Creates a new [GutterSmall] widget.
  const GutterSmall({super.key}) : super.small();
}

/// A gap twice the standard gutter size according to Material Design's
/// breakpoints system.
@Deprecated('Use Gutter.large instead')
class GutterLarge extends Gutter {
  /// Creates a new [GutterLarge] widget.
  const GutterLarge({super.key}) : super.large();
}
