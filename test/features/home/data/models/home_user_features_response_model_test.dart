import 'package:flutter_test/flutter_test.dart';
import 'package:nlearn_v3_home/features/home/data/models/home_user_features_response_model.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_features_response.dart';

void userFeaturesModelTest() {
  const userFeaturesModel = FeatureConfigResponseModel(home: HomeFeaturesModel(
      disableLearn: false , disablePractice: false,
      disableTimetable: false,
      disableLiveClasses: false,
      disableAssignments: false,
      disableTests: false,
      disableAchievements: false,
      disableFunZone: false,
      disableCounselling: false,
      disableFunScrolls: false,
      disableEChronicle: false,
      disableReviseNow: false,
      disableInteractive: false,
      disableTrendingNow: false, disableWarmupTests: false));

  const userFeatures = FeatureConfigResponse(home: HomeFeatures(
      disableLearn: false , disablePractice: false,
      disableTimetable: false,
      disableLiveClasses: false,
      disableAssignments: false,
      disableTests: false,
      disableAchievements: false,
      disableFunZone: false,
      disableCounselling: false,
      disableFunScrolls: false,
      disableEChronicle: false,
      disableReviseNow: false,
      disableInteractive: false,
      disableTrendingNow: false, disableWarmupTests: false));

  test('Should be a class of Feature Config Response', () async {
    expect(userFeaturesModel, isA<FeatureConfigResponse>());
  });

  test('Should be a model and entity is same when we call to entity method', () async {
    expect(userFeaturesModel.toEntity(), equals(userFeatures));
  });
}