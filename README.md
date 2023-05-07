![](https://github.com/caseycrogers/flutter_gutter/blob/main/dash_in_the_gutter.png)
Ensure all visual gaps between you widgets are consistent, adapted to the axis direction, and respond to screen size!

## Core Features

Provides a `Gutter` and `Margin` that correspond to Material
Design's [Responsive Layout system](https://m2.material.io/design/layout/responsive-layout-grid.html#columns-gutters-and-margins)
.

These classes:

1. Are sized according to Material design's adaptive break points
2. Find their nearest `Scrollabe`, `Column` or `Row` ancestor and create a vertical gap for vertical ancestors,
   horizontal for horizontal ancestors

For more flexibility, you can also use an extension on `BuildContext` to reference the gutter and margin sizes
directly: `context.gutter`, `context.margin`.

`GutterSmall`, `GutterTiny` and `GutterLarge` all provide gaps that are factors of the base gutter size for situations
where larger or smaller gaps are more appropriate.

## Example

Without `flutter_gutter`
```dart
return Column(
  chilren: [
    const Text('I hate using sized box.'),
    // I have to manually specify that I want a vertically aligned gap.
    // And I have to manually set an arbitrary size for the gap.
    SizedBox(height: 10),
    const Text('If only there were a better way...'),
  ],
);
```

With `flutter_gutter`
```dart
return Column(
  chilren: [
    const Text('I hate using sized box.'),
    // Gutter identified that it's nearest relevant ancestor was a column, so it creates a vertical gap!
    // It expands and contracts according to Material Design's adaptive breakpoint definitions so it looks good on all screen sizes!
    Gutter(),
    const Text('And now I don\'t have to!'),
  ],
);
```
