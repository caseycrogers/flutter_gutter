![](https://raw.githubusercontent.com/caseycrogers/flutter_gutter/main/dash_in_the_gutter.png)
Ensure all visual gaps between your widgets are consistent, adapted to the axis direction, and respond to screen size!

## Core Features

Provides a `Gutter` and `Margin` that correspond to Material
Design's [Responsive Layout system](https://m2.material.io/design/layout/responsive-layout-grid.html#columns-gutters-and-margins).

Gutters and margins:

1. Create a vertical gap in vertical layouts (`Column`, vertical `Scrollable`) and a horizontal gap in horizontal
   layouts (`Row`, horizontal `Scrollable`).
2. Size the gap according to the current screen size and Material Design's corresponding break point definition (small
   gap on small screens, larger gap on large screens)

`GutterSmall`, `GutterTiny` and `GutterLarge` all provide gaps that are factors of the base gutter size for situations
where larger or smaller gaps are more appropriate.

For more flexibility, you can also use the provided extension on `BuildContext` to reference the gutter and margin sizes
directly (`context.gutter`, `context.margin`) or create a `Gap` with a manually set size.

You can us `Gutter` with other packages using `GutterConfiguration` and `widgetToAxis` (see example).

## Example

Without `flutter_gutter`:
```dart
return Column(
  chilren: [
    const Text('I hate using sized box.'),
    SizedBox(height: 10),
    const Text('If only there were a better way...'),
  ],
);
```
You have to manually specify the height and provide a gap size yourself.

With `flutter_gutter`:
```dart
return Column(
  chilren: [
    const Text('I hate using sized box.'),
    Gutter(),
    const Text('And now I don\'t have to!'),
  ],
);
```

The `Gutter` widget identifies that it's in a vertical layout (`Column`) and automatically creates a vertical gap. It
also looks up the screen size and sizes the gap accordingly so you don't have to specify a size manually.

You can even use `Gutter` with widgets from other packages:
```dart
return GutterConfiguration(
  child: BoxyColumn(
    data: BoxyConfigurationData(
      widgetToAxis: (widget) {
        if (widget is BoxyFlex) {
          // Boxy widgets expose their axes via `BoxyFlex.direction`.
          return widget.direction;
        }
        return null;
      },
    ),
    chilren: [
      const Text('Boxy widgets aren\'t supported by `Gutter` ):.'),
      Gutter(),
      const Text('But with `GutterConfiguration` I can make Gutter work with any widget!'),
    ],
  ),
);
```
