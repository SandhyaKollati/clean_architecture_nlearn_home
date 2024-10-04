import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_scheduled_test_response.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_scheduled_test_usecase.dart';
import '../../../../helper/home_repository_helper.dart';

void scheduleTestUsecaseTest() {
  late HomeScheduledTestUseCase homeScheduledTestUseCase;

  setUp(() {
    homeScheduledTestUseCase = HomeScheduledTestUseCase(homeRepository: mockHomeRepository);
  });

  const List<HomeGetScheduledTestResponse> testCourses = [
    HomeGetScheduledTestResponse(examName: ''),
  ];

  test('Should call the schedule test use case and return schedule test list', () async {
    when(mockHomeRepository.homeGetScheduledTestRequest())
        .thenAnswer((_) async => Right(testCourses));

    final result = await homeScheduledTestUseCase();

    expect(result, Right(testCourses));
    verify(mockHomeRepository.homeGetScheduledTestRequest()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
