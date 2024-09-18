import 'package:equatable/equatable.dart';

class FeatureConfigResponse extends Equatable {
  final HomeFeatures home;
  const FeatureConfigResponse({required this.home});

  @override
  // TODO: implement props
  List<Object?> get props => [home];
}

class HomeFeatures extends Equatable {
  final bool disableLearn, disablePractice, disableTimetable, disableLiveClasses,
      disableAssignments, disableTests, disableAchievements, disableFunZone,
      disableCounselling, disableFunScrolls, disableEChronicle, disableReviseNow,
      disableInteractive, disableTrendingNow, disableWarmupTests;

  const HomeFeatures({
    required this.disableLearn,
    required this.disablePractice,
    required this.disableTimetable,
    required this.disableLiveClasses,
    required this.disableAssignments,
    required this.disableTests,
    required this.disableAchievements,
    required this.disableFunZone,
    required this.disableCounselling,
    required this.disableFunScrolls,
    required this.disableEChronicle,
    required this.disableReviseNow,
    required this.disableInteractive,
    required this.disableTrendingNow,
    required this.disableWarmupTests,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    disableLearn,
    disablePractice,
    disableTimetable,
    disableLiveClasses,
    disableAssignments,
    disableTests,
    disableAchievements,
    disableFunZone,
    disableCounselling,
    disableFunScrolls,
    disableReviseNow,
    disableEChronicle,
    disableInteractive,
    disableTrendingNow,
    disableWarmupTests,
  ];
}
