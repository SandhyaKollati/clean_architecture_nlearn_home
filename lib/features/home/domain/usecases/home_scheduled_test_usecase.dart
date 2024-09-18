import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/core/usecase/usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/repository/home_repository.dart';
import '../entities/response/home_scheduled_test_response.dart';

class HomeScheduledTestUseCase implements UseCase<List<HomeGetScheduledTestResponse>> {
  HomeScheduledTestUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<HomeGetScheduledTestResponse>>> call() async {
    return await homeRepository.homeGetScheduledTestRequest();
  }
}