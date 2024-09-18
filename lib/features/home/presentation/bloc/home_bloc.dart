import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_disha_config_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_learn_video_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_practice_list_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_revise_now_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_scheduled_test_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_user_features_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_course_info_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_learn_subject_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_user_profile_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_course_info_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_disha_config_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_subjects_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_learn_video_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_scheduled_test_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_features_response.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_user_profile_response.dart';
import '../../../../core/network/api_result.dart';
import '../../domain/entities/response/home_learn_practice_response.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUserProfileUseCase _homeUserProfileUseCase;
  final HomeCourseInfoUseCase _homeCourseInfoUseCase;
  final HomeDishaConfigUseCase _homeDishaConfigUseCase;
  final HomeLearnSubjectUseCase _homeLearnSubjectUseCase;
  final HomeLearnVideoListUseCase _homeLearnVideoListUseCase;
  final HomePracticeListUseCase _homePracticeListUseCase;
  final HomeReviseNowUseCase _homeReviseNowUseCase;
  final HomeScheduledTestUseCase _homeScheduledTestUseCase;
  final HomeUserFeaturesUseCase _homeUserFeaturesUseCase;

  HomeBloc({
    required HomeUserProfileUseCase homeUserProfileUseCase,
    required HomeCourseInfoUseCase homeCourseInfoUseCase,
    required HomeDishaConfigUseCase homeDishaConfigUseCase,
    required HomeLearnSubjectUseCase homeLearnSubjectUseCase,
    required HomeLearnVideoListUseCase homeLearnVideoListUseCase,
    required HomePracticeListUseCase homePracticeListUseCase,
    required HomeReviseNowUseCase homeReviseNowUseCase,
    required HomeScheduledTestUseCase homeScheduledTestUseCase,
    required HomeUserFeaturesUseCase homeUserFeaturesUseCase,
  })  : _homeUserProfileUseCase = homeUserProfileUseCase,
        _homeCourseInfoUseCase = homeCourseInfoUseCase,
        _homeDishaConfigUseCase = homeDishaConfigUseCase,
        _homeLearnSubjectUseCase = homeLearnSubjectUseCase,
        _homeLearnVideoListUseCase = homeLearnVideoListUseCase,
        _homePracticeListUseCase = homePracticeListUseCase,
        _homeReviseNowUseCase = homeReviseNowUseCase,
        _homeScheduledTestUseCase = homeScheduledTestUseCase,
        _homeUserFeaturesUseCase = homeUserFeaturesUseCase,
        super(HomeInitial()) {
    on<HomeInitialEvent>(_onHomeInitialEvent);
    on<CourseSwitchClickedEvent>(_courseSwitchClickedEvent);
    on<MenuIconClickedEvent>(_menuIconClickedEvent);
    on<NotificationIconClickedEvent>(_notificationIconClickedEvent);
    on<WarmUpTestClickedEvent>(_onWarmUpTestClickedEvent);
    on<ReviseNowClickedEvent>(_onReviseNowClickedEvent);
    on<InteractiveScrollsClickedEvent>(_onInteractiveScrollsClickedEvent);
    on<LearnVideoCardClickedEvent>(_onLearnVideoCardClickedEvent);
    on<PracticeCardClickedEvent>(_onPracticeCardClickedEvent);
    on<ViewMorePracticeClickedEvent>(_onViewMorePracticeClickedEvent);
    on<ScheduleTestViewAllClickedEvent>(_onScheduleTestViewAllClickedEvent);
    on<ScheduleTestWarmUpClickedEvent>(_onScheduleTestWarmUpClickedEvent);
    on<ScheduleTestNotifyMeClickedEvent>(_onScheduleTestNotifyMeClickedEvent);
    on<ReviseNowViewAllClickedEvent>(_onReviseNowViewAllClickedEvent);
    on<ReviseNowReviseLatestClickedEvent>(_onReviseNowReviseLatestClickedEvent);
    on<DishaBannerClickedEvent>(_onDishaBannerClickedEvent);
    on<LearnSubjectCardClickedEvent>(_onLearnSubjectCardClickedEvent);
  }

  Future<void> _onHomeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    try {
      final userFeaturesResult = await _callApi(_homeUserFeaturesUseCase.call);
      final userProfileResult = await _callApi(_homeUserProfileUseCase.call);
      final courseInfoResult = await _callApi(_homeCourseInfoUseCase.call);
      final scheduledTestResult =
          await _callApi(_homeScheduledTestUseCase.call);
      final learnSubjectResult = await _callApi(_homeLearnSubjectUseCase.call);
      final learnVideoResult = await _callApi(_homeLearnVideoListUseCase);
      final practiceListResult = await _callApi(_homePracticeListUseCase.call);
      final reviseNowResult = await _callApi(_homeReviseNowUseCase.call);
      final dishaConfigResult = await _callApi(_homeDishaConfigUseCase.call);

      emit(HomeLoadingSuccessState(
        userProfile: userProfileResult,
        courseInfo: courseInfoResult,
        dishaConfig: dishaConfigResult,
        learnSubjects: learnSubjectResult,
        learnVideos: learnVideoResult,
        practiceList: practiceListResult,
        reviseNow: reviseNowResult,
        scheduledTests: scheduledTestResult,
        userFeatures: userFeaturesResult,
      ));
    } catch (e) {
      if (_isSessionExpired(Failure(e.toString()))) {
        emit(HomeLogoutState());
      } else {
        emit(HomeLoadingFailureState(e.toString()));
      }
    }
  }

  Future<T?> _callApi<T>(Future<Either<Failure, T>> Function() apiCall) async {
    final result = await apiCall();
    return result.fold(
      (failure) {
        debugPrint('failure ${failure.errorMessage}');
        throw Exception(failure.errorMessage);
      },
      (value) {
        debugPrint("response $value");
        return value;
      },
    );
  }

  bool _isSessionExpired(Failure failure) {
    return failure.errorMessage.contains('session expired');
  }

  FutureOr<void> _courseSwitchClickedEvent(
      CourseSwitchClickedEvent event, Emitter<HomeState> emit) {
    emit(OpenCourseSwitchBottomSheetState());
  }

  FutureOr<void> _menuIconClickedEvent(
      MenuIconClickedEvent event, Emitter<HomeState> emit) {
    emit(OpenSideMenuState());
  }

  FutureOr<void> _notificationIconClickedEvent(
      NotificationIconClickedEvent event, Emitter<HomeState> emit) {
    emit(NavigateToNotificationState());
  }

  FutureOr<void> _onLearnVideoCardClickedEvent(
      LearnVideoCardClickedEvent event, Emitter<HomeState> emit) {
    emit(LearnVideoClickedState());
  }

  FutureOr<void> _onLearnSubjectCardClickedEvent(
      LearnSubjectCardClickedEvent event, Emitter<HomeState> emit) {
    emit(LearnSubjectCardClickedState(subject: event.subject));
  }
}

