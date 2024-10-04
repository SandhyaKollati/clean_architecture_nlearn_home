import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_features_response.dart';
import 'package:mockito/mockito.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_user_features_usecase.dart';
import '../../../../helper/home_repository_helper.dart';

void userFeaturesUsecaseTest() {
  late HomeUserFeaturesUseCase homeUserFeaturesUseCase;

  setUp(() {
    homeUserFeaturesUseCase = HomeUserFeaturesUseCase(homeRepository: mockHomeRepository);
  });

  const FeatureConfigResponse featuresList =  FeatureConfigResponse(home: HomeFeatures(disableLearn: false, disablePractice: false, disableTimetable: false, disableLiveClasses: false, disableAssignments: false, disableTests: false, disableAchievements: false, disableFunZone: false, disableCounselling: false, disableFunScrolls: false, disableEChronicle: false, disableReviseNow: false, disableInteractive: false, disableTrendingNow: false, disableWarmupTests: false, ));

  test('Should call the userfeatures use case and return features list', () async {
    when(mockHomeRepository.getFeaturesRequest())
        .thenAnswer((_) async => const Right(featuresList));

    final result = await homeUserFeaturesUseCase();

    expect(result, const Right(featuresList));
    verify(mockHomeRepository.getFeaturesRequest()).called(1);
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
