import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_profile_response.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_user_profile_usecase.dart';
import '../../../../helper/home_repository_helper.dart';

void homeUserInfoUsecaseTest() {
  late HomeUserProfileUseCase homeUserProfileUseCase;

  setUp(() {
    homeUserProfileUseCase = HomeUserProfileUseCase(homeRepository: mockHomeRepository);
  });

  const UserProfileInformationResponse userInfo =
    UserProfileInformationResponse(studentId: '1', studentName: 'mgmt11learn123', displayName: 'FGHGHGHGHG');

  test('Should call the userInfo use case and return user list', () async {
    when(mockHomeRepository.getUserProfile())
        .thenAnswer((_) async => Right(userInfo));

    final result = await homeUserProfileUseCase();

    expect(result, Right(userInfo));
    verify(mockHomeRepository.getUserProfile()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
