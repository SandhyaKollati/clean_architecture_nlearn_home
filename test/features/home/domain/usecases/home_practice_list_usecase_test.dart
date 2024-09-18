import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_practice_response.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_practice_list_usecase.dart';
import '../../../../helper/home_repository_helper.dart';

void practiceListUsecaseTest() {
  late HomePracticeListUseCase homePracticeListUseCase;

  setUp(() {
    homePracticeListUseCase = HomePracticeListUseCase(homeRepository: mockHomeRepository);
  });

  const HomeGetPracticeResponse practiceListResponse = HomeGetPracticeResponse(heading: '',practiceData: []);

  test('Should call the practice list use case and return practice list', () async {
    when(mockHomeRepository.homeGetPracticeListRequest())
        .thenAnswer((_) async => const Right(practiceListResponse));

    final result = await homePracticeListUseCase();

    expect(result, const Right(practiceListResponse));
    verify(mockHomeRepository.homeGetPracticeListRequest()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
