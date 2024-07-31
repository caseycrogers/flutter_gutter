import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../flutter_gutter.dart';

/// A gutter that switches Gutter size based on the current breakpoint.
class AdaptiveGutter extends StatelessWidget {
  /// Creates a new [AdaptiveGutter] widget.
  const AdaptiveGutter({
    super.key,
    this.small = const Gutter.small(),
    this.medium = const Gutter.medium(),
    this.large = const Gutter.medium(),
  });

  /// The type of gutter to create for small screens.
  final Gutter small;

  /// The type of gutter to create for medium screens.
  final Gutter medium;

  /// The type of gutter to create for large screens.
  final Gutter large;

  @override
  Widget build(BuildContext context) {
    return SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
      Breakpoints.small: SlotLayout.from(
        key: const Key('small'),
        builder: (_) => small,
      ),
      Breakpoints.medium: SlotLayout.from(
        key: const Key('medium'),
        builder: (_) => medium,
      ),
      Breakpoints.large: SlotLayout.from(
        key: const Key('large'),
        builder: (_) => large,
      ),
    });
  }
}
