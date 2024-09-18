import 'package:get_it/get_it.dart';
import 'package:nlearn_v3_home/core/network/api_service.dart';
import 'package:nlearn_v3_home/features/home/data/datasources/remote/home_remote_data_source_impl.dart';
import 'package:nlearn_v3_home/features/home/data/repositories/home_repository_impl.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_course_info_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_disha_config_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_learn_subject_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_learn_video_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_practice_list_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_revise_now_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_scheduled_test_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_user_features_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_user_profile_usecase.dart';
import '../features/home/data/datasources/remote/home_remote_data_source.dart';
import '../features/home/domain/repository/home_repository.dart';
import '../features/home/presentation/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  // Register the API service
  serviceLocator.registerLazySingleton<BaseApiService>(() => BaseApiService());

  // Register the remote data source
  serviceLocator.registerLazySingleton<HomeRemoteDatasource>(
        () => HomeRemoteDataSourceImplementation(apiService: serviceLocator()),
  );

  // Register the repository
  serviceLocator.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(homeRemoteDatasource: serviceLocator()),
  );

  // Register all use cases
  serviceLocator.registerLazySingleton<HomeUserProfileUseCase>(
        () => HomeUserProfileUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeCourseInfoUseCase>(
        () => HomeCourseInfoUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeDishaConfigUseCase>(
        () => HomeDishaConfigUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeLearnSubjectUseCase>(
        () => HomeLearnSubjectUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeLearnVideoListUseCase>(
        () => HomeLearnVideoListUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomePracticeListUseCase>(
        () => HomePracticeListUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeReviseNowUseCase>(
        () => HomeReviseNowUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeScheduledTestUseCase>(
        () => HomeScheduledTestUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeUserFeaturesUseCase>(
        () => HomeUserFeaturesUseCase(homeRepository: serviceLocator()),
  );

  // Register the HomeBloc
  serviceLocator.registerFactory<HomeBloc>(
        () => HomeBloc(
      homeUserProfileUseCase: serviceLocator(),
      homeCourseInfoUseCase: serviceLocator(),
      homeDishaConfigUseCase: serviceLocator(),
      homeLearnSubjectUseCase: serviceLocator(),
      homeLearnVideoListUseCase: serviceLocator(),
      homePracticeListUseCase: serviceLocator(),
      homeReviseNowUseCase: serviceLocator(),
      homeScheduledTestUseCase: serviceLocator(),
      homeUserFeaturesUseCase: serviceLocator(),
    ),
  );
}
