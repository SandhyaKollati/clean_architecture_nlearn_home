import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_continue_from_widget.dart';

/// Usage: I should see the "Continue From Where You Left" section
Future<void> iShouldSeeTheContinueFromWhereYouLeftSection(
    WidgetTester tester) async {
  expect(find.byType(HomeContinueFrom), findsOneWidget);
}
