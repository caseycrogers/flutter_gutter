import 'gutter.dart';

/// A gap of the standard margin size according to Material Design's breakpoints
/// system.
///
/// A margin is used on the edges of the screen whereas a gutter is used between
/// UI elements within the screen.
/// By default a [Margin] is the same size as a [Gutter]. Use
/// [GutterConfiguration] to set a custom relative size for margins.
class Margin extends Gutter {
  /// Creates a margin.
  const Margin({super.key, super.scaleFactor});
}
