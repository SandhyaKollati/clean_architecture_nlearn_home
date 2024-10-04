import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/core/network/api_service.dart';
import 'package:nlearn_v3_home/core/utils/constants/api_end_points.dart';
import 'package:nlearn_v3_home/core/utils/enums/service.dart';
import 'package:nlearn_v3_home/features/home/data/datasources/remote/home_remote_data_source_impl.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_course_info_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_disha_config_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_practice_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_user_profile_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_subjects_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_video_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_revise_now_status_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_scheduled_test_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_user_features_response_model.dart';
import '../../../../../helper/test_helper.mocks.dart';

late MockBaseApiService mockBaseApiService;
late HomeRemoteDataSourceImplementation homeRemoteDataSourceImplementation;

void main() {
  setUp(() {
    mockBaseApiService = MockBaseApiService();
    homeRemoteDataSourceImplementation =
        HomeRemoteDataSourceImplementation(apiService: mockBaseApiService);
  });

  group('HomeRemoteDataSourceImplementation Tests', () {
    dishaConfig();
    userFeatures();
    userProfile();
    courseInfo();
    learnSubject();
    learnVideos();
    practiceList();
    schedulesTest();
    getReviseNowData();
  });
}

void dishaConfig() {
  group('getDishaConfigRequest', () {
    final mockDishaConfig = {
    "data": {
         "disha_connect_end_point": "mockConfig",
    }
  };
    test('should return HomeDishaConfigResponseDataModel when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.dishaConfig,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockDishaConfig,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.dishaConfig),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.getDishaConfigRequest();
      expect(result, isA<HomeDishaConfigResponseModel>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.dishaConfig,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'No Data');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.getDishaConfigRequest(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch Disha config: No Data'))),
      );
    });
  });
}

void userFeatures() {
  group('getFeaturesRequest', () {
    final mockFeatures = {
      "data": {
        "home" : {
          'disable_learn': false,
        },
      }
    };

    test('should return FeatureConfigResponseModel when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.featureConfig,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockFeatures,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.featureConfig),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.getFeaturesRequest();
      expect(result, isA<FeatureConfigResponseModel>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.featureConfig,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'Error occured');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.getFeaturesRequest(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch feature config: Error occured'))),
      );
    });
  });
}

void userProfile() {
  group('getUserProfile', () {
    final mockUserProfile = {
      "data" : {
        "studentId" : "2344",
        "studentName" : "Sandhya",
        "display_name": "display"
      },
    };

    test('should return UserProfileInformationModel when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.userInfo,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockUserProfile,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.userInfo),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.getUserProfile();
      expect(result, isA<UserProfileInformationResponseModel>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.userInfo,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'No Data');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.getUserProfile(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch user profile: No Data'))),
      );
    });
  });
}

void courseInfo() {
  group('homeGetCourseListRequest', () {
    final mockCourseList = {
      "data": [
        {"course_id": "1", "course_name": "Course 1"},
        {"course_id": "2", "course_name": "Course 2"},
    ]
    };

    test('should return List<CourseInformationModel> when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getCourseList,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockCourseList,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.getCourseList),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.homeGetCourseListRequest();
      expect(result, isA<List<CourseInformationResponseModel>>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getCourseList,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'No Data');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.homeGetCourseListRequest(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch course list: No Data'))),
      );
    });
  });
}

void learnSubject() {
  group('homeGetLearnSubjectListRequest', () {
    final mockSubjectList = {
      "data": [
        {"subject_id": "1", "subject_name": "Subject 1"},
        {"subject_id": "2", "subject_name": "Subject 2"},
      ]
    };

    test('should return List<LearnSubjectModel> when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getHomeLearnSubjectList,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockSubjectList,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.getHomeLearnSubjectList),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.homeGetLearnSubjectListRequest();
      expect(result, isA<List<HomeGetLearnSubjectListResponseModel>>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getHomeLearnSubjectList,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'No Data');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.homeGetLearnSubjectListRequest(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch subject list: No Data'))),
      );
    });
  });
}

void learnVideos() {
  group('homeGetLearnVideoListRequest', () {
    const mockVideoList = {
      "data":
        {
          "heading": "1",
          "learn_data": [
            {"chapter_id": ""}
          ]
        },

    };


    test('should return List<LearnVideoModel> when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getHomeLearnVideoList,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockVideoList,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.getHomeLearnVideoList),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.homeGetLearnVideoListRequest();
      print(result);
      expect(result, isA<HomeGetLearnVideoResponseModel>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getHomeLearnVideoList,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'No Data');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.homeGetLearnVideoListRequest(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch video list: No Data'))),
      );
    });
  });
}

void practiceList() {
  group('homeGetPracticeListRequest', () {
    const mockPracticeList = {
      "data":
      {
        "heading": "1",
        "practice_data": [
          {"chapter_name": 'NAME'}
        ]
      },

    };


    test('should return List<PracticeModel> when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getHomePracticeList,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockPracticeList,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.getHomePracticeList),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.homeGetPracticeListRequest();
      expect(result, isA<HomeGetPracticeResponseModel>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getHomePracticeList,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'No Data');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.homeGetPracticeListRequest(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch practice list: No Data'))),
      );
    });
  });
}

void schedulesTest() {
  group('homeGetScheduledTestRequest', () {
    final mockScheduledTestList = {
      "data": [
        {"exam_name": "1"},
      ]
    };

    test('should return List<ScheduledTestModel> when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getHomeScheduledTest,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockScheduledTestList,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.getHomeScheduledTest),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.homeGetScheduledTestRequest();
      expect(result, isA<List<HomeGetScheduledTestResponseModel>>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getHomeScheduledTest,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'No Data');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.homeGetScheduledTestRequest(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch scheduled test list: No Data'))),
      );
    });
  });
}

void getReviseNowData() {
  group('getReviseNowData', () {
    final mockReviseNowData = {
      "data": {
        "tests_attempted": 0
      }
    };

    test('should return ReviseNowDataModel when response is successful', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getReviseNow,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(
          response: Response(
            data: mockReviseNowData,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiEndPoints.getReviseNow),
          ),
        );
      });

      final result = await homeRemoteDataSourceImplementation.getReviseNowData();
      expect(result, isA<PracticeReviseNowResponseModel>());
    });

    test('should throw an Exception when the response contains an error', () async {
      when(mockBaseApiService.makeRequest(
        url: ApiEndPoints.getReviseNow,
        method: RequestType.get,
      )).thenAnswer((_) async {
        return ApiResponse(error: 'No Data');
      });

      expect(
            () async => await homeRemoteDataSourceImplementation.getReviseNowData(),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to fetch revise now list: No Data'))),
      );
    });
  });
}
