import 'package:flutter/widgets.dart';

import '../flutter_gutter.dart';

/// A widget that insets its child by the material padding or the given padding.
class GutterPadding extends Gutter {
  /// Creates a new [GutterPadding] widget with custom padding.
  const GutterPadding({
    super.key,
    this.child,
    super.size,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  })  : left = null,
        top = null,
        right = null,
        bottom = null;

  /// Creates a new [GutterPadding] widget with specific edge insets.
  const GutterPadding.only({
    super.key,
    this.child,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  });

  /// Creates a new [GutterPadding] widget with symmetric padding.
  const GutterPadding.symmetric({
    super.key,
    this.child,
    double? vertical = 0,
    double? horizontal = 0,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  /// Creates a new [GutterPadding] widget with uniform padding.
  const GutterPadding.all({
    super.key,
    double? padding,
    this.child,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  })  : left = padding,
        top = padding,
        right = padding,
        bottom = padding;

  /// The child widget.
  final Widget? child;

  /// The offset from the left.
  final double? left;

  /// The offset from the right.
  final double? right;

  /// The offset from the top.
  final double? top;

  /// The offset from the bottom.
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    final double gapSize =
        Gutter.calculateGapSize(context, size, type, scaleFactor);

    return Padding(
      padding: EdgeInsets.only(
        left: left ?? gapSize,
        top: top ?? gapSize,
        right: right ?? gapSize,
        bottom: bottom ?? gapSize,
      ),
      child: child,
    );
  }
}
