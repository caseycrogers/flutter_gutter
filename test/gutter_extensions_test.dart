import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GutterExtensions', () {
    testWidgets('gutterTiny returns correct size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              final double gutterTiny = context.gutterTiny;
              expect(gutterTiny,
                  equals(context.gutterSize(type: GutterType.tiny)));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('gutterSmall returns correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              final double gutterSmall = context.gutterSmall;
              expect(gutterSmall,
                  equals(context.gutterSize(type: GutterType.small)));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('gutterMedium returns correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              final double gutterMedium = context.gutterMedium;
              expect(gutterMedium,
                  equals(context.gutterSize(type: GutterType.medium)));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('gutterLarge returns correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              final double gutterLarge = context.gutterLarge;
              expect(gutterLarge,
                  equals(context.gutterSize(type: GutterType.large)));
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('gutterExtraLarge returns correct size',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              final double gutterExtraLarge = context.gutterExtraLarge;
              expect(gutterExtraLarge,
                  equals(context.gutterSize(type: GutterType.extraLarge)));
              return Container();
            },
          ),
        ),
      );
    });
  });

  group('SeparatedIterable', () {
    testWidgets('withGutter adds gutter between items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: <Widget>[
              ...<Widget>[
                const Text('Item 1'),
                const Text('Item 2'),
                const Text('Item 3')
              ].withGutter(
                gutter: const Gutter.medium(),
              ),
            ],
          ),
        ),
      );

      final Finder item1Finder = find.text('Item 1');
      final Finder item2Finder = find.text('Item 2');
      final Finder item3Finder = find.text('Item 3');

      expect(item1Finder, findsOneWidget);
      expect(item2Finder, findsOneWidget);
      expect(item3Finder, findsOneWidget);

      final Offset item1 = tester.getTopLeft(item1Finder);
      final Offset item2 = tester.getTopLeft(item2Finder);
      final Offset item3 = tester.getTopLeft(item3Finder);

      // Check that there is space (gutter) between the items
      expect(item2.dy, greaterThan(item1.dy));
      expect(item3.dy, greaterThan(item2.dy));
    });
  });
}
