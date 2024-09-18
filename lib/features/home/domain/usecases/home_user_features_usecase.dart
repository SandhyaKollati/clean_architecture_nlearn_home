import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/core/usecase/usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/repository/home_repository.dart';
import '../entities/response/home_user_features_response.dart';

class HomeUserFeaturesUseCase implements UseCase<FeatureConfigResponse> {
  HomeUserFeaturesUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, FeatureConfigResponse>> call() async {
    return await homeRepository.getFeaturesRequest();
  }
}