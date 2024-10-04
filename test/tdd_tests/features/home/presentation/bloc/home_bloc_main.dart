import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_disha_config_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_practice_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_subjects_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_video_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_scheduled_test_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_features_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_profile_response.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late HomeBloc homeBloc;
  late MockHomeCourseInfoUseCase mockHomeCourseInfoUseCase;
  late MockHomeUserProfileUseCase mockHomeUserProfileUseCase;
  late MockHomeDishaConfigUseCase mockHomeDishaConfigUseCase;
  late MockHomeLearnSubjectUseCase mockHomeLearnSubjectUseCase;
  late MockHomeLearnVideoListUseCase mockHomeLearnVideoListUseCase;
  late MockHomePracticeListUseCase mockHomePracticeListUseCase;
  late MockHomeReviseNowUseCase mockHomeReviseNowUseCase;
  late MockHomeScheduledTestUseCase mockHomeScheduledTestUseCase;
  late MockHomeUserFeaturesUseCase mockHomeUserFeaturesUseCase;

  const courseInformation = CourseInformationResponse(id: '1', name: 'Test Course');
  const userProfile = UserProfileInformationResponse(studentId: '123', studentName: 'John Doe', displayName: 'John');
  const dishaConfig = HomeDishaConfigResponse(dishaEndPoint: 'https://disha.example.com');
  const learnSubject = HomeGetLearnSubjectListResponse(subjectId: '1', subjectName: 'Math');
  const learnVideoResponse = HomeGetLearnVideoResponse(heading: 'Learn Videos', learnData: []);
  const practiceVideoResponse = HomeGetPracticeResponse(heading: 'Practice Videos', practiceData: []);
  const reviseNowResponse = PracticeReviseNowResponse(testsAttempted: 5, questionsToBeRevised: 0);
  const scheduledTestResponse = HomeGetScheduledTestResponse(examName: 'Final Exam');
  const userFeatures = FeatureConfigResponse(
    home: HomeFeatures(
      disableLearn: false,
      disablePractice: false,
      disableTimetable: false,
      disableLiveClasses: false,
      disableAssignments: false,
      disableTests: false,
      disableAchievements: false,
      disableFunZone: false,
      disableCounselling: false,
      disableFunScrolls: false,
      disableEChronicle: false,
      disableReviseNow: false,
      disableInteractive: false,
      disableTrendingNow: false,
      disableWarmupTests: false
    ),
  );

  setUp(() {
    mockHomeCourseInfoUseCase = MockHomeCourseInfoUseCase();
    mockHomeUserProfileUseCase = MockHomeUserProfileUseCase();
    mockHomeDishaConfigUseCase = MockHomeDishaConfigUseCase();
    mockHomeLearnSubjectUseCase = MockHomeLearnSubjectUseCase();
    mockHomeLearnVideoListUseCase = MockHomeLearnVideoListUseCase();
    mockHomePracticeListUseCase = MockHomePracticeListUseCase();
    mockHomeReviseNowUseCase = MockHomeReviseNowUseCase();
    mockHomeScheduledTestUseCase = MockHomeScheduledTestUseCase();
    mockHomeUserFeaturesUseCase = MockHomeUserFeaturesUseCase();
    homeBloc = HomeBloc(
      homeUserProfileUseCase: mockHomeUserProfileUseCase,
      homeCourseInfoUseCase: mockHomeCourseInfoUseCase,
      homeDishaConfigUseCase: mockHomeDishaConfigUseCase,
      homeLearnSubjectUseCase: mockHomeLearnSubjectUseCase,
      homeLearnVideoListUseCase: mockHomeLearnVideoListUseCase,
      homePracticeListUseCase: mockHomePracticeListUseCase,
      homeReviseNowUseCase: mockHomeReviseNowUseCase,
      homeScheduledTestUseCase: mockHomeScheduledTestUseCase,
      homeUserFeaturesUseCase: mockHomeUserFeaturesUseCase,
    );
  });

  test('initial state should be empty', () {
    expect(homeBloc.state, HomeInitial());
  });

  blocTest<HomeBloc, HomeState>(
    'emits [HomeLoadingState, HomeLoadingSuccessState] when HomeInitialEvent is added and succeeds',
    build: () {
      // Mock responses for each use case using predefined variables
      when(mockHomeCourseInfoUseCase()).thenAnswer((_) async => const Right([courseInformation]));
      when(mockHomeUserProfileUseCase()).thenAnswer((_) async => const Right(userProfile));
      when(mockHomeDishaConfigUseCase()).thenAnswer((_) async => const Right(dishaConfig));
      when(mockHomeLearnSubjectUseCase()).thenAnswer((_) async => const Right([learnSubject]));
      when(mockHomeLearnVideoListUseCase()).thenAnswer((_) async => const Right(learnVideoResponse));
      when(mockHomePracticeListUseCase()).thenAnswer((_) async => const Right(practiceVideoResponse));
      when(mockHomeReviseNowUseCase()).thenAnswer((_) async => const Right(reviseNowResponse));
      when(mockHomeScheduledTestUseCase()).thenAnswer((_) async => const Right([scheduledTestResponse]));
      when(mockHomeUserFeaturesUseCase()).thenAnswer((_) async => const Right(userFeatures));
      return homeBloc;
    },
    act: (bloc) => bloc.add(HomeInitialEvent()),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      HomeLoadingState(),
      HomeLoadingSuccessState(
        userProfile: userProfile,
        courseInfo: [courseInformation],
        dishaConfig: dishaConfig,
        learnSubjects: [learnSubject],
        learnVideos: learnVideoResponse,
        practiceList: practiceVideoResponse,
        reviseNow: reviseNowResponse,
        scheduledTests: [scheduledTestResponse],
        userFeatures: userFeatures,
      ),
    ],
    verify: (bloc) {
      verify(mockHomeCourseInfoUseCase()).called(1);
      verify(mockHomeUserProfileUseCase()).called(1);
      verify(mockHomeDishaConfigUseCase()).called(1);
      verify(mockHomeLearnSubjectUseCase()).called(1);
      verify(mockHomeLearnVideoListUseCase()).called(1);
      verify(mockHomePracticeListUseCase()).called(1);
      verify(mockHomeReviseNowUseCase()).called(1);
      verify(mockHomeScheduledTestUseCase()).called(1);
      verify(mockHomeUserFeaturesUseCase()).called(1);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'emits [HomeLoadingState, HomeLoadingFailureState] when HomeInitialEvent is added and fails with a generic Failure',
    build: () {
      // Mock responses for each use case using a generic Failure
      when(mockHomeCourseInfoUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      when(mockHomeUserProfileUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      when(mockHomeDishaConfigUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      when(mockHomeLearnSubjectUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      when(mockHomeLearnVideoListUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      when(mockHomePracticeListUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      when(mockHomeReviseNowUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      when(mockHomeScheduledTestUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      when(mockHomeUserFeaturesUseCase()).thenAnswer((_) async => const Left(Failure('Generic failure')));
      return homeBloc;
    },
    act: (bloc) => bloc.add(HomeInitialEvent()),
    expect: () => [
      HomeLoadingState(),
      HomeLoadingFailureState('Exception: Generic failure'),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [HomeLoadingState, HomeLogoutState] when HomeInitialEvent is added and fails with a session expired error',
    build: () {
      // Mock responses for each use case using session expired error
      when(mockHomeCourseInfoUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      when(mockHomeUserProfileUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      when(mockHomeDishaConfigUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      when(mockHomeLearnSubjectUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      when(mockHomeLearnVideoListUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      when(mockHomePracticeListUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      when(mockHomeReviseNowUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      when(mockHomeScheduledTestUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      when(mockHomeUserFeaturesUseCase()).thenAnswer((_) async => const Left(Failure('session expired')));
      return homeBloc;
    },
    act: (bloc) => bloc.add(HomeInitialEvent()),
    expect: () => [
      HomeLoadingState(),
      HomeLogoutState(),
    ],
  );


  blocTest<HomeBloc, HomeState>(
    'emits [OpenCourseSwitchBottomSheetState] when CourseSwitchClickedEvent is added',
    build: () => homeBloc,
    act: (bloc) => bloc.add(CourseSwitchClickedEvent()),
    expect: () => [OpenCourseSwitchBottomSheetState()],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [NavigateToNotificationState] when NotificationIconClickedEvent is added',
    build: () => homeBloc,
    act: (bloc) => bloc.add(NotificationIconClickedEvent()),
    expect: () => [NavigateToNotificationState()],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [OpenSideMenuState] when MenuIconClickedEvent is added',
    build: () => homeBloc,
    act: (bloc) => bloc.add(MenuIconClickedEvent()),
    expect: () => [OpenSideMenuState()],
  );
}
