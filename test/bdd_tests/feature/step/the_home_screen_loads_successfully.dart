import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_features_response.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import '../../../tdd_tests/features/home/presentation/pages/home_list_screen_test.dart';

/// Usage: the home screen loads successfully
Future<void> theHomeScreenLoadsSuccessfully(WidgetTester tester, MockHomeBloc mockHomeBloc) async {
  when(() => mockHomeBloc.state).thenReturn(HomeLoadingSuccessState(
    userFeatures: const FeatureConfigResponse(
      home: HomeFeatures(
        disableWarmupTests: false,
        disableTrendingNow: true,
        disableLearn: false,
        disablePractice: false,
        disableTimetable: false,
        disableLiveClasses: false,
        disableAssignments: false,
        disableTests: false,
        disableAchievements: false,
        disableFunZone: false,
        disableCounselling: true,
        disableFunScrolls: false,
        disableEChronicle: false,
        disableReviseNow: true,
        disableInteractive: false,
      ),
    ),
    courseInfo: const [
      CourseInformationResponse(id: '1', name: 'Test Course')
    ],
  ));
}
