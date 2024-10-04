import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_video_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_video_response.dart';

void learnVideosResponseModelTest() {
  const homeGetLearnVideoResponseModel = HomeGetLearnVideoResponseModel(heading: '', learnData: []);
  const homeGetLearnVideoResponse = HomeGetLearnVideoResponse(heading: '', learnData: []);

  test('Should be a class of HomeGetLearnVideoResponse', () async {
    expect(homeGetLearnVideoResponseModel, isA<HomeGetLearnVideoResponse>());
  });

  test('Should be a model and entity is same when we call to entity method', () async {
    expect(homeGetLearnVideoResponseModel.toEntity(), equals(homeGetLearnVideoResponse));
  });
}