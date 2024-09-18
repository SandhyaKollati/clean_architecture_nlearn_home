import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_subjects_response.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_learn_subject_usecase.dart';
import '../../../../helper/home_repository_helper.dart';

void learnSubjectUsecaseTest() {
  late HomeLearnSubjectUseCase homeLearnSubjectUseCase;

  setUp(() {
    homeLearnSubjectUseCase = HomeLearnSubjectUseCase(homeRepository: mockHomeRepository);
  });

  const List<HomeGetLearnSubjectListResponse> testCourses = [
     HomeGetLearnSubjectListResponse(subjectId: '2', subjectName: 'Maths'),
  ];

  test('Should call the learn subject use case and return learn subject list', () async {
    when(mockHomeRepository.homeGetLearnSubjectListRequest())
        .thenAnswer((_) async => const Right(testCourses));

    final result = await homeLearnSubjectUseCase();

    expect(result, const Right(testCourses));
    verify(mockHomeRepository.homeGetLearnSubjectListRequest()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
