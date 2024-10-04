import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_narayana_logo_widget.dart';

void main() {
  testWidgets('HomeNaryanaLogoWidget displays the SVG logo with semantics label', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HomeNaryanaLogoWidget(),
        ),
      ),
    );

    final svgFinder = find.byWidgetPredicate(
          (widget) =>
      widget is SvgPicture &&
          widget.semanticsLabel == "Narayana logo",
    );

    expect(svgFinder, findsOneWidget);
  });
}
