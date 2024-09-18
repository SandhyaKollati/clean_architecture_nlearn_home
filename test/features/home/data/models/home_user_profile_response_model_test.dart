import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_user_profile_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_profile_response.dart';

void userProfileResponseModelTest() {
  const userProfileInformationModel = UserProfileInformationResponseModel(studentId: '', displayName: '', studentName: '');
  const userProfileInformation = UserProfileInformationResponse(studentId: '', displayName: '', studentName: '');

  test('Should be a class of UserProfileInformation', () async {
    expect(userProfileInformationModel, isA<UserProfileInformationResponse>());
  });

  test('Should be a model and entity is same when we call to entity method', () async {
    expect(userProfileInformationModel.toEntity(), equals(userProfileInformation));
  });
}