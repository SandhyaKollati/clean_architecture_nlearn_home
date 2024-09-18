
import 'package:nlearn_v3_home/features/home/data/models/home_learn_practice_response_model.dart';

import '../../models/home_course_info_response_model.dart';
import '../../models/home_disha_config_response_model.dart';
import '../../models/home_user_profile_response_model.dart';
import '../../models/home_learn_subjects_response_model.dart';
import '../../models/home_learn_video_response_model.dart';
import '../../models/home_revise_now_status_response_model.dart';
import '../../models/home_scheduled_test_response_model.dart';
import '../../models/home_user_features_response_model.dart';

abstract class HomeRemoteDatasource {
  Future<HomeGetLearnVideoResponseModel> homeGetLearnVideoListRequest();
  Future<HomeDishaConfigResponseModel> getDishaConfigRequest();
  Future<List<CourseInformationResponseModel>> homeGetCourseListRequest();
  Future<HomeGetPracticeResponseModel> homeGetPracticeListRequest();
  Future<FeatureConfigResponseModel> getFeaturesRequest();
  Future<List<HomeGetScheduledTestResponseModel>> homeGetScheduledTestRequest();
  Future<List<HomeGetLearnSubjectListResponseModel>> homeGetLearnSubjectListRequest();
  Future<UserProfileInformationResponseModel> getUserProfile();
  Future<PracticeReviseNowResponseModel> getReviseNowData();
}



