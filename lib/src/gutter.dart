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
    this.type = GutterType.medium,
    this.scaleFactor = 1,
  }) : size = null;

  /// The spacing used on small screens according to Material Design's
  /// See: https://m3.material.io/foundations/layout/applying-layout/compact
  static const double materialSpacingSmall = 16;

  /// The spacing used on medium and large screens according to Material Design's
  /// See: https://m3.material.io/foundations/layout/applying-layout/medium
  static const double materialSpacingMediumAndUp = 24;

  /// The default scale factor for a gutter.
  static const double scaleFactorDefault = 1;

  /// The default scale factor for a small increase.
  static const double scaleFactorDefaultSmall = 2;

  /// The default scale factor for a medium increase.
  static const double scaleFactorDefaultMedium = 4;

  /// The type of gutter to create.
  final GutterType type;

  /// The size of the [Gutter].
  final double? size;

  /// The scale factor to apply to the gutter size.
  final double scaleFactor;

  /// Creates a new [Gutter] widget from a size and scaleFactor.
  const Gutter.from({super.key, this.size, this.scaleFactor = 1})
      : type = GutterType.medium;

  /// Creates a new [Gutter] widget with a tiny size.
  const Gutter.tiny({super.key, this.scaleFactor = 1})
      : type = GutterType.tiny,
        size = null;

  /// Creates a new [Gutter] widget with a small size.
  const Gutter.small({super.key, this.scaleFactor = 1})
      : type = GutterType.small,
        size = null;

  /// Creates a new [Gutter] widget with a medium size.
  const Gutter.medium({super.key, this.scaleFactor = 1})
      : type = GutterType.medium,
        size = null;

  /// Creates a new [Gutter] widget with a large size.
  const Gutter.large({super.key, this.scaleFactor = 1})
      : type = GutterType.large,
        size = null;

  /// Creates a new [Gutter] widget with an extra large size.
  const Gutter.extraLarge({super.key, this.scaleFactor = 1})
      : type = GutterType.extraLarge,
        size = null;

  /// Creates a new [Gutter] widget with an expand size.
  const Gutter.expand({super.key, this.scaleFactor = 1})
      : type = GutterType.expand,
        size = null;

  @override
  Widget build(BuildContext context) {
    return AxisAwareOrientation(
      key: key,
      builder: (BuildContext context, Orientation orientation) {
        final double gutterSize = context.gutterSize(
          type: type,
          size: size,
          scaleFactor: scaleFactor,
        );

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
