import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_banners_widget.dart';

/// Usage: I should see the static banners
Future<void> iShouldSeeTheStaticBanners(WidgetTester tester) async {
  expect(find.byType(HomeBannersWidget), findsOneWidget);
}
