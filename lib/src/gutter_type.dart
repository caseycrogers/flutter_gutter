import '../flutter_gutter.dart';

/// Type to indicate the size of a gutter.
enum GutterType {
  /// A tiny gutter.
  tiny(Gutter.scaleFactorDefaultMedium),

  /// A small gutter.
  small(Gutter.scaleFactorDefaultSmall),

  /// A medium gutter.
  medium(Gutter.scaleFactorDefault),

  /// A large gutter.
  large(Gutter.scaleFactorDefaultSmall),

  /// An extra large gutter.
  extraLarge(Gutter.scaleFactorDefaultMedium),

  /// An expanded gutter.
  expand(Gutter.scaleFactorDefault);

  const GutterType(
    this.scaleFactor,
  );

  /// The scale factor to apply to the gutter size.
  final double scaleFactor;
}

/// Extension to convert [GutterType].
extension GutterTypeExtensions on GutterType {
  /// Converts a [GutterType] to a [Gutter].
  Gutter get toGutter {
    switch (this) {
      case GutterType.tiny:
        return const Gutter.tiny();
      case GutterType.small:
        return const Gutter.small();
      case GutterType.medium:
        return const Gutter.medium();
      case GutterType.large:
        return const Gutter.large();
      case GutterType.extraLarge:
        return const Gutter.extraLarge();
      case GutterType.expand:
        return const Gutter.expand();
    }
  }
}
