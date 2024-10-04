import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_strings.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_course_switch_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/sliver_app_bar_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;
  late ScrollController scrollController;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    scrollController = ScrollController();
    registerFallbackValue(NotificationIconClickedEvent());
    registerFallbackValue(MenuIconClickedEvent());
  });


  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<HomeBloc>.value(
          value: mockHomeBloc,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBarWidget(
                scrollController: scrollController,
                headerTitle: 'User',
                courseSwitchTitle: 'Courses',
              ),
              // Add more widgets if needed
            ],
          ),
        ),
      ),
    );
  }

  group('SliverAppBarWidget Tests', () {
    testWidgets('SliverAppBarWidget displays the correct initial title',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
      expect(find.text('Hi, User'), findsOneWidget);
      expect(find.text(AppStrings.homeHeaderName), findsNothing);
    });

    testWidgets('SliverAppBarWidget shows the correct title when scrolled',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      scrollController.jumpTo(260);
      await tester.pump();
      expect(find.text('Hi, User'), findsNothing);
      expect(find.text(AppStrings.homeHeaderName), findsOneWidget);
    });

    testWidgets('SliverAppBarWidget contains the correct IconButton widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(2));
    });

    testWidgets('SliverAppBarWidget showing background as Image initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is Container && widget.color == Colors.white),
          findsNothing);
    });

    testWidgets(
        'SliverAppBarWidget showing background as Container when scrolled',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      scrollController.jumpTo(260);
      await tester.pump();
      expect(find.byType(Image), findsNothing);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is Container && widget.color == Colors.white),
          findsOneWidget);
    });

    testWidgets(
        'SliverAppBarWidget contains correct number of HomeCourseSwitchWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(HomeCourseSwitchWidget), findsOneWidget);
    });

    testWidgets('SliverAppBarWidget triggers menu icon action', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final menuIconButton = find.byType(IconButton).first;
      await tester.tap(menuIconButton);
      await tester.pump();

      verify(() => mockHomeBloc.add(any<MenuIconClickedEvent>())).called(1);
    });

    testWidgets('SliverAppBarWidget triggers notification icon action', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final notificationIconButton = find.byType(IconButton).at(1);
      expect(notificationIconButton, findsOneWidget);

      await tester.tap(notificationIconButton);
      await tester.pump();

      verify(() => mockHomeBloc.add(any<NotificationIconClickedEvent>())).called(1);
    });
  });
}
