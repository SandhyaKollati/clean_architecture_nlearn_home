import '../../domain/entities/response/home_user_features_response.dart';

class FeatureConfigResponseModel extends FeatureConfigResponse {
  final HomeFeaturesModel home;

  const FeatureConfigResponseModel({required this.home}) : super(home: home);

  factory FeatureConfigResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final homeData = data['home'];
    return FeatureConfigResponseModel(
      home: HomeFeaturesModel.fromJson(homeData),
    );
  }

  FeatureConfigResponse toEntity() {
    return FeatureConfigResponse(
      home: home.toEntity(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'home': home.toJson(),
      },
    };
  }
}

class HomeFeaturesModel extends HomeFeatures {
  final bool disableLearn, disablePractice, disableTimetable, disableLiveClasses,
      disableAssignments, disableTests, disableAchievements, disableFunZone,
      disableCounselling, disableFunScrolls, disableEChronicle, disableReviseNow,
      disableInteractive, disableTrendingNow, disableWarmupTests;

  const HomeFeaturesModel({
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
  }) : super(
    disableLearn: disableLearn,
    disablePractice: disablePractice,
    disableTimetable: disableTimetable,
    disableLiveClasses: disableLiveClasses,
    disableAssignments: disableAssignments,
    disableTests: disableTests,
    disableAchievements: disableAchievements,
    disableFunZone: disableFunZone,
    disableCounselling: disableCounselling,
    disableFunScrolls: disableFunScrolls,
    disableEChronicle: disableEChronicle,
    disableReviseNow: disableReviseNow,
    disableInteractive: disableInteractive,
    disableTrendingNow: disableTrendingNow,
    disableWarmupTests: disableWarmupTests,
  );

  factory HomeFeaturesModel.fromJson(Map<String, dynamic> json) {
    return HomeFeaturesModel(
      disableLearn: json['disable_learn'] ?? false,
      disablePractice: json['disable_practice'] ?? false,
      disableTimetable: json['disable_timetable'] ?? false,
      disableLiveClasses: json['disable_live_classes'] ?? false,
      disableAssignments: json['disable_assignments'] ?? false,
      disableTests: json['disable_tests'] ?? false,
      disableAchievements: json['disable_achievements'] ?? false,
      disableFunZone: json['disable_fun_zone'] ?? false,
      disableCounselling: json['disable_counselling'] ?? false,
      disableFunScrolls: json['disable_fun_scrolls'] ?? false,
      disableEChronicle: json['disable_e_chronicle'] ?? false,
      disableReviseNow: json['disable_revise_now'] ?? false,
      disableInteractive: json['disable_interactive_scrolls'] ?? false,
      disableTrendingNow: json['disable_trending_now'] ?? false,
      disableWarmupTests: json['disable_warmup_tests'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'disable_learn': disableLearn,
      'disable_practice': disablePractice,
      'disable_timetable': disableTimetable,
      'disable_live_classes': disableLiveClasses,
      'disable_assignments': disableAssignments,
      'disable_tests': disableTests,
      'disable_achievements': disableAchievements,
      'disable_fun_zone': disableFunZone,
      'disable_counselling': disableCounselling,
      'disable_fun_scrolls': disableFunScrolls,
      'disable_e_chronicle': disableEChronicle,
      'disable_revise_now': disableReviseNow,
      'disable_interactive_scrolls': disableInteractive,
      'disable_trending_now': disableTrendingNow,
      'disable_warmup_tests': disableWarmupTests,
    };
  }

  HomeFeatures toEntity() {
    return HomeFeatures(
      disableLearn: disableLearn,
      disablePractice: disablePractice,
      disableTimetable: disableTimetable,
      disableLiveClasses: disableLiveClasses,
      disableAssignments: disableAssignments,
      disableTests: disableTests,
      disableAchievements: disableAchievements,
      disableFunZone: disableFunZone,
      disableCounselling: disableCounselling,
      disableFunScrolls: disableFunScrolls,
      disableEChronicle: disableEChronicle,
      disableReviseNow: disableReviseNow,
      disableInteractive: disableInteractive,
      disableTrendingNow: disableTrendingNow,
      disableWarmupTests: disableWarmupTests,
    );
  }
}
