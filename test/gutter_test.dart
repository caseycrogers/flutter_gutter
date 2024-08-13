import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Breakpoints
  const Size smallSize = Size(599, 800); // Breakpoints.small
  const Size mediumSize = Size(600, 800); // Breakpoints.medium
  const Size largeSize = Size(840, 1000); // Breakpoints.large

  // Helper function to reduce redundancy
  Future<void> testHeight(
    WidgetTester tester,
    Size size,
    Widget gutter,
    double expectedSize,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: size),
          child: Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[gutter],
            ),
          ),
        ),
      ),
    );

    final Size gutterSize = tester.getSize(find.byWidget(gutter));
    expect(gutterSize.height, expectedSize);
  }

  // Tests for Gutter.tiny
  testWidgets('should apply correct gap size for tiny gutter on small screens',
      (WidgetTester tester) async {
    await testHeight(tester, smallSize, Gutter.tiny(), .25 * 16);
  });

  testWidgets('should apply correct gap size for tiny gutter on medium screens',
      (WidgetTester tester) async {
    await testHeight(tester, mediumSize, Gutter.tiny(), .25 * 24);
  });

  testWidgets('should apply correct gap size for tiny gutter on large screens',
      (WidgetTester tester) async {
    await testHeight(tester, largeSize, Gutter.tiny(), .25 * 24);
  });

  // Tests for Gutter.small
  testWidgets('should apply correct gap size for small gutter on small screens',
      (WidgetTester tester) async {
    await testHeight(tester, smallSize, Gutter.small(), .5 * 16);
  });

  testWidgets(
      'should apply correct gap size for small gutter on medium screens',
      (WidgetTester tester) async {
    await testHeight(tester, mediumSize, Gutter.small(), .5 * 24);
  });

  testWidgets('should apply correct gap size for small gutter on large screens',
      (WidgetTester tester) async {
    await testHeight(tester, largeSize, Gutter.small(), .5 * 24);
  });

  // Tests for Gutter.medium
  testWidgets(
      'should apply correct gap size for medium gutter on small screens',
      (WidgetTester tester) async {
    await testHeight(tester, smallSize, Gutter.medium(), 16);
  });

  testWidgets(
      'should apply correct gap size for medium gutter on medium screens',
      (WidgetTester tester) async {
    await testHeight(tester, mediumSize, Gutter.medium(), 24);
  });

  testWidgets(
      'should apply correct gap size for medium gutter on large screens',
      (WidgetTester tester) async {
    await testHeight(tester, largeSize, Gutter.medium(), 24);
  });

  // Tests for Gutter.large
  testWidgets('should apply correct gap size for large gutter on small screens',
      (WidgetTester tester) async {
    await testHeight(tester, smallSize, Gutter.large(), 2 * 16);
  });

  testWidgets(
      'should apply correct gap size for large gutter on medium screens',
      (WidgetTester tester) async {
    await testHeight(tester, mediumSize, Gutter.large(), 2 * 24);
  });

  testWidgets('should apply correct gap size for large gutter on large screens',
      (WidgetTester tester) async {
    await testHeight(tester, largeSize, Gutter.large(), 2 * 24);
  });

  // Tests for Gutter.extraLarge
  testWidgets(
      'should apply correct gap size for extraLarge gutter on small screens',
      (WidgetTester tester) async {
    await testHeight(tester, smallSize, Gutter.extraLarge(), 4 * 16);
  });

  testWidgets(
      'should apply correct gap size for extraLarge gutter on medium screens',
      (WidgetTester tester) async {
    await testHeight(tester, mediumSize, Gutter.extraLarge(), 4 * 24);
  });

  testWidgets(
      'should apply correct gap size for extraLarge gutter on large screens',
      (WidgetTester tester) async {
    await testHeight(tester, largeSize, Gutter.extraLarge(), 4 * 24);
  });

  // Tests with custom size and scaleFactor
  testWidgets(
      'should apply correct custom size for tiny gutter on small screens',
      (WidgetTester tester) async {
    await testHeight(
      tester,
      smallSize,
      Gutter.tiny(scaleFactor: 2),
      2 * .25 * 16,
    );
  });

  testWidgets(
      'should apply correct custom size for small gutter on medium screens',
      (WidgetTester tester) async {
    await testHeight(
        tester, mediumSize, Gutter.small(scaleFactor: 1.5), 1.5 * .5 * 24);
  });

  testWidgets(
      'should apply correct custom size for medium gutter on large screens',
      (WidgetTester tester) async {
    await testHeight(tester, largeSize, Gutter.medium(scaleFactor: 3), 3 * 24);
  });
}
