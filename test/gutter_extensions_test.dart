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
}
