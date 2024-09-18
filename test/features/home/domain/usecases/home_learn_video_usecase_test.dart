import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_video_response.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_learn_video_usecase.dart';
import '../../../../helper/home_repository_helper.dart';

void learnVideoUsecaseTest() {
  late HomeLearnVideoListUseCase homeLearnVideoListUseCase;

  setUp(() {
    homeLearnVideoListUseCase = HomeLearnVideoListUseCase(homeRepository: mockHomeRepository);
  });

  const HomeGetLearnVideoResponse learnVideoResponse = HomeGetLearnVideoResponse(heading: '', learnData: [LearnData(chapterId: '', videoName: '')]);

  test('Should call the learn video use case and return learn videos list', () async {
    when(mockHomeRepository.homeGetLearnVideoListRequest())
        .thenAnswer((_) async => Right(learnVideoResponse));

    final result = await homeLearnVideoListUseCase();

    expect(result, Right(learnVideoResponse));
    verify(mockHomeRepository.homeGetLearnVideoListRequest()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
