import 'package:mockito/annotations.dart';
import 'package:nlearn_v3_home/core/network/api_service.dart';
import 'package:nlearn_v3_home/features/home/data/datasources/remote/home_remote_data_source.dart';
import 'package:nlearn_v3_home/features/home/domain/repository/home_repository.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_course_info_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_disha_config_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_learn_subject_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_learn_video_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_practice_list_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_revise_now_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_scheduled_test_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_user_features_usecase.dart';
import 'package:nlearn_v3_home/features/home/domain/usecases/home_user_profile_usecase.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';

@GenerateMocks(
    [HomeRepository, BaseApiService, HomeRemoteDatasource, HomeCourseInfoUseCase, HomeLearnVideoListUseCase, HomeLearnSubjectUseCase, HomePracticeListUseCase, HomeReviseNowUseCase, HomeScheduledTestUseCase, HomeUserFeaturesUseCase, HomeUserProfileUseCase, HomeDishaConfigUseCase]
)
void main() {}