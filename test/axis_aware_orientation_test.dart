import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AxisAwareOrientation with Row widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Row(
          children: <Widget>[
            AxisAwareOrientation(
              builder: (BuildContext context, Orientation orientation) {
                return Text(
                  orientation == Orientation.landscape
                      ? 'Landscape'
                      : 'Portrait',
                );
              },
            ),
          ],
        ),
      ),
    );

    final Finder textFinder = find.text('Landscape');
    expect(textFinder, findsOneWidget);
  });

  testWidgets('AxisAwareOrientation with Column widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: <Widget>[
            AxisAwareOrientation(
              builder: (BuildContext context, Orientation orientation) {
                return Text(
                  orientation == Orientation.landscape
                      ? 'Landscape'
                      : 'Portrait',
                );
              },
            ),
          ],
        ),
      ),
    );

    final Finder textFinder = find.text('Portrait');
    expect(textFinder, findsOneWidget);
  });

  testWidgets('AxisAwareOrientation with horizontal Scrollable widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: AxisAwareOrientation(
            builder: (BuildContext context, Orientation orientation) {
              return Text(
                orientation == Orientation.landscape ? 'Landscape' : 'Portrait',
              );
            },
          ),
        ),
      ),
    );

    final Finder textFinder = find.text('Landscape');
    expect(textFinder, findsOneWidget);
  });

  testWidgets('AxisAwareOrientation with vertical Scrollable widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AxisAwareOrientation(
            builder: (BuildContext context, Orientation orientation) {
              return Text(
                orientation == Orientation.landscape ? 'Landscape' : 'Portrait',
              );
            },
          ),
        ),
      ),
    );

    final Finder textFinder = find.text('Portrait');
    expect(textFinder, findsOneWidget);
  });
}
