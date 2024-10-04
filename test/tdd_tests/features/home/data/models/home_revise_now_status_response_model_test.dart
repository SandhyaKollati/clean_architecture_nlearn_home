import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_revise_now_status_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';

void reviseNowStatusModelTest() {
  const practiceReviseNowResponseModel = PracticeReviseNowResponseModel(testsAttempted: 0, questionsToBeRevised: 0);
  const practiceReviseNowResponse = PracticeReviseNowResponse(testsAttempted: 0, questionsToBeRevised: 0);

  test('Should be a class of PracticeReviseNowResponse', () async {
    expect(practiceReviseNowResponseModel, isA<PracticeReviseNowResponse>());
  });

  test('Should be a model and entity is same when we call to entity method', () async {
    expect(practiceReviseNowResponseModel.toEntity(), equals(practiceReviseNowResponse));
  });
}