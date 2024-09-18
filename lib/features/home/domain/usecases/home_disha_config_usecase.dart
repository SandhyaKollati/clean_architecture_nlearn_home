import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/core/usecase/usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_disha_config_response.dart';
import 'package:nlearn_v3_home/features/home/domain/repository/home_repository.dart';

class HomeDishaConfigUseCase implements UseCase<HomeDishaConfigResponse> {
  HomeDishaConfigUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, HomeDishaConfigResponse>> call() async {
    return await homeRepository.getDishaConfigRequest();
  }
}