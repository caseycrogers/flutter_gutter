# Flutter Gutter

![](https://raw.githubusercontent.com/caseycrogers/flutter_gutter/main/dash_in_the_gutter.png)
Ensure all visual gaps between your widgets are consistent, adapted to the axis direction, and
respond to screen size!

## Core Features

Provides a `Gutter` and `Margin` that correspond to Material Design's
[Responsive Layout system](https://m2.material.io/design/layout/responsive-layout-grid.html#columns-gutters-and-margins).

Gutters and margins:

1. Create a vertical gap in vertical layouts (`Column`, vertical `Scrollable`, etc) and a horizontal
   gap in horizontal layouts (`Row`, horizontal `Scrollable`, etc).
2. Size the gap according to the current screen size and Material Design's corresponding breakpoint
   definition (small gap on small screens, larger gap on large screens)

`Gutter.tiny`, `Gutter.small`, `Gutter.medium`, `Gutter.large` and `Gutter.extraLarge` all provide gaps that are factors of the base gutter
size for situations where larger or smaller gaps are more appropriate. `Gutter.expand` can be used to expand the Gutter on the crossAxis.
The default sizing is used on: `Gutter` or `Gutter.medium`.

For more flexibility, you can also use the provided extension on `BuildContext` to reference the
gutter and margin sizes directly (`context.gutter`, `context.margin`) or create a `Gap` with a
manually set size.

You can use `Gutter` with other packages using `GutterConfiguration` and `widgetToAxis` (see example).

You can use `AdaptiveGutter` to set a `Gutter` per screen size breakpoint.

On Iterable Widgets you can set a Gutter on every item:

```dart
<Widget>[
    const Text('Test1'),
    const Text('Test2'),
    const Text('Test3'),
  ].withGutter() // Optional parameter to set which Gutter size you want to use

```

## Supported Widgets

Flutter Gutter's widgets traverse up the widget tree until they find an ancestor that meets one of
the following conditions:

1. `GutterConfiguration.maybeOf(context).customWidgetToAxis(widget)` returns a non-null `Axis` (this
   is a custom function that lets you extend Flutter Gutter to support arbitrary widgets).
2. `widget` is a scrollable with a defined `axis`.
3. `widget` has an `Axis direction` attribute (for example, Flutter Gutter supports
   [Boxy](https://pub.dev/packages/boxy)'s widgets automatically).

Note that case 3 means that ANY widget with an axis is supported, however this is a dynamic check
which means that the Dart compiler will not be able to tree shake out any `axis` attributes on any
widget. This may increase your app's bundle size by a very small amount.

I have a [Github issue](https://github.com/flutter/flutter/issues/133394) against Flutter to add an
explicit axis scope to Flutter which would resolve this limitation. If you like using Flutter Gutter
and want to see it improved, please upvote the linked issue.

## Example

Without `flutter_gutter` you have to manually specify the axis direction (by using `height` or
`width`) and specify size of the gap yourself:

```dart
return Column(
  children: [
    const Text('I hate using sized box.'),
    SizedBox(height: 10),
    const Text('If only there were a better way...'),
  ],
);
```

With `flutter_gutter` the `Gutter` widget identifies that it's in a vertical layout (`Column`) and
automatically creates a vertical gap. It also looks up the screen size and sizes the gap accordingly
so you don't have to specify a gap size manually:

```dart
return Column(
  children: [
    const Text('I hate using sized box.'),
    Gutter(),
    const Text('And now I don\'t have to!'),
  ],
);
```

To use the material break point values directly, use the extension on `context`:

```dart
return Padding(
  padding: EdgeInsets.only(left: context.gutter, right: context.gutterSmall),
  child: Text('This is the margin size on this device: ${context.margin}'),
);
```

To use `Gutter` with custom widgets that don't expose an `axis` argument, use `GutterConfiguration`:

```dart
return GutterConfiguration(
  data: GutterConfigurationData(
    widgetToAxis: (widget) {
      if (widget is BoxyFlex) {
        // Boxy widgets expose their axes via `BoxyFlex.direction`.
        return widget.direction;
      }
      return null;
    },
  ),
  child: MyCustomColumn(
    children: [
      const Text('This widget wasn\'t supported by `Gutter` ).'),
      Gutter(),
      const Text('But with `GutterConfiguration` I can make Gutter work with any widget!'),
    ],
  ),
);
```

## Why not just use the existing [Gap package](https://pub.dev/packages/gap)?

Gap and Flutter Gutter are very similar, but Flutter Gutter does a few extra things Gap does not:

1. Auto sizes gap spacing according to the Material breakpoints system (see "Core Features" above).
2. Detects the axis of ANY widget that exposes an `Axis direction` attribute or getter (see
   "Supported Widgets" above).
3. Allows you to add support for arbitrary widgets using `GutterConfiguration` and `widgetToAxis`.

Personally, I especially appreciate feature 1 as it makes it easier for me to add spacing and
ensures that spacing and padding in different parts of my app are consistently sized. However, if
none of the above features are important to you, you'll likely prefer the Gap package!
