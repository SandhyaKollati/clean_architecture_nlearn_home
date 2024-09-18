import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_learn_subjects_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_subjects_response.dart';

void learnSubjectsResponseModelTest() {

  const homeGetLearnSubjectListResponseModel = HomeGetLearnSubjectListResponseModel(subjectId: "", subjectName: "");
  const homeGetLearnSubjectListResponse = HomeGetLearnSubjectListResponse(subjectId: "", subjectName: "");

  test('Should be a class of HomeGetLearnSubjectListResponse', () async {
    expect(homeGetLearnSubjectListResponseModel, isA<HomeGetLearnSubjectListResponse>());
  });

  test('Should be a model and entity is same when we call to entity method', () async {
    expect(homeGetLearnSubjectListResponseModel.toEntity(), equals(homeGetLearnSubjectListResponse));
  });
}