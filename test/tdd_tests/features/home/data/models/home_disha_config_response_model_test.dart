import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_disha_config_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_disha_config_response.dart';

void dishaConfigModelTest() {

  const homeDishaConfigResponseDataModel = HomeDishaConfigResponseModel(dishaEndPoint: '');
  const homeDishaConfigResponseData = HomeDishaConfigResponse(dishaEndPoint: '');

  test('Should be a class of HomeDishaConfigResponseData', () async {
    expect(homeDishaConfigResponseDataModel, isA<HomeDishaConfigResponse>());
  });

  test('Should be a model and entity is same when we call to entity method', () async {
    expect(homeDishaConfigResponseDataModel.toEntity(), equals(homeDishaConfigResponseData));
  });
}