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
    this.left,
    this.top,
    this.right,
    this.bottom,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  });

  /// Creates a new [GutterPadding] widget with symmetric padding.
  const GutterPadding.symmetric({
    super.key,
    this.child,
    Gutter? vertical,
    Gutter? horizontal,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  /// Creates a new [GutterPadding] widget with uniform padding.
  const GutterPadding.all({
    super.key,
    Gutter? value,
    this.child,
    super.type = GutterType.medium,
    super.scaleFactor = 1,
  })  : left = value,
        top = value,
        right = value,
        bottom = value;

  /// The child widget.
  final Widget? child;

  /// The offset from the left.
  final Gutter? left;

  /// The offset from the right.
  final Gutter? right;

  /// The offset from the top.
  final Gutter? top;

  /// The offset from the bottom.
  final Gutter? bottom;

  @override
  Widget build(BuildContext context) {
    final double gapSize =
        Gutter.calculateGapSize(context, size, type, scaleFactor);

    return Padding(
      padding: EdgeInsets.only(
        left: left != null
            ? Gutter.calculateGapSize(
                context, left!.size, left!.type, left!.scaleFactor)
            : gapSize,
        top: top != null
            ? Gutter.calculateGapSize(
                context, top!.size, top!.type, top!.scaleFactor)
            : gapSize,
        right: right != null
            ? Gutter.calculateGapSize(
                context, right!.size, right!.type, right!.scaleFactor)
            : gapSize,
        bottom: bottom != null
            ? Gutter.calculateGapSize(
                context, bottom!.size, bottom!.type, bottom!.scaleFactor)
            : gapSize,
      ),
      child: child,
    );
  }
}
