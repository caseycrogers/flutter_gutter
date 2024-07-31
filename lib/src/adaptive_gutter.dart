import 'package:flutter/widgets.dart';

import '../flutter_gutter.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

/// A gutter that switches Gutter size based on the current breakpoint.
class AdaptiveGutter extends StatelessWidget {
  /// Creates a new [AdaptiveGutter] widget.
  const AdaptiveGutter({
    super.key,
    this.smallType = GutterType.small,
    this.mediumType = GutterType.medium,
    this.largeType = GutterType.large,
  });

  /// The type of gutter to create for small screens.
  final GutterType smallType;

  /// The type of gutter to create for medium screens.
  final GutterType mediumType;

  /// The type of gutter to create for large screens.
  final GutterType largeType;

  @override
  Widget build(BuildContext context) {
    return SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
      Breakpoints.small: SlotLayout.from(
        key: const Key('small'),
        builder: (_) => smallType.toGutter,
      ),
      Breakpoints.medium: SlotLayout.from(
        key: const Key('medium'),
        builder: (_) => mediumType.toGutter,
      ),
      Breakpoints.large: SlotLayout.from(
        key: const Key('large'),
        builder: (_) => largeType.toGutter,
      ),
    });
  }
}
