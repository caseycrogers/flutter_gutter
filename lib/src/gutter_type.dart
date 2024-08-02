import '../flutter_gutter.dart';

/// Type to indicate the size of a gutter.
enum GutterType {
  /// A tiny gutter.
  tiny,

  /// A small gutter.
  small,

  /// A medium gutter.
  medium,

  /// A large gutter.
  large,

  /// An extra large gutter.
  extraLarge,

  /// An expanded gutter.
  expand,
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
        return const Gutter(size: double.infinity);
    }
  }
}
