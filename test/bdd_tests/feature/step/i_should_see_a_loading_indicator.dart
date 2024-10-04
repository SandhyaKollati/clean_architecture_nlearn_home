import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeALoadingIndicator(WidgetTester tester) async {
  final loadingFinder = find.byType(CircularProgressIndicator);
  expect(loadingFinder, findsOneWidget);
}
