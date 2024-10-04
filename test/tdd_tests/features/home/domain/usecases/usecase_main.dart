import 'package:flutter_test/flutter_test.dart';
import 'home_course_info_usecase_test.dart';
import '../../../../helper/home_repository_helper.dart';
import 'home_learn_subject_usecase_test.dart';
import 'home_learn_video_usecase_test.dart';
import 'home_practice_list_usecase_test.dart';
import 'home_revise_now_status_usecase_test.dart';
import 'home_schedule_test_usecase_test.dart';
import 'home_user_features_usecase_test.dart';
import 'home_user_profile_usecase_test.dart';

void main() {
  initializeMockHomeRepository();

  group('usecase_tests', () {
    homeUserInfoUsecaseTest();
    courseInfoUsecaseTest();
    userFeaturesUsecaseTest();
    learnSubjectUsecaseTest();
    learnVideoUsecaseTest();
    practiceListUsecaseTest();
    scheduleTestUsecaseTest();
    reviseNowStatusUsecaseTest();
    homeUserInfoUsecaseTest();
  });

}