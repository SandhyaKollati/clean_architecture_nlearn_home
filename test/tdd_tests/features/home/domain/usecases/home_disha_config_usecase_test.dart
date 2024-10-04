import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_disha_config_response.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_disha_config_usecase.dart';
import '../../../../helper/home_repository_helper.dart';

void homeUserInfoUsecaseTest() {
  late HomeDishaConfigUseCase homeDishaConfigUseCase;

  setUp(() {
    homeDishaConfigUseCase = HomeDishaConfigUseCase(homeRepository: mockHomeRepository);
  });

  const homeDishaConfigResponseData = HomeDishaConfigResponse(dishaEndPoint: '');


  test('Should call the userInfo use case and return user list', () async {
    when(mockHomeRepository.getDishaConfigRequest())
        .thenAnswer((_) async => const Right(homeDishaConfigResponseData));

    final result = await homeDishaConfigUseCase;

    expect(result, const Right(homeDishaConfigResponseData));
    verify(mockHomeRepository.getUserProfile()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
