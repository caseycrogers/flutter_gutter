import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Breakpoints
  const Size small = Size(599, 800); // Breakpoints.small
  const Size medium = Size(600, 800); // Breakpoints.medium
  const Size large = Size(840, 1000); // Breakpoints.large

  // Helper function to reduce redundancy
  Future<void> testGutterSize(
      WidgetTester tester, Size size, Gutter gutter) async {
    tester.view.physicalSize = size;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[gutter],
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

    if (gutterWidget.type == GutterType.expand) {
      // Special handling for Gutter.expand
      final Size scaffoldSize = tester.getSize(find.byType(Scaffold));
      final Size gutterSize = tester.getSize(find.byType(Gutter));
      expect(gutterSize.height, scaffoldSize.height);
    } else {
      final Size gutterSize = tester.getSize(find.byType(Gutter));
      expect(gutterSize.height, expectedSize);
    }
  }

  // Tests for Gutter.tiny
  testWidgets('should apply correct gap size for tiny gutter on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter.tiny());
  });

  testWidgets('should apply correct gap size for tiny gutter on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, medium, const Gutter.tiny());
  });

  testWidgets('should apply correct gap size for tiny gutter on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter.tiny());
  });

  // Tests for Gutter.small
  testWidgets('should apply correct gap size for small gutter on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter.small());
  });

  testWidgets(
      'should apply correct gap size for small gutter on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, medium, const Gutter.small());
  });

  testWidgets('should apply correct gap size for small gutter on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter.small());
  });

  // Tests for Gutter.medium
  testWidgets(
      'should apply correct gap size for medium gutter on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter.medium());
  });

  testWidgets(
      'should apply correct gap size for medium gutter on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, medium, const Gutter.medium());
  });

  testWidgets(
      'should apply correct gap size for medium gutter on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter.medium());
  });

  // Tests for Gutter.large
  testWidgets('should apply correct gap size for large gutter on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter.large());
  });

  testWidgets(
      'should apply correct gap size for large gutter on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, medium, const Gutter.large());
  });

  testWidgets('should apply correct gap size for large gutter on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter.large());
  });

  // Tests for Gutter.extraLarge
  testWidgets(
      'should apply correct gap size for extraLarge gutter on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter.extraLarge());
  });

  testWidgets(
      'should apply correct gap size for extraLarge gutter on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, medium, const Gutter.extraLarge());
  });

  testWidgets(
      'should apply correct gap size for extraLarge gutter on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter.extraLarge());
  });

  // Tests for Gutter.expand
  testWidgets(
      'should apply correct gap size for expand gutter on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter.expand());
  });

  testWidgets(
      'should apply correct gap size for expand gutter on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, medium, const Gutter.expand());
  });

  testWidgets(
      'should apply correct gap size for expand gutter on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter.expand());
  });

  // Tests for Gutter.singleLine
  testWidgets(
      'should apply correct gap size for singleLine gutter on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter.singleLine());
  });

  testWidgets(
      'should apply correct gap size for singleLine gutter on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, medium, const Gutter.singleLine());
  });

  testWidgets(
      'should apply correct gap size for singleLine gutter on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter.singleLine());
  });

  // Tests with custom size and scaleFactor
  testWidgets(
      'should apply correct custom size for tiny gutter on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter.tiny(scaleFactor: 2));
  });

  testWidgets(
      'should apply correct custom size for small gutter on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, medium, const Gutter.small(scaleFactor: 1.5));
  });

  testWidgets(
      'should apply correct custom size for medium gutter on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter.medium(scaleFactor: 3));
  });

  testWidgets(
      'should apply correct custom size for gutter with size on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(
        tester, medium, const Gutter(size: 20, type: GutterType.extraLarge));
  });

  testWidgets(
      'should apply correct custom size for gutter with size on medium screens',
      (WidgetTester tester) async {
    await testGutterSize(
        tester, medium, const Gutter(size: 30, scaleFactor: 1.2));
  });

  testWidgets(
      'should apply correct custom size for expand gutter with size on large screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, large, const Gutter(size: 40, scaleFactor: 2));
  });

  testWidgets(
      'should apply correct custom size for gutter with size on small screens',
      (WidgetTester tester) async {
    await testGutterSize(tester, small, const Gutter(size: 10));
  });
}
