import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/core/usecase/usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/repository/home_repository.dart';
import '../entities/response/home_learn_video_response.dart';

class HomeLearnVideoListUseCase implements UseCase<HomeGetLearnVideoResponse> {
  HomeLearnVideoListUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, HomeGetLearnVideoResponse>> call() async {
    return await homeRepository.homeGetLearnVideoListRequest();
  }
}