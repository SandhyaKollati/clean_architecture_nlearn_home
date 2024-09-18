import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_practice_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_features_response.dart';
import '../../domain/entities/response/home_course_info_response.dart';
import '../../domain/entities/response/home_disha_config_response.dart';
import '../../domain/entities/response/home_user_profile_response.dart';
import '../../domain/entities/response/home_learn_subjects_response.dart';
import '../../domain/entities/response/home_learn_video_response.dart';
import '../../domain/entities/response/home_scheduled_test_response.dart';
import '../../domain/repository/home_repository.dart';
import '../datasources/remote/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required this.homeRemoteDatasource});

  final HomeRemoteDatasource homeRemoteDatasource;

  Future<Either<Failure, T>> _handleRequest<T>(
      Future<T> Function() request) async {
    try {
      final response = await request();
      return Right(response);
    } catch(e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,
      HomeDishaConfigResponse>> getDishaConfigRequest() async {
    return _handleRequest(() async {
      final dishConfig = await homeRemoteDatasource.getDishaConfigRequest();
      return dishConfig.toEntity();
    });
  }

  @override
  Future<Either<Failure,
      List<CourseInformationResponse>>> homeGetCourseListRequest() async {
    return _handleRequest(() async {
      final courseInfo = await homeRemoteDatasource.homeGetCourseListRequest();
      List<CourseInformationResponse> result = courseInfo.map((model) => model.toEntity())
          .toList(); // Convert to entity
        return result;
    });
  }

  @override
  Future<Either<Failure,
      List<
          HomeGetLearnSubjectListResponse>>> homeGetLearnSubjectListRequest() async {
    return _handleRequest(() async {
      final learnData = await homeRemoteDatasource.homeGetLearnSubjectListRequest();
      final data = learnData.map((model) => model.toEntity())
          .toList();
      return data;
    });
  }

  @override
  Future<Either<Failure,
      HomeGetPracticeResponse>> homeGetPracticeListRequest() async {
    return _handleRequest(() async {
      final practiceResponse = await homeRemoteDatasource.homeGetPracticeListRequest();
      return practiceResponse.toEntity();
    });
  }

  @override
  Future<Either<Failure,
      List<HomeGetScheduledTestResponse>>> homeGetScheduledTestRequest() async {
    return _handleRequest(() async {
      final scheduleTestResponse = await homeRemoteDatasource.homeGetScheduledTestRequest();
      return scheduleTestResponse.map((model) => model.toEntity())
          .toList();
    });
  }

  @override
  Future<Either<Failure, UserProfileInformationResponse>> getUserProfile() async {
    return _handleRequest(() async {
      final userList = await homeRemoteDatasource.getUserProfile();
      return userList.toEntity();
    });
  }

  @override
  Future<Either<Failure,
      HomeGetLearnVideoResponse>> homeGetLearnVideoListRequest() async {
    return _handleRequest(() async {
      final videoResponse = await homeRemoteDatasource.homeGetLearnVideoListRequest();
      return videoResponse.toEntity();
    });
  }

  @override
  Future<Either<Failure, PracticeReviseNowResponse>> getReviseNowData() {
    return _handleRequest(() async {
      final reviseNow = await homeRemoteDatasource.getReviseNowData();
      return reviseNow.toEntity();
    });
  }

  @override
  Future<Either<Failure, FeatureConfigResponse>> getFeaturesRequest() {
    return _handleRequest(() async {
      final result = await homeRemoteDatasource.getFeaturesRequest();
      return result.toEntity();
    });
  }
}
