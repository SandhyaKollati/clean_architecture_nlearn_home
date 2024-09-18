import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_course_info_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';
import 'package:mockito/mockito.dart';
import '../../../../helper/home_repository_helper.dart';

void courseInfoUsecaseTest() {
  late HomeCourseInfoUseCase homeCourseInfoUseCase;

  setUp(() {
    homeCourseInfoUseCase = HomeCourseInfoUseCase(homeRepository: mockHomeRepository);
  });

  const List<CourseInformationResponse> testCourses = [
    CourseInformationResponse(id: '1', name: 'Jee advanced'),
    CourseInformationResponse(id: '2', name: 'Jee advanced')
  ];

  test('Should call the courseInfo use case and return course list', () async {
    when(mockHomeRepository.homeGetCourseListRequest())
        .thenAnswer((_) async => Right(testCourses));

    final result = await homeCourseInfoUseCase();

    expect(result, Right(testCourses));
    verify(mockHomeRepository.homeGetCourseListRequest()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
