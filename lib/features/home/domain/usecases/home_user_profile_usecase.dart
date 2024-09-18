import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';
import 'package:nlearn_v3_home/core/usecase/usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/repository/home_repository.dart';

import '../entities/response/home_user_profile_response.dart';

class HomeUserProfileUseCase implements UseCase<UserProfileInformationResponse> {
  HomeUserProfileUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, UserProfileInformationResponse>> call() async {
    return await homeRepository.getUserProfile();
  }
}