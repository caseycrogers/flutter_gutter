import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Breakpoints
  const Size small = Size(599, 800); // Breakpoints.small
  const Size medium = Size(600, 800); // Breakpoints.medium
  const Size large = Size(840, 1000); // Breakpoints.large

  // Helper function to reduce redundancy
  Future<void> testGutterMargin(
      WidgetTester tester, Size size, GutterMargin gutterMargin) async {
    tester.view.physicalSize = size;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[gutterMargin],
        ),
      ),
    ));

    final Element context = tester.element(find.byType(MaterialApp));
    final GutterMargin gutterWidget =
        tester.widget<GutterMargin>(find.byType(GutterMargin));

    final double expectedSize = context.gutterSize(
      type: gutterWidget.type,
      size: gutterWidget.size,
      scaleFactor: gutterWidget.scaleFactor,
    );

    final Size gutterSize = tester.getSize(find.byType(GutterMargin));
    expect(gutterSize.height, expectedSize);
  }

  // Tests for GutterMargin
  testWidgets('should apply correct margin for GutterMargin on small screens',
      (WidgetTester tester) async {
    await testGutterMargin(
        tester, small, const GutterMargin(type: GutterType.small));
  });

  testWidgets('should apply correct margin for GutterMargin on medium screens',
      (WidgetTester tester) async {
    await testGutterMargin(
        tester, medium, const GutterMargin(type: GutterType.small));
  });

  testWidgets('should apply correct margin for GutterMargin on large screens',
      (WidgetTester tester) async {
    await testGutterMargin(
        tester, large, const GutterMargin(type: GutterType.small));
  });

  // Tests with custom size and scaleFactor
  testWidgets(
      'should apply correct custom margin for GutterMargin on small screens',
      (WidgetTester tester) async {
    await testGutterMargin(tester, small,
        const GutterMargin(type: GutterType.small, scaleFactor: 2));
  });

  testWidgets(
      'should apply correct custom margin for GutterMargin on medium screens',
      (WidgetTester tester) async {
    await testGutterMargin(tester, medium,
        const GutterMargin(type: GutterType.small, scaleFactor: 1.5));
  });

  testWidgets(
      'should apply correct custom margin for GutterMargin on large screens',
      (WidgetTester tester) async {
    await testGutterMargin(tester, large,
        const GutterMargin(type: GutterType.small, scaleFactor: 3));
  });

  testWidgets(
      'should apply correct margin for GutterMargin with specific size on medium screens',
      (WidgetTester tester) async {
    await testGutterMargin(tester, medium, const GutterMargin.from(size: 20));
  });

  testWidgets(
      'should apply correct margin for GutterMargin with specific size on medium screens',
      (WidgetTester tester) async {
    await testGutterMargin(
        tester, medium, const GutterMargin.from(size: 30, scaleFactor: 1.2));
  });

  testWidgets(
      'should apply correct margin for GutterMargin with specific size on large screens',
      (WidgetTester tester) async {
    await testGutterMargin(
        tester, large, const GutterMargin.from(size: 40, scaleFactor: 2));
  });

  testWidgets(
      'should apply correct margin for GutterMargin with specific size on small screens',
      (WidgetTester tester) async {
    await testGutterMargin(tester, small, const GutterMargin.from(size: 10));
  });
}
