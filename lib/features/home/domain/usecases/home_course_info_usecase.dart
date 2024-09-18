import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/core/usecase/usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';
import 'package:nlearn_v3_home/features/home/domain/repository/home_repository.dart';

class HomeCourseInfoUseCase implements UseCase<List<CourseInformationResponse>> {
  HomeCourseInfoUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<CourseInformationResponse>>> call() async {
    return await homeRepository.homeGetCourseListRequest();
  }
}