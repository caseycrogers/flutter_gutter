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
    double? vertical,
    double? horizontal,
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
    double? value,
    super.scaleFactor = 1,
  })  : left = value,
        top = value,
        right = value,
        bottom = value;

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
    final double gutterSize = context.gutterSize(
      type: type,
      size: size,
      scaleFactor: scaleFactor,
    );

    return Padding(
      padding: EdgeInsets.only(
        left: left ?? gutterSize,
        top: top ?? gutterSize,
        right: right ?? gutterSize,
        bottom: bottom ?? gutterSize,
      ),
      child: child,
    );
  }
}
