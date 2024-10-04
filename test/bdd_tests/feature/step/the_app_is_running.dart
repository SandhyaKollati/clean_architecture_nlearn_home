import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/nlearn_v3_app/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
}
