import 'package:nlearn_v3_home/core/utils/constants/api_end_points.dart';
import 'package:nlearn_v3_home/core/utils/enums/service.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_course_info_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_disha_config_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_practice_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_user_profile_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_subjects_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_video_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_revise_now_status_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_scheduled_test_response_model.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_user_features_response_model.dart';
import '../../../../../core/network/api_service.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImplementation implements HomeRemoteDatasource {
  HomeRemoteDataSourceImplementation({required this.apiService});

  final BaseApiService apiService;

  @override
  Future<HomeDishaConfigResponseModel> getDishaConfigRequest() async {
    final response = await apiService.makeRequest(
      url: ApiEndPoints.dishaConfig,
    );

    if (response.hasError) {
      throw Exception('Failed to fetch Disha config: ${response.error}');
    }

    final jsonResponse = response.response?.data;
    try {
      return HomeDishaConfigResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw Exception("Error parsing Disha config response: $e");
    }
  }

  @override
  Future<FeatureConfigResponseModel> getFeaturesRequest() async {
    final response = await apiService.makeRequest(
      url: ApiEndPoints.featureConfig,
    );

    if (response.hasError) {
      throw Exception('Failed to fetch feature config: ${response.error}');
    }

    final jsonResponse = response.response?.data;
    try {
      return FeatureConfigResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw Exception("Error parsing feature config response: $e");
    }
  }

  @override
  Future<UserProfileInformationResponseModel> getUserProfile() async {
    final response = await apiService.makeRequest(
      url: ApiEndPoints.userInfo,
    );

    if (response.hasError) {
      throw Exception('Failed to fetch user profile: ${response.error}');
    }

    final jsonResponse = response.response?.data;
    try {
      return UserProfileInformationResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw Exception("Error parsing user profile response: $e");
    }
  }

  @override
  Future<List<CourseInformationResponseModel>> homeGetCourseListRequest() async {
    final apiResponse = await apiService.makeRequest(
      url: ApiEndPoints.getCourseList,
    );

    if (apiResponse.hasError) {
      throw Exception('Failed to fetch course list: ${apiResponse.error}');
    }

    final responseData = apiResponse.response?.data['data'];
    if (responseData != null) {
      return (responseData as List)
          .map((data) => CourseInformationResponseModel.fromJson(data))
          .toList();
    } else {
      throw Exception('No data found');
    }
  }

  @override
  Future<List<HomeGetLearnSubjectListResponseModel>> homeGetLearnSubjectListRequest() async {
    final response = await apiService.makeRequest(
      url: ApiEndPoints.getHomeLearnSubjectList,
    );

    if (response.hasError) {
      throw Exception('Failed to fetch subject list: ${response.error}');
    }
    final responseData = response.response?.data['data'];
    if (responseData != null) {
      return (responseData as List)
          .map((data) => HomeGetLearnSubjectListResponseModel.fromJson(data))
          .toList();
    }else {
      throw Exception('No data found');
    }
  }

  @override
  Future<HomeGetLearnVideoResponseModel> homeGetLearnVideoListRequest() async {
    final response = await apiService.makeRequest(
      url: ApiEndPoints.getHomeLearnVideoList,
    );
    if (response.hasError) {
      throw Exception('Failed to fetch video list: ${response.error}');
    }
    final jsonResponse = response.response?.data;
    try {
      return HomeGetLearnVideoResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw Exception("Error parsing video list response: $e");
    }
  }

  @override
  Future<HomeGetPracticeResponseModel> homeGetPracticeListRequest() async {
    final response = await apiService.makeRequest(
      url: ApiEndPoints.getHomePracticeList,
    );

    if (response.hasError) {
      throw Exception('Failed to fetch practice list: ${response.error}');
    }
    final jsonResponse = response.response?.data;
    try {
      return HomeGetPracticeResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw Exception("Error parsing practice list response: $e");
    }
  }

  @override
  Future<List<HomeGetScheduledTestResponseModel>> homeGetScheduledTestRequest() async {
    final response = await apiService.makeRequest(
      url: ApiEndPoints.getHomeScheduledTest,
    );

    if (response.hasError) {
      throw Exception('Failed to fetch scheduled test list: ${response.error}');
    }

    final responseData = response.response?.data['data'];
    if (responseData != null) {
      return (responseData as List)
          .map((data) => HomeGetScheduledTestResponseModel.fromJson(data))
          .toList();
    }else {
      throw Exception('No data found');
    }
  }

  @override
  Future<PracticeReviseNowResponseModel> getReviseNowData() async {
    final response = await apiService.makeRequest(
      url: ApiEndPoints.getReviseNow,
      method: RequestType.get,
    );

    if (response.hasError) {
      throw Exception('Failed to fetch revise now list: ${response.error}');
    }

    final jsonResponse = response.response?.data;
    try {
      return PracticeReviseNowResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw Exception("Error parsing revise now response: $e");
    }
  }
}
