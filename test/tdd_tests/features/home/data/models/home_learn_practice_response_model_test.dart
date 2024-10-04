import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_practice_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_practice_response.dart';

void practiceListResponseModelTest() {
  const homeGetLearnPracticeResponseModel = HomeGetPracticeResponseModel(heading: '', practiceData: []);
  const homeGetLearnPracticeResponse = HomeGetPracticeResponse(heading: '', practiceData: []);

  test('Should be a class of HomeGetLearnPracticeResponse', () async {
    expect(homeGetLearnPracticeResponseModel, isA<HomeGetPracticeResponse>());
  });

  test('Should be a model and entity is same when we call to entity method', () async {
    expect(homeGetLearnPracticeResponseModel.toEntity(), equals(homeGetLearnPracticeResponse));
  });
}