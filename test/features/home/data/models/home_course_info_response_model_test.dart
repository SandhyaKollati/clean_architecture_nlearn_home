import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_course_info_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';

void courseInfoModelTest() {
  const testHomeCourseModel = CourseInformationResponseModel(id: "2", name: "CBSE");
  const testHomeCourse = CourseInformationResponse(id: "2", name: "CBSE");

  test('Should be a class of Course Information', () async {
    expect(testHomeCourseModel, isA<CourseInformationResponse>());
  });
  
  test('Should be a model and entity is same when we call to entity method', () async {
    expect(testHomeCourseModel.toEntity(), equals(testHomeCourse));
  });
}
