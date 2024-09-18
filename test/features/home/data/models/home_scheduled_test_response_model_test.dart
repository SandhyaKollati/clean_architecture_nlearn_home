import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_scheduled_test_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_scheduled_test_response.dart';

void scheduleTestResponseModelTest() {
  const homeGetScheduledTestResponseModel = HomeGetScheduledTestResponseModel(examName: '');
  const homeGetScheduledTestResponse = HomeGetScheduledTestResponse(examName: '');

  test('Should be a class of HomeGetScheduledTestResponse', () async {
    expect(homeGetScheduledTestResponseModel, isA<HomeGetScheduledTestResponse>());
  });

  test('Should be a model and entity is same when we call to entity method', () async {
    expect(homeGetScheduledTestResponseModel.toEntity(), equals(homeGetScheduledTestResponse));
  });
}