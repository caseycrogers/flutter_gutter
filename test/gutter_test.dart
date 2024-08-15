import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Breakpoints
  const Size smallSize = Size(599, 800); // Breakpoints.small
  const Size mediumSize = Size(700, 1000); // Breakpoints.medium
  const Size mediumLargeSize = Size(900, 1200); // Breakpoints.mediumLarge
  const Size largeSize = Size(1300, 1500); // Breakpoints.large
  const Size extraLargeSize = Size(1700, 2000); // Breakpoints.extraLarge

  // Helper function to reduce redundancy
  Future<void> testSize(
    WidgetTester tester,
    Size size,
    Gutter gutter,
    double expectedSize, {
    required Widget Function(Widget gutter) layoutBuilder,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData.fromView(tester.view).copyWith(size: size),
          child: Scaffold(
            body: layoutBuilder(gutter),
          ),
        ),
      ),
    );

    // Extract orientation from the widget tree
    final AxisAwareOrientation axisAwareOrientation = find
        .byType(AxisAwareOrientation)
        .evaluate()
        .first
        .widget as AxisAwareOrientation;

    final Orientation? orientation = axisAwareOrientation
        .findOrientation(tester.element(find.byType(AxisAwareOrientation)));

    final Size gutterSize = tester.getSize(find.byWidget(gutter));
    if (orientation == Orientation.portrait) {
      expect(gutterSize.height, expectedSize);
    } else if (orientation == Orientation.landscape) {
      expect(gutterSize.width, expectedSize);
    }
  }

  group('Tests on Small Size Screens', () {
    // Gutter.tiny
    testWidgets(
        'should apply correct gap size for tiny gutter on small screens',
        (WidgetTester tester) async {
      await testSize(tester, smallSize, const GutterTiny(), .25 * 16,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, smallSize, const Gutter.tiny(), .25 * 16,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.small
    testWidgets(
        'should apply correct gap size for small gutter on small screens',
        (WidgetTester tester) async {
      await testSize(tester, smallSize, const GutterSmall(), .5 * 16,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, smallSize, const Gutter.small(), .5 * 16,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.medium
    testWidgets(
        'should apply correct gap size for medium gutter on small screens',
        (WidgetTester tester) async {
      await testSize(tester, smallSize, const GutterMedium(), 16,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, smallSize, const Gutter.medium(), 16,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.large
    testWidgets(
        'should apply correct gap size for large gutter on small screens',
        (WidgetTester tester) async {
      await testSize(tester, smallSize, const GutterLarge(), 2 * 16,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, smallSize, const Gutter.large(), 2 * 16,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.extraLarge
    testWidgets(
        'should apply correct gap size for extraLarge gutter on small screens',
        (WidgetTester tester) async {
      await testSize(tester, smallSize, const GutterExtraLarge(), 4 * 16,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, smallSize, const Gutter.extraLarge(), 4 * 16,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });
  });

  group('Tests on Medium Size Screens', () {
    // Gutter.tiny
    testWidgets(
        'should apply correct gap size for tiny gutter on medium screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumSize, const GutterTiny(), .25 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumSize, const Gutter.tiny(), .25 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.small
    testWidgets(
        'should apply correct gap size for small gutter on medium screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumSize, const GutterSmall(), .5 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumSize, const Gutter.small(), .5 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.medium
    testWidgets(
        'should apply correct gap size for medium gutter on medium screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumSize, const GutterMedium(), 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumSize, const Gutter.medium(), 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.large
    testWidgets(
        'should apply correct gap size for large gutter on medium screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumSize, const GutterLarge(), 2 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumSize, const Gutter.large(), 2 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.extraLarge
    testWidgets(
        'should apply correct gap size for extraLarge gutter on medium screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumSize, const GutterExtraLarge(), 4 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumSize, const Gutter.extraLarge(), 4 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });
  });

  group('Tests on MediumLarge Size Screens', () {
    // Gutter.tiny
    testWidgets(
        'should apply correct gap size for tiny gutter on mediumLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumLargeSize, const GutterTiny(), .25 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumLargeSize, const Gutter.tiny(), .25 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.small
    testWidgets(
        'should apply correct gap size for small gutter on mediumLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumLargeSize, const GutterSmall(), .5 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumLargeSize, const Gutter.small(), .5 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.medium
    testWidgets(
        'should apply correct gap size for medium gutter on mediumLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumLargeSize, const GutterMedium(), 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumLargeSize, const Gutter.medium(), 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.large
    testWidgets(
        'should apply correct gap size for large gutter on mediumLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumLargeSize, const GutterLarge(), 2 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumLargeSize, const Gutter.large(), 2 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.extraLarge
    testWidgets(
        'should apply correct gap size for extraLarge gutter on mediumLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, mediumLargeSize, const GutterExtraLarge(), 4 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, mediumLargeSize, const Gutter.extraLarge(), 4 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });
  });

  group('Tests on Large Size Screens', () {
    // Gutter.tiny
    testWidgets(
        'should apply correct gap size for tiny gutter on large screens',
        (WidgetTester tester) async {
      await testSize(tester, largeSize, const GutterTiny(), .25 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, largeSize, const Gutter.tiny(), .25 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.small
    testWidgets(
        'should apply correct gap size for small gutter on large screens',
        (WidgetTester tester) async {
      await testSize(tester, largeSize, const GutterSmall(), .5 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, largeSize, const Gutter.small(), .5 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.medium
    testWidgets(
        'should apply correct gap size for medium gutter on large screens',
        (WidgetTester tester) async {
      await testSize(tester, largeSize, const GutterMedium(), 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, largeSize, const Gutter.medium(), 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.large
    testWidgets(
        'should apply correct gap size for large gutter on large screens',
        (WidgetTester tester) async {
      await testSize(tester, largeSize, const GutterLarge(), 2 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, largeSize, const Gutter.large(), 2 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.extraLarge
    testWidgets(
        'should apply correct gap size for extraLarge gutter on large screens',
        (WidgetTester tester) async {
      await testSize(tester, largeSize, const GutterExtraLarge(), 4 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, largeSize, const Gutter.extraLarge(), 4 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });
  });

  group('Tests on ExtraLarge Size Screens', () {
    // Gutter.tiny
    testWidgets(
        'should apply correct gap size for tiny gutter on extraLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, extraLargeSize, const GutterTiny(), .25 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, extraLargeSize, const Gutter.tiny(), .25 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.small
    testWidgets(
        'should apply correct gap size for small gutter on extraLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, extraLargeSize, const GutterSmall(), .5 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, extraLargeSize, const Gutter.small(), .5 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.medium
    testWidgets(
        'should apply correct gap size for medium gutter on extraLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, extraLargeSize, const GutterMedium(), 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, extraLargeSize, const Gutter.medium(), 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.large
    testWidgets(
        'should apply correct gap size for large gutter on extraLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, extraLargeSize, const GutterLarge(), 2 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, extraLargeSize, const Gutter.large(), 2 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });

    // Gutter.extraLarge
    testWidgets(
        'should apply correct gap size for extraLarge gutter on extraLarge screens',
        (WidgetTester tester) async {
      await testSize(tester, extraLargeSize, const GutterExtraLarge(), 4 * 24,
          layoutBuilder: (Widget gutter) => Column(children: <Widget>[gutter]));
      await testSize(tester, extraLargeSize, const Gutter.extraLarge(), 4 * 24,
          layoutBuilder: (Widget gutter) => Row(children: <Widget>[gutter]));
    });
  });

  // Tests with additional widgets
  group('Tests with additional widgets', () {
    // Testing with Flex
    testWidgets(
        'should apply correct gap size for tiny gutter within a Flex widget',
        (WidgetTester tester) async {
      await testSize(
        tester,
        largeSize,
        const GutterTiny(),
        .25 * 24,
        layoutBuilder: (Widget gutter) =>
            Flex(direction: Axis.vertical, children: <Widget>[gutter]),
      );
    });

    // Testing with Wrap
    testWidgets(
        'should apply correct gap size for tiny gutter within a Wrap widget',
        (WidgetTester tester) async {
      await testSize(
        tester,
        mediumLargeSize,
        const GutterTiny(),
        .25 * 24,
        layoutBuilder: (Widget gutter) => Wrap(children: <Widget>[gutter]),
      );
    });

    // Testing with ListView
    testWidgets(
        'should apply correct gap size for tiny gutter within a ListView widget',
        (WidgetTester tester) async {
      await testSize(
        tester,
        smallSize,
        const GutterTiny(),
        .25 * 16,
        layoutBuilder: (Widget gutter) => ListView(children: <Widget>[gutter]),
      );
    });
  });
}
