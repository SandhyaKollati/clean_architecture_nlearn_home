import 'package:flutter_test/flutter_test.dart';
import 'home_course_info_response_model_test.dart';
import 'home_disha_config_response_model_test.dart';
import 'home_learn_practice_response_model_test.dart';
import 'home_learn_subjects_response_model_test.dart';
import 'home_learn_video_response_model_test.dart';
import 'home_revise_now_status_response_model_test.dart';
import 'home_scheduled_test_response_model_test.dart';
import 'home_user_features_response_model_test.dart';
import 'home_user_profile_response_model_test.dart';

void main() {

  group("models test", () {
    userFeaturesModelTest();
    courseInfoModelTest();
    userProfileResponseModelTest();
    dishaConfigModelTest();
    learnSubjectsResponseModelTest();
    learnVideosResponseModelTest();
    reviseNowStatusModelTest();
    scheduleTestResponseModelTest();
    practiceListResponseModelTest();
  });

}