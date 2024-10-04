// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:nlearn_v3_home/nlearn_v3_app/init_dependencies.dart';
import '../../tdd_tests/features/home/presentation/pages/home_list_screen_test.dart';
import './step/the_app_is_running.dart';
import './step/i_am_on_the_home_list_screen.dart';
import './step/the_home_screen_loads_successfully.dart';
import './step/i_should_see_the_silverappbarwidget.dart';
import './step/i_should_see_the_static_banners.dart';
import './step/i_should_see_the_continue_from_where_you_left_section.dart';
import './step/the_home_screen_is_loading.dart';
import './step/i_should_see_a_loading_indicator.dart';
import './step/the_home_screen_fails_to_load.dart';
import './step/i_should_see_an_error_message.dart';

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    setupLocator();
    mockHomeBloc = MockHomeBloc();
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('''Home List Screen''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
    }

    testWidgets('''Viewing sections on a successful load''', (tester) async {
      await bddSetUp(tester);
      await theHomeScreenLoadsSuccessfully(tester, mockHomeBloc);
      await iAmOnTheHomeListScreen(tester, mockHomeBloc);
      await tester.pumpAndSettle();
      await iShouldSeeTheSilverappbarwidget(tester);
      await iShouldSeeTheStaticBanners(tester);
      await iShouldSeeTheContinueFromWhereYouLeftSection(tester);
    });

    testWidgets('''Loading state''', (tester) async {
      await bddSetUp(tester);
      await theHomeScreenIsLoading(tester, mockHomeBloc);
      await iAmOnTheHomeListScreen(tester, mockHomeBloc);
      await tester.pump(const Duration(seconds: 4));
      await iShouldSeeALoadingIndicator(tester);
    });

    testWidgets('''Error state''', (tester) async {
      await bddSetUp(tester);
      await theHomeScreenFailsToLoad(tester, mockHomeBloc);
      await iAmOnTheHomeListScreen(tester, mockHomeBloc);
      await tester.pump(const Duration(seconds: 4));
      await iShouldSeeAnErrorMessage(tester);
    });

  });
}
