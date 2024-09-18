import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_practice_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';
import '../../domain/entities/response/home_course_info_response.dart';
import '../../domain/entities/response/home_disha_config_response.dart';
import '../../domain/entities/response/home_user_profile_response.dart';
import '../../domain/entities/response/home_learn_subjects_response.dart';
import '../../domain/entities/response/home_learn_video_response.dart';
import '../../domain/entities/response/home_scheduled_test_response.dart';
import '../entities/response/home_user_features_response.dart';

abstract class HomeRepository {
  Future<Either<Failure,HomeGetLearnVideoResponse>> homeGetLearnVideoListRequest();
  Future<Either<Failure,HomeDishaConfigResponse>> getDishaConfigRequest();
  Future<Either<Failure,List<CourseInformationResponse>>> homeGetCourseListRequest();
  Future<Either<Failure,HomeGetPracticeResponse>> homeGetPracticeListRequest();
  Future<Either<Failure,FeatureConfigResponse>> getFeaturesRequest();
  Future<Either<Failure,List<HomeGetScheduledTestResponse>>> homeGetScheduledTestRequest();
  Future<Either<Failure,List<HomeGetLearnSubjectListResponse>>> homeGetLearnSubjectListRequest();
  Future<Either<Failure,UserProfileInformationResponse>> getUserProfile();
  Future<Either<Failure, PracticeReviseNowResponse>> getReviseNowData();
}