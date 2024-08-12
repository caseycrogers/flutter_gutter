import '../flutter_gutter.dart';

/// A gap of the standard margin size according to Material Design's breakpoints
/// system
class GutterMargin extends Gutter {
  /// Creates a new [GutterMargin] widget.
  const GutterMargin({super.key, super.type, super.scaleFactor});

  /// Creates a new [GutterMargin] widget with a specified size.
  const GutterMargin.from({super.key, super.size, super.scaleFactor})
      : super.from();
}
