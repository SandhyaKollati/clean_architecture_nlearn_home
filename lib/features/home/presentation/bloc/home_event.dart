part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}
class CourseSwitchClickedEvent extends HomeEvent {}
class MenuIconClickedEvent extends HomeEvent {}
class NotificationIconClickedEvent extends HomeEvent {}
class WarmUpTestClickedEvent extends HomeEvent {}
class ReviseNowClickedEvent extends HomeEvent {}
class InteractiveScrollsClickedEvent extends HomeEvent {}
class LearnVideoCardClickedEvent extends HomeEvent {}
class LearnSubjectCardClickedEvent extends HomeEvent {
  final HomeGetLearnSubjectListResponse subject;
  LearnSubjectCardClickedEvent({required this.subject});
}
class PracticeCardClickedEvent extends HomeEvent {}
class ViewMorePracticeClickedEvent extends HomeEvent {}
class ScheduleTestViewAllClickedEvent extends HomeEvent {}
class ScheduleTestWarmUpClickedEvent extends HomeEvent {}
class ScheduleTestNotifyMeClickedEvent extends HomeEvent {}
class ReviseNowViewAllClickedEvent extends HomeEvent {}
class ReviseNowReviseLatestClickedEvent extends HomeEvent {}
class DishaBannerClickedEvent extends HomeEvent {}
