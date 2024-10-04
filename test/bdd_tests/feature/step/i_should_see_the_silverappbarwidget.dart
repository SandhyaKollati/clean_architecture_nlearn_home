import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/sliver_app_bar_widget.dart';

/// Usage: I should see the silverAppBarWidget
Future<void> iShouldSeeTheSilverappbarwidget(WidgetTester tester) async {
  expect(find.byType(SliverAppBarWidget), findsOneWidget);
}
