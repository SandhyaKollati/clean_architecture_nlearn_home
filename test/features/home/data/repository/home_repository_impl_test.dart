import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_course_info_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_disha_config_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_practice_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_subjects_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_video_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_revise_now_status_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_scheduled_test_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_user_features_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_user_profile_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/repositories/home_repository_impl.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_disha_config_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_practice_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_subjects_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_video_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_scheduled_test_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_features_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_profile_response.dart';
import '../../../../helper/test_helper.mocks.dart';

late MockHomeRemoteDatasource mockHomeRemoteDatasource;
late HomeRepositoryImpl homeRepositoryImpl;

void main() {
  setUp(() {
    mockHomeRemoteDatasource = MockHomeRemoteDatasource();
    homeRepositoryImpl =
        HomeRepositoryImpl(homeRemoteDatasource: mockHomeRemoteDatasource);
  });

  group('home repository impl tests', () {
    userFeaturesListTest();
    courseInfoTest();
    userProfileTest();
    learnSubjectTest();
    learnVideoTest();
    reviseNowStatusTest();
    scheduleTestListTests();
    dishaConfigTest();
    practiceListTest();
  });
}

void userFeaturesListTest() {
  const userFeaturesModel = FeatureConfigResponseModel(
      home: HomeFeaturesModel(
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
          disableWarmupTests: false));

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
          disableWarmupTests: false));

  group("user features tests", () {
    test("Should return feature list when a call to data source is successful",
        () async {
      when(mockHomeRemoteDatasource.getFeaturesRequest())
          .thenAnswer((_) async => userFeaturesModel);
      final result = await homeRepositoryImpl.getFeaturesRequest();
      expect(result, equals(const Right(userFeatures)));
    });

    test("Should return failure when a call to data source is unsuccessful",
        () async {
      when(mockHomeRemoteDatasource.getFeaturesRequest()).thenThrow('error');
      expect(await homeRepositoryImpl.getFeaturesRequest(),
          equals(const Left(Failure('error'))));
    });
  });
}

void courseInfoTest() {
  const List<CourseInformationResponse> coursesList = [
    CourseInformationResponse(id: '1', name: 'Jee advanced'),
    CourseInformationResponse(id: '2', name: 'Jee advanced')
  ];

  const List<CourseInformationResponseModel> modelCoursesList = [
    CourseInformationResponseModel(id: '1', name: 'Jee advanced'),
    CourseInformationResponseModel(id: '2', name: 'Jee advanced')
  ];

  group("course_info", () {
    test("Should return course list when a call to data source is successful",
        () async {
      when(mockHomeRemoteDatasource.homeGetCourseListRequest())
          .thenAnswer((_) async => modelCoursesList);
      final result = await homeRepositoryImpl.homeGetCourseListRequest();
      final resultList =
          (result as Right<Failure, List<CourseInformationResponse>>)
              .getOrElse(() => []);
      expect(resultList, equals(coursesList));
    });

    test("Should return failure when a call to data source is unsuccessful",
        () async {
      when(mockHomeRemoteDatasource.homeGetCourseListRequest())
          .thenThrow('error');
      expect(await homeRepositoryImpl.homeGetCourseListRequest(),
          equals(Left(Failure('error'))));
    });
  });
}

void userProfileTest() {
  const UserProfileInformationResponse userProfile =
      UserProfileInformationResponse(
          studentId: 'data',
          studentName: 'studentName',
          displayName: 'displayName');

  const UserProfileInformationResponseModel userProfileModel =
      UserProfileInformationResponseModel(
          studentId: 'data',
          studentName: 'studentName',
          displayName: 'displayName');

  group("user_profile_info", () {
    test("Should return user profile when a call to data source is successful",
        () async {
      when(mockHomeRemoteDatasource.getUserProfile())
          .thenAnswer((_) async => userProfileModel);
      final result = await homeRepositoryImpl.getUserProfile();
      expect(result, equals(const Right(userProfile)));
    });

    test("Should return failure when a call to data source is unsuccessful",
        () async {
      when(mockHomeRemoteDatasource.getUserProfile()).thenThrow('error');
      expect(await homeRepositoryImpl.getUserProfile(),
          equals(const Left(Failure('error'))));
    });
  });
}

void learnSubjectTest() {
  const homeGetLearnSubjectListResponseModel = [
    HomeGetLearnSubjectListResponseModel(subjectId: "", subjectName: "")
  ];
  const homeGetLearnSubjectListResponse = [
    HomeGetLearnSubjectListResponse(subjectId: "", subjectName: "")
  ];

  group("learn subject list", () {
    test("Should return subject list when a call to data source is successful",
        () async {
      when(mockHomeRemoteDatasource.homeGetLearnSubjectListRequest())
          .thenAnswer((_) async => homeGetLearnSubjectListResponseModel);
      final result = await homeRepositoryImpl.homeGetLearnSubjectListRequest();
      final resultList =
          (result as Right<Failure, List<HomeGetLearnSubjectListResponse>>)
              .getOrElse(() => []);
      expect(resultList, equals(homeGetLearnSubjectListResponse));
    });

    test("Should return failure when a call to data source is unsuccessful",
        () async {
      when(mockHomeRemoteDatasource.homeGetLearnSubjectListRequest())
          .thenThrow('error');
      expect(await homeRepositoryImpl.homeGetLearnSubjectListRequest(),
          equals(const Left(Failure('error'))));
    });
  });
}