FutureOr<void> _onWarmUpTestClickedEvent(
    WarmUpTestClickedEvent event, Emitter<HomeState> emit) {
  emit(WarmUpTestClickedState());
}

FutureOr<void> _onReviseNowClickedEvent(
    ReviseNowClickedEvent event, Emitter<HomeState> emit) {
  emit(ReviseNowClickedState());
}

FutureOr<void> _onInteractiveScrollsClickedEvent(
    InteractiveScrollsClickedEvent event, Emitter<HomeState> emit) {
  emit(InteractiveScrollsClickedState());
}

FutureOr<void> _onPracticeCardClickedEvent(
    PracticeCardClickedEvent event, Emitter<HomeState> emit) {
  emit(PracticeCardClickedState());
}

FutureOr<void> _onViewMorePracticeClickedEvent(
    ViewMorePracticeClickedEvent event, Emitter<HomeState> emit) {
  emit(ViewMorePracticeClickedState());
}

FutureOr<void> _onScheduleTestViewAllClickedEvent(
    ScheduleTestViewAllClickedEvent event, Emitter<HomeState> emit) {
  emit(ScheduleTestViewAllClickedState());
}

FutureOr<void> _onScheduleTestWarmUpClickedEvent(
    ScheduleTestWarmUpClickedEvent event, Emitter<HomeState> emit) {
  emit(ScheduleTestWarmUpClickedState());
}

FutureOr<void> _onScheduleTestNotifyMeClickedEvent(
    ScheduleTestNotifyMeClickedEvent event, Emitter<HomeState> emit) {
  emit(ScheduleTestNotifyMeClickedState());
}

FutureOr<void> _onReviseNowViewAllClickedEvent(
    ReviseNowViewAllClickedEvent event, Emitter<HomeState> emit) {
  emit(ReviseNowViewAllClickedState());
}

FutureOr<void> _onReviseNowReviseLatestClickedEvent(
    ReviseNowReviseLatestClickedEvent event, Emitter<HomeState> emit) {
  emit(ReviseNowReviseLatestClickedState());
}

FutureOr<void> _onDishaBannerClickedEvent(
    DishaBannerClickedEvent event, Emitter<HomeState> emit) {
  emit(DishaBannerClickedState());
}
