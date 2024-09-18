import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_revise_now_usecase.dart';
import '../../../../helper/home_repository_helper.dart';

void reviseNowStatusUsecaseTest() {
  late HomeReviseNowUseCase homeReviseNowUseCase;

  setUp(() {
    homeReviseNowUseCase = HomeReviseNowUseCase(homeRepository: mockHomeRepository);
  });

  const PracticeReviseNowResponse reviseNowResponse = PracticeReviseNowResponse(testsAttempted: 0, questionsToBeRevised: 0);

  test('Should call the revise now use case and return revise now list', () async {
    when(mockHomeRepository.getReviseNowData())
        .thenAnswer((_) async => const Right(reviseNowResponse));

    final result = await homeReviseNowUseCase();

    expect(result, const Right(reviseNowResponse));
    verify(mockHomeRepository.getReviseNowData()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