void learnVideoTest() {
  const homeGetLearnVideoResponseModel =
      HomeGetLearnVideoResponseModel(heading: '', learnData: []);
  const homeGetLearnVideoResponse =
      HomeGetLearnVideoResponse(heading: '', learnData: []);
  group("learn video list", () {
    test("Should return video list when a call to data source is successful",
        () async {
      when(mockHomeRemoteDatasource.homeGetLearnVideoListRequest())
          .thenAnswer((_) async => homeGetLearnVideoResponseModel);
      final result = await homeRepositoryImpl.homeGetLearnVideoListRequest();
      expect(result, equals(const Right(homeGetLearnVideoResponse)));
    });

    test("Should return failure when a call to data source is unsuccessful",
        () async {
      when(mockHomeRemoteDatasource.homeGetLearnVideoListRequest())
          .thenThrow('error');
      expect(await homeRepositoryImpl.homeGetLearnVideoListRequest(),
          equals(const Left(Failure('error'))));
    });
  });
}

void practiceListTest() {
  const homeGetPracticeResponseModel =
  HomeGetPracticeResponseModel(heading: '', practiceData: []);
  const homeGetPracticeResponse =
  HomeGetPracticeResponse(heading: '',practiceData: []);
  group("practice list", () {
    test("Should return practice list when a call to data source is successful",
            () async {
          when(mockHomeRemoteDatasource.homeGetPracticeListRequest())
              .thenAnswer((_) async => homeGetPracticeResponseModel);
          final result = await homeRepositoryImpl.homeGetPracticeListRequest();
          expect(result, equals(const Right(homeGetPracticeResponse)));
        });

    test("Should return failure when a call to data source is unsuccessful",
            () async {
          when(mockHomeRemoteDatasource.homeGetPracticeListRequest())
              .thenThrow('error');
          expect(await homeRepositoryImpl.homeGetPracticeListRequest(),
              equals(const Left(Failure('error'))));
        });
  });
}

void reviseNowStatusTest() {
  const practiceReviseNowResponseModel =
      PracticeReviseNowResponseModel(testsAttempted: 0, questionsToBeRevised: 0);
  const practiceReviseNowResponse =
      PracticeReviseNowResponse(testsAttempted: 0, questionsToBeRevised: 0);

  group("revise now status", () {
    test(
        "Should return revise now status  when a call to data source is successful",
        () async {
      when(mockHomeRemoteDatasource.getReviseNowData())
          .thenAnswer((_) async => practiceReviseNowResponseModel);
      final result = await homeRepositoryImpl.getReviseNowData();
      expect(result, equals(const Right(practiceReviseNowResponse)));
    });

    test("Should return failure when a call to data source is unsuccessful",
        () async {
      when(mockHomeRemoteDatasource.getReviseNowData()).thenThrow('error');
      expect(await homeRepositoryImpl.getReviseNowData(),
          equals(const Left(Failure('error'))));
    });
  });
}

void scheduleTestListTests() {
  const homeGetScheduledTestResponseModel = [
    HomeGetScheduledTestResponseModel(examName: '')
  ];
  const homeGetScheduledTestResponse = [
    HomeGetScheduledTestResponse(examName: '')
  ];

  group("schedule Test", () {
    test(
        "Should return schedule test list  when a call to data source is successful",
        () async {
      when(mockHomeRemoteDatasource.homeGetScheduledTestRequest())
          .thenAnswer((_) async => homeGetScheduledTestResponseModel);
      final result = await homeRepositoryImpl.homeGetScheduledTestRequest();
      final resultList =
          (result as Right<Failure, List<HomeGetScheduledTestResponse>>)
              .getOrElse(() => []);
      expect(resultList, equals(homeGetScheduledTestResponse));
    });

    test("Should return failure when a call to data source is unsuccessful",
        () async {
      when(mockHomeRemoteDatasource.homeGetScheduledTestRequest())
          .thenThrow('error');
      expect(await homeRepositoryImpl.homeGetScheduledTestRequest(),
          equals(const Left(Failure('error'))));
    });
  });
}

void dishaConfigTest() {
  const homeDishaConfigResponseDataModel =
      HomeDishaConfigResponseModel(dishaEndPoint: '');
  const homeDishaConfigResponseData =
      HomeDishaConfigResponse(dishaEndPoint: '');

  group("disha config ", () {
    test(
        "Should return disha config   when a call to data source is successful",
        () async {
      when(mockHomeRemoteDatasource.getDishaConfigRequest())
          .thenAnswer((_) async => homeDishaConfigResponseDataModel);
      final result = await homeRepositoryImpl.getDishaConfigRequest();
      expect(result, equals(const Right(homeDishaConfigResponseData)));
    });

    test("Should return failure when a call to data source is unsuccessful",
        () async {
      when(mockHomeRemoteDatasource.getDishaConfigRequest()).thenThrow('error');
      expect(await homeRepositoryImpl.getDishaConfigRequest(),
          equals(const Left(Failure('error'))));
    });
  });
}
