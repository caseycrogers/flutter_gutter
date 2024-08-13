import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Breakpoints
  const Size smallSize = Size(599, 800); // Breakpoints.small

  group('GutterExtensions', () {
    testWidgets('gutterTiny returns correct size', (WidgetTester tester) async {
      tester.view.physicalSize = smallSize;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              expect(context.gutterTiny, .25 * 16);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('gutterSmall returns correct size',
        (WidgetTester tester) async {
      tester.view.physicalSize = smallSize;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              expect(context.gutterSmall, .5 * 16);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('gutterMedium returns correct size',
        (WidgetTester tester) async {
      tester.view.physicalSize = smallSize;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              expect(context.gutter, 16);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('gutterLarge returns correct size',
        (WidgetTester tester) async {
      tester.view.physicalSize = smallSize;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              expect(context.gutterLarge, 2 * 16);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('gutterExtraLarge returns correct size',
        (WidgetTester tester) async {
      tester.view.physicalSize = smallSize;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              final double gutterExtraLarge = context.gutterExtraLarge;
              expect(gutterExtraLarge, 4 * 16);
              return Container();
            },
          ),
        ),
      );
    });
  });
}
