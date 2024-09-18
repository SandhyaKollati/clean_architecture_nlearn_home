import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/config/routes/routes.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_features_response.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/pages/home_list_screen.dart';
import 'package:nlearn_v3_home/features/home/presentation/pages/login_screen.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_subjects_response.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_banners_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_continue_from_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_disha_image_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_just_for_you_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_learn_subjects_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_narayana_logo_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_revise_now_card_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_schedule_test_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/sliver_app_bar_widget.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}
class MockNavigatorObserver extends Mock implements NavigatorObserver {}
class FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  late MockHomeBloc mockHomeBloc;
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    mockNavigatorObserver = MockNavigatorObserver();
  });

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<HomeBloc>.value(
      value: mockHomeBloc,
      child: MaterialApp(
        home: const Scaffold(body: HomeListScreen()),
        navigatorObservers: [mockNavigatorObserver],
        onGenerateRoute: (settings) {
          if (settings.name == AppRouter.login.name) {
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          }
          return null;
        },
      ),
    );
  }

  testWidgets('HomeListScreen displays CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state).thenReturn(HomeLoadingState());
    await tester.pumpWidget(createWidgetUnderTest());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('HomeListScreen shows error message on HomeLoadingFailureState',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state)
        .thenReturn(HomeLoadingFailureState('Error occurred'));
    await tester.pumpWidget(createWidgetUnderTest());
    expect(find.byType(ScaffoldMessenger), findsOneWidget);
  });

  testWidgets('HomeListScreen navigates to login screen on HomeLogoutState',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state).thenReturn(HomeLogoutState());
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
  });
  testWidgets(
    'displays content correctly when HomeLoadingSuccessState is emitted',
        (tester) async {
      when(() => mockHomeBloc.state).thenReturn(HomeLoadingSuccessState(
        userFeatures: const FeatureConfigResponse(
          home: HomeFeatures(
            disableWarmupTests: false,
            disableTrendingNow: true,
            disableLearn: false,
            disablePractice: false,
            disableTimetable: false,
            disableLiveClasses: false,
            disableAssignments: false,
            disableTests: false,
            disableAchievements: false,
            disableFunZone: false,
            disableCounselling: true,
            disableFunScrolls: false,
            disableEChronicle: false,
            disableReviseNow: true,
            disableInteractive: false,
          ),
        ),
        courseInfo: const [
          CourseInformationResponse(id: '1', name: 'Test Course')
        ],
      ));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(SliverAppBarWidget), findsOneWidget);
      expect(find.byType(HomeBannersWidget), findsOneWidget);
      expect(find.byType(HomeJustForYouWidget), findsNothing);
      expect(find.byType(HomeLearnSubjects), findsNothing);
      expect(find.byType(HomeContinueFrom), findsOneWidget);
      expect(find.byType(HomeScheduleTest), findsNothing);
      expect(find.byType(HomeReviseNowCardWidget), findsNothing);
      expect(find.byType(HomeDishaConfigImage), findsNothing);
      expect(find.byType(HomeNaryanaLogoWidget), findsNothing);
    },
  );


  testWidgets('HomeListScreen opens side menu on OpenSideMenuState',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state).thenReturn(OpenSideMenuState());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
  });

  testWidgets(
      'HomeListScreen navigates to notification screen on NavigateToNotificationState',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state).thenReturn(NavigateToNotificationState());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
  });

  testWidgets(
      'HomeListScreen displays LearnVideo when LearnVideoClickedState is emitted',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state).thenReturn(LearnVideoClickedState());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
  });

  testWidgets(
      'HomeListScreen displays subject when LearnSubjectCardClickedState is emitted',
      (WidgetTester tester) async {
    const subject =
        HomeGetLearnSubjectListResponse(subjectId: '1', subjectName: 'Math');
    when(() => mockHomeBloc.state)
        .thenReturn(LearnSubjectCardClickedState(subject: subject));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
  });
  testWidgets(
      'HomeListScreen responds to WarmUpTestClickedState by showing warm-up test',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state).thenReturn(WarmUpTestClickedState());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
  });
  testWidgets('HomeListScreen displays Revise Now on ReviseNowClickedState',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state).thenReturn(ReviseNowClickedState());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
  });
  testWidgets(
      'HomeListScreen responds to InteractiveScrollsClickedState by showing interactive scrolls',
      (WidgetTester tester) async {
    when(() => mockHomeBloc.state).thenReturn(InteractiveScrollsClickedState());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
  });
}
