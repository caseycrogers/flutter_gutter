import 'package:flutter/widgets.dart';

import '../flutter_gutter.dart';

/// A widget that insets its child by the material padding or the given padding.
class GutterPadding extends Gutter {
  /// Creates a new [GutterPadding] widget with custom padding.
  const GutterPadding({
    super.key,
    this.child,
    super.type = GutterType.medium,
    super.size,
    super.scaleFactor = 1,
  })  : left = null,
        top = null,
        right = null,
        bottom = null;

  /// Creates a new [GutterPadding] widget with specific edge insets.
  const GutterPadding.only({
    super.key,
    this.child,
    super.type = GutterType.medium,
    this.left,
    this.top,
    this.right,
    this.bottom,
    super.scaleFactor = 1,
  });

  /// Creates a new [GutterPadding] widget with symmetric padding.
  const GutterPadding.symmetric({
    super.key,
    this.child,
    super.type = GutterType.medium,
    Gutter? vertical,
    Gutter? horizontal,
    super.scaleFactor = 1,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  /// Creates a new [GutterPadding] widget with uniform padding.
  const GutterPadding.all({
    super.key,
    this.child,
    super.type = GutterType.medium,
    Gutter? value,
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
    final double gutterSize = context.gutterSize(
      type: type,
      size: size,
      scaleFactor: scaleFactor,
    );

    return Padding(
      padding: EdgeInsets.only(
        left: left != null
            ? context.gutterSize(
                type: left!.type,
                size: left!.size,
                scaleFactor: left!.scaleFactor)
            : gutterSize,
        top: top != null
            ? context.gutterSize(
                type: top!.type, size: top!.size, scaleFactor: top!.scaleFactor)
            : gutterSize,
        right: right != null
            ? context.gutterSize(
                type: right!.type,
                size: right!.size,
                scaleFactor: right!.scaleFactor)
            : gutterSize,
        bottom: bottom != null
            ? context.gutterSize(
                type: bottom!.type,
                size: bottom!.size,
                scaleFactor: bottom!.scaleFactor)
            : gutterSize,
      ),
      child: child,
    );
  }
}
