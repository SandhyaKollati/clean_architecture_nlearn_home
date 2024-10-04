import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_banners_widget.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: Scaffold(body: HomeBannersWidget()),
    );
  }

  group('home banner widget Tests', () {
    testWidgets('HomeBannersWidget renders PageView and dots',
            (WidgetTester tester) async {
          await tester.pumpWidget(createWidgetUnderTest());

          expect(find.byType(PageView), findsOneWidget);
          expect(find.byType(AnimatedContainer), findsNWidgets(9));
        });

    testWidgets('HomeBannersWidget displays first dot as active initially',
            (WidgetTester tester) async {
          await tester.pumpWidget(createWidgetUnderTest());
          final firstDotSize = tester.getSize(find.byType(AnimatedContainer).at(0));
          final secondDotSize =
          tester.getSize(find.byType(AnimatedContainer).at(1));

          expect(firstDotSize.width, greaterThan(secondDotSize.width));
        });

    testWidgets('HomeBannersWidget auto-plays to the next banner',
            (WidgetTester tester) async {
          await tester.pumpWidget(createWidgetUnderTest());
          await tester.pump(const Duration(seconds: 3));
          await tester.pumpAndSettle();

          final firstDotSize = tester.getSize(find.byType(AnimatedContainer).at(0));
          final secondDotSize =
          tester.getSize(find.byType(AnimatedContainer).at(1));

          expect(firstDotSize.width, lessThan(secondDotSize.width));
        });
  });
}
