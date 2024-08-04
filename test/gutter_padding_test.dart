import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Breakpoints
  const Size small = Size(599, 800); // Breakpoints.small
  const Size medium = Size(600, 800); // Breakpoints.medium
  const Size large = Size(840, 1000); // Breakpoints.large

  // Helper function to reduce redundancy
  Future<void> testGutterPadding(
      WidgetTester tester, Size size, GutterPadding gutterPadding) async {
    tester.view.physicalSize = size;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: gutterPadding,
      ),
    ));

    final Element context = tester.element(find.byType(MaterialApp));

    final double expectedPadding = context.gutterSize(
      type: gutterPadding.type,
      size: gutterPadding.size,
      scaleFactor: gutterPadding.scaleFactor,
    );

    final Padding paddingWidget = tester.widget<Padding>(find.byType(Padding));
    final EdgeInsets padding = paddingWidget.padding as EdgeInsets;

    if (gutterPadding.left != null) {
      expect(
          padding.left,
          context.gutterSize(
              type: gutterPadding.left!.type,
              size: gutterPadding.left!.size,
              scaleFactor: gutterPadding.left!.scaleFactor));
    } else {
      expect(padding.left, expectedPadding);
    }

    if (gutterPadding.top != null) {
      expect(
          padding.top,
          context.gutterSize(
              type: gutterPadding.top!.type,
              size: gutterPadding.top!.size,
              scaleFactor: gutterPadding.top!.scaleFactor));
    } else {
      expect(padding.top, expectedPadding);
    }

    if (gutterPadding.right != null) {
      expect(
          padding.right,
          context.gutterSize(
              type: gutterPadding.right!.type,
              size: gutterPadding.right!.size,
              scaleFactor: gutterPadding.right!.scaleFactor));
    } else {
      expect(padding.right, expectedPadding);
    }

    if (gutterPadding.bottom != null) {
      expect(
          padding.bottom,
          context.gutterSize(
              type: gutterPadding.bottom!.type,
              size: gutterPadding.bottom!.size,
              scaleFactor: gutterPadding.bottom!.scaleFactor));
    } else {
      expect(padding.bottom, expectedPadding);
    }
  }

  // Tests for GutterPadding.all
  testWidgets(
      'should apply correct padding for GutterPadding.all on small screens',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester, small, const GutterPadding.all(value: Gutter.small()));
  });

  testWidgets(
      'should apply correct padding for GutterPadding.all on medium screens',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester, medium, const GutterPadding.all(value: Gutter.small()));
  });

  testWidgets(
      'should apply correct padding for GutterPadding.all on large screens',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester, large, const GutterPadding.all(value: Gutter.small()));
  });

  // Tests for GutterPadding.only
  testWidgets(
      'should apply correct padding for GutterPadding.only on small screens',
      (WidgetTester tester) async {
    await testGutterPadding(tester, small,
        const GutterPadding.only(left: Gutter.small(), top: Gutter.medium()));
  });

  testWidgets(
      'should apply correct padding for GutterPadding.only on medium screens',
      (WidgetTester tester) async {
    await testGutterPadding(tester, medium,
        const GutterPadding.only(left: Gutter.small(), top: Gutter.medium()));
  });

  testWidgets(
      'should apply correct padding for GutterPadding.only on large screens',
      (WidgetTester tester) async {
    await testGutterPadding(tester, large,
        const GutterPadding.only(left: Gutter.small(), top: Gutter.medium()));
  });

  // Tests for GutterPadding.symmetric
  testWidgets(
      'should apply correct padding for GutterPadding.symmetric on small screens',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester,
        small,
        const GutterPadding.symmetric(
            horizontal: Gutter.small(), vertical: Gutter.medium()));
  });

  testWidgets(
      'should apply correct padding for GutterPadding.symmetric on medium screens',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester,
        medium,
        const GutterPadding.symmetric(
            horizontal: Gutter.small(), vertical: Gutter.medium()));
  });

  testWidgets(
      'should apply correct padding for GutterPadding.symmetric on large screens',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester,
        large,
        const GutterPadding.symmetric(
            horizontal: Gutter.small(), vertical: Gutter.medium()));
  });

  // Tests with custom size and scaleFactor
  testWidgets(
      'should apply correct custom padding for GutterPadding.all on small screens',
      (WidgetTester tester) async {
    await testGutterPadding(tester, small,
        const GutterPadding.all(value: Gutter.small(scaleFactor: 2)));
  });

  testWidgets(
      'should apply correct custom padding for GutterPadding.only on medium screens',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester,
        medium,
        const GutterPadding.only(
            left: Gutter.small(scaleFactor: 1.5),
            top: Gutter.medium(scaleFactor: 2)));
  });

  testWidgets(
      'should apply correct custom padding for GutterPadding.symmetric on large screens',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester,
        large,
        const GutterPadding.symmetric(
            horizontal: Gutter.small(scaleFactor: 1.2),
            vertical: Gutter.medium(scaleFactor: 1.8)));
  });

  // Tests for GutterPadding with child
  testWidgets(
      'should apply correct padding and render child widget for GutterPadding.all',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester,
        medium,
        const GutterPadding.all(
          value: Gutter.small(),
          child: Text('Gutter Padding Test'),
        ));

    expect(find.text('Gutter Padding Test'), findsOneWidget);
  });

  testWidgets(
      'should apply correct padding and render child widget for GutterPadding.only',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester,
        medium,
        const GutterPadding.only(
          left: Gutter.small(),
          top: Gutter.medium(),
          child: Text('Gutter Padding Test'),
        ));

    expect(find.text('Gutter Padding Test'), findsOneWidget);
  });

  testWidgets(
      'should apply correct padding and render child widget for GutterPadding.symmetric',
      (WidgetTester tester) async {
    await testGutterPadding(
        tester,
        medium,
        const GutterPadding.symmetric(
          horizontal: Gutter.small(),
          vertical: Gutter.medium(),
          child: Text('Gutter Padding Test'),
        ));

    expect(find.text('Gutter Padding Test'), findsOneWidget);
  });
}
