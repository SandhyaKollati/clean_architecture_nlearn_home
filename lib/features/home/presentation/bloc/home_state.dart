part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {}

sealed class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadingSuccessState extends HomeState {
  final UserProfileInformationResponse? userProfile;
  final List<CourseInformationResponse>? courseInfo;
  final HomeDishaConfigResponse? dishaConfig;
  final List<HomeGetLearnSubjectListResponse>? learnSubjects;
  final HomeGetLearnVideoResponse? learnVideos;
  final HomeGetPracticeResponse? practiceList;
  final PracticeReviseNowResponse? reviseNow;
  final List<HomeGetScheduledTestResponse>? scheduledTests;
  final FeatureConfigResponse? userFeatures;

  HomeLoadingSuccessState({
    this.userProfile,
    this.courseInfo,
    this.dishaConfig,
    this.learnSubjects,
    this.learnVideos,
    this.practiceList,
    this.reviseNow,
    this.scheduledTests,
    this.userFeatures,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userFeatures,
        userProfile,
        courseInfo,
        dishaConfig,
        learnVideos,
        learnSubjects,
        practiceList,
        reviseNow,
        scheduledTests
      ];
}

class HomeLoadingFailureState extends HomeActionState {
  final String message;

  HomeLoadingFailureState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class OpenCourseSwitchBottomSheetState extends HomeActionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NavigateToNotificationState extends HomeActionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenSideMenuState extends HomeActionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLogoutState extends HomeActionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WarmUpTestClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class ReviseNowClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class InteractiveScrollsClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class LearnVideoClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class PracticeCardClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class ViewMorePracticeClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class ScheduleTestViewAllClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class ScheduleTestWarmUpClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class ScheduleTestNotifyMeClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class ReviseNowViewAllClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class ReviseNowReviseLatestClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}

class LearnSubjectCardClickedState extends HomeActionState {
  final HomeGetLearnSubjectListResponse subject;

  LearnSubjectCardClickedState({required this.subject});
  @override
  List<Object?> get props => [];
}

class DishaBannerClickedState extends HomeActionState {
  @override
  List<Object?> get props => [];
}
