import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Breakpoints
  const Size small = Size(599, 800); // Breakpoints.small
  const Size medium = Size(600, 800); // Breakpoints.medium
  const Size large = Size(840, 1000); // Breakpoints.large

  // Helper function to reduce redundancy
  Future<void> testAdaptiveGutter(
    WidgetTester tester,
    Size size,
    Gutter small,
    Gutter medium,
    Gutter large,
  ) async {
    tester.view.physicalSize = size;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            AdaptiveGutter(
              small: small,
              medium: medium,
              large: large,
            ),
          ],
        ),
      ),
    ));

    final Element context = tester.element(find.byType(MaterialApp));
    final Gutter gutterWidget = tester.widget<Gutter>(find.byType(Gutter));

    final double expectedSize = context.gutterSize(
      type: gutterWidget.type,
      size: gutterWidget.size,
      scaleFactor: gutterWidget.scaleFactor,
    );

    final Size gutterSize = tester.getSize(find.byType(Gutter));
    expect(gutterSize.height, expectedSize);
  }

  // Tests for AdaptiveGutter with different configurations
  testWidgets('should apply custom Gutter.large for small screens',
      (WidgetTester tester) async {
    await testAdaptiveGutter(
      tester,
      small,
      const Gutter.large(),
      const Gutter.medium(),
      const Gutter.small(),
    );
  });

  testWidgets('should apply custom Gutter.small for medium screens',
      (WidgetTester tester) async {
    await testAdaptiveGutter(
      tester,
      medium,
      const Gutter.large(),
      const Gutter.small(),
      const Gutter.medium(),
    );
  });

  testWidgets('should apply custom Gutter.medium for large screens',
      (WidgetTester tester) async {
    await testAdaptiveGutter(
      tester,
      large,
      const Gutter.small(),
      const Gutter.large(),
      const Gutter.medium(),
    );
  });

  // Tests for Gutter.tiny and Gutter.extraLarge
  testWidgets('should apply custom Gutter.tiny for small screens',
      (WidgetTester tester) async {
    await testAdaptiveGutter(
      tester,
      small,
      const Gutter.tiny(),
      const Gutter.medium(),
      const Gutter.extraLarge(),
    );
  });

  testWidgets('should apply custom Gutter.extraLarge for medium screens',
      (WidgetTester tester) async {
    await testAdaptiveGutter(
      tester,
      medium,
      const Gutter.small(),
      const Gutter.extraLarge(),
      const Gutter.medium(),
    );
  });

  // Tests with custom size and scaleFactor
  testWidgets('should apply custom size for Gutter on small screens',
      (WidgetTester tester) async {
    await testAdaptiveGutter(
      tester,
      small,
      const Gutter.from(size: 10),
      const Gutter.medium(),
      const Gutter.large(),
    );
  });

  testWidgets('should apply custom scaleFactor for Gutter on medium screens',
      (WidgetTester tester) async {
    await testAdaptiveGutter(
      tester,
      medium,
      const Gutter.small(),
      const Gutter.medium(scaleFactor: 2),
      const Gutter.large(),
    );
  });

  testWidgets(
      'should apply custom size and scaleFactor for Gutter on large screens',
      (WidgetTester tester) async {
    await testAdaptiveGutter(
      tester,
      large,
      const Gutter.small(),
      const Gutter.medium(),
      const Gutter.from(size: 30, scaleFactor: 1.5),
    );
  });
}
