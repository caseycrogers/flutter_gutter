import 'package:flutter/widgets.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GutterConfiguration provides data to descendants',
      (WidgetTester tester) async {
    final GutterConfigurationData testData = GutterConfigurationData(
      widgetToAxis: (Widget widget) => widget is Text ? Axis.horizontal : null,
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: GutterConfiguration(
          data: testData,
          child: Builder(
            builder: (BuildContext context) {
              final GutterConfigurationData? data =
                  GutterConfiguration.maybeOf(context);
              return Text(data == testData ? 'Found' : 'Not found');
            },
          ),
        ),
      ),
    );

    final Finder textFinder = find.text('Found');
    expect(textFinder, findsOneWidget);
  });

  testWidgets('GutterConfiguration does not provide data to non-descendants',
      (WidgetTester tester) async {
    final GutterConfigurationData testData = GutterConfigurationData(
      widgetToAxis: (Widget widget) => widget is Text ? Axis.horizontal : null,
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: <Widget>[
            GutterConfiguration(
              data: testData,
              child: Container(),
            ),
            Builder(
              builder: (BuildContext context) {
                final GutterConfigurationData? data =
                    GutterConfiguration.maybeOf(context);
                return Text(data == null ? 'Not found' : 'Found');
              },
            ),
          ],
        ),
      ),
    );

    final Finder textFinder = find.text('Not found');
    expect(textFinder, findsOneWidget);
  });

  testWidgets('GutterConfiguration updates data when widget changes',
      (WidgetTester tester) async {
    final GutterConfigurationData testData1 = GutterConfigurationData(
      widgetToAxis: (Widget widget) => widget is Text ? Axis.horizontal : null,
    );
    final GutterConfigurationData testData2 = GutterConfigurationData(
      widgetToAxis: (Widget widget) => widget is Text ? Axis.vertical : null,
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: GutterConfiguration(
          data: testData1,
          child: Builder(
            builder: (BuildContext context) {
              final GutterConfigurationData? data =
                  GutterConfiguration.maybeOf(context);
              return Text(data == testData1 ? 'First' : 'Second');
            },
          ),
        ),
      ),
    );

    final Finder textFinderFirst = find.text('First');
    expect(textFinderFirst, findsOneWidget);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: GutterConfiguration(
          data: testData2,
          child: Builder(
            builder: (BuildContext context) {
              final GutterConfigurationData? data =
                  GutterConfiguration.maybeOf(context);
              return Text(data == testData2 ? 'Second' : 'First');
            },
          ),
        ),
      ),
    );

    final Finder textFinderSecond = find.text('Second');
    expect(textFinderSecond, findsOneWidget);
  });

  testWidgets('GutterConfiguration respects dynamicAxisCheck',
      (WidgetTester tester) async {
    final GutterConfigurationData testData = GutterConfigurationData(
      widgetToAxis: (Widget widget) => widget is Text ? Axis.horizontal : null,
      dynamicAxisCheck: false,
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: GutterConfiguration(
          data: testData,
          child: Builder(
            builder: (BuildContext context) {
              final GutterConfigurationData? data =
                  GutterConfiguration.maybeOf(context);
              return Text(data?.dynamicAxisCheck == false
                  ? 'Dynamic Check Off'
                  : 'Dynamic Check On');
            },
          ),
        ),
      ),
    );

    final Finder textFinder = find.text('Dynamic Check Off');
    expect(textFinder, findsOneWidget);
  });
}
