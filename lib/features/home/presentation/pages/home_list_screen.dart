import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nlearn_v3_home/config/routes/routes.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_continue_from_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_disha_image_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_learn_subjects_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_narayana_logo_widget.dart';
import 'package:nlearn_v3_home/features/home/presentation/widgets/home_schedule_test_widget.dart';
import '../../../../core/utils/enums/home_section_type.dart';
import '../widgets/home_banners_widget.dart';
import '../widgets/home_just_for_you_widget.dart';
import '../widgets/home_revise_now_card_widget.dart';
import '../widgets/home_section_header_widget.dart';
import '../widgets/sliver_app_bar_widget.dart';

class HomeListScreen extends StatefulWidget {
  const HomeListScreen({super.key});

  @override
  State<HomeListScreen> createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  final ScrollController _scrollController = ScrollController();
  List<SectionType> sections = [];
  List<String> coursesNames = [];

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (BuildContext context, HomeState state) {
          switch (state.runtimeType) {
            case HomeLoadingFailureState:
              final failureState = state as HomeLoadingFailureState;
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(failureState.message)));
            case HomeLogoutState:
              Navigator.pushNamed(context, AppRouter.login.name);
            case OpenCourseSwitchBottomSheetState:
              if (coursesNames.length > 1) {
                _showBottomSheet(context);
              }
            default:
              Navigator.pushNamed(context, AppRouter.login.name).then((_) {
                context.read<HomeBloc>().add(HomeInitialEvent());
              });
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoadingSuccessState) {
            final successState = state;
            sections = getSectionsFromFeatures(successState);
            if (successState.courseInfo != null) {
              coursesNames =
                  (successState.courseInfo?.map((e) => e.name ?? '') ?? [])
                      .toList();
            }
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBarWidget(
                  scrollController: _scrollController,
                  headerTitle: successState.userProfile?.displayName ?? "",
                  courseSwitchTitle: successState.courseInfo?.first.name ?? "",
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: sections.length,
                    (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeSectionHeaderWidget(
                            headerText: _getSectionHeaderText(sections[index]),
                            sectionType: sections[index],
                          ),
                          _getSectionWidget(sections[index], successState),
                          const SizedBox(height: 16.0),
                          // Added spacing between sections
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _getSectionWidget(SectionType section, HomeLoadingSuccessState state) {
    switch (section) {
      case SectionType.trendingNow:
        final justForYouFeatures = state.userFeatures?.home;
        return HomeJustForYouWidget(
          warmUpTestStatus: justForYouFeatures?.disableWarmupTests ?? false,
          reviseNowStatus: justForYouFeatures?.disableReviseNow ?? false,
          interactiveScrollStatus:
              justForYouFeatures?.disableInteractive ?? false,
        );
      case SectionType.continueFrom:
        return HomeContinueFrom(
          learnList: state.learnVideos?.learnData,
          practiceList: state.practiceList?.practiceData,
        );
      case SectionType.learnSubjects:
        return HomeLearnSubjects(data: state.learnSubjects);
      case SectionType.scheduledTest:
        return HomeScheduleTest(
            homeGetScheduledTestResponse: state.scheduledTests);
      case SectionType.reviseNow:
        return HomeReviseNowCardWidget(reviseNowResponse: state.reviseNow);
      case SectionType.assignments:
        return Container();
      case SectionType.counselling:
        return const HomeDishaConfigImage();
      case SectionType.achievements:
        return Container();
      case SectionType.liveClass:
        return Container();
      case SectionType.logo:
        return const HomeNaryanaLogoWidget();
      case SectionType.staticBanners:
        return const HomeBannersWidget();
      default:
        return Container();
    }
  }

  String _getSectionHeaderText(SectionType section) {
    switch (section) {
      case SectionType.trendingNow:
        return 'Just For You!';
      case SectionType.continueFrom:
        return 'Continue From Where You Left';
      case SectionType.learnSubjects:
        return 'Pick A Subject To Learn';
      case SectionType.scheduledTest:
        return 'Scheduled Test';
      case SectionType.reviseNow:
        return 'Revise Now!';
      case SectionType.assignments:
        return 'Assignments';
      case SectionType.counselling:
        return 'Meet Our Experts';
      case SectionType.achievements:
        return 'Achievements';
      case SectionType.liveClass:
        return 'Live Classes';
      case SectionType.logo:
      case SectionType.staticBanners:
        return ''; // No header for these sections
      default:
        return '';
    }
  }

  List<SectionType> getSectionsFromFeatures(HomeLoadingSuccessState state) {
    List<SectionType> sections = [];
    final features = state.userFeatures?.home;

    sections.add(SectionType.staticBanners);

    if (features != null) {
      if (!features.disableTrendingNow) {
        sections.add(SectionType.trendingNow);
      }
      if (!features.disableLearn) {
        if (state.learnSubjects != null && state.learnSubjects!.isNotEmpty) {
          sections.add(SectionType.learnSubjects);
        }
        if ((state.learnVideos != null &&
                state.learnVideos!.learnData.isNotEmpty) ||
            !features.disablePractice) {
          sections.add(SectionType.continueFrom);
        }
      }
      if (!features.disableTests) {
        sections.add(SectionType.scheduledTest);
      }
      if (!features.disableReviseNow) {
        sections.add(SectionType.reviseNow);
      }
      if (!features.disableCounselling) {
        sections.add(SectionType.counselling);
      }
    }
    sections.add(SectionType.logo);
    return sections;
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: coursesNames.length * 100, // Set height for the bottom sheet
          child: ListView.builder(
            itemCount: coursesNames.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(coursesNames[index]),
              );
            },
          ),
        );
      },
    );
  }
}
