import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_colors.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/response/home_learn_practice_response.dart';
import '../../domain/entities/response/home_learn_video_response.dart';

class HomeContinueFrom extends StatelessWidget {
  final List<LearnData>? learnList;
  final List<PracticeData>? practiceList;

  const HomeContinueFrom({
    super.key,
    this.learnList,
    this.practiceList,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _continueFromTabList().length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            color: Colors.white,
            child: TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                color: AppColors.gradient_blue_600.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4.0)),
                border: const Border(
                  bottom: BorderSide(
                    color: AppColors.gradient_blue_600,
                    width: 3.0,
                  ),
                ),
              ),
              labelColor: AppColors.gradient_blue_600,
              unselectedLabelColor: Colors.black,
              tabs: _continueFromTabList(),
            ),
          ),
          SizedBox(
            height: 200, // Adjust as needed
            child: TabBarView(
              children: [
                if (learnList != null && (learnList?.isNotEmpty ?? false))
                  _buildLearnContent(context),
                if (practiceList != null && (practiceList?.isNotEmpty ?? false))
                  _buildPracticeContent(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnContent(BuildContext context) {
    return Container(
      color: AppColors.gradient_blue_300.withOpacity(0.1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 24.0, left: 8.0, bottom: 24.0),
        itemCount: learnList?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            key: Key('learnVideo_$index'),
            onTap: () {
              context.read<HomeBloc>().add(LearnVideoCardClickedEvent());
            },
            child: Container(
              margin: const EdgeInsets.only(left: 8.0, right: 8.0),
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black38.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8)),
                          ),
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "1:58",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 0.8,
                                  blurRadius: 0.8,
                                  offset: const Offset(0, 0.8),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(AppIcons.playIcon),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(learnList?[index].videoName ?? ""),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPracticeContent(BuildContext context) {
    return Container(
      color: AppColors.gradient_blue_300.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              "JEE Mains",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: practiceList?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  key: Key('practiceCard_$index'),
                  onTap: () {
                    context.read<HomeBloc>().add(PracticeCardClickedEvent());
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 12.0,
                      top: 8.0,
                    ),
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          practiceList?[index].topicName ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.difficultyImage,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Column(
                              children: [
                                Text('Easy',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('9/15 Qs')
                              ],
                            ), // Adjust according to your data model
                            const Spacer(),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: SvgPicture.asset(
                                      AppIcons.defaultSubjectIcon),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: TextButton(
                key: const Key('viewMorePractice'),
                onPressed: () {
                  context.read<HomeBloc>().add(ViewMorePracticeClickedEvent());
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View More Practice',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 16.0,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  List<Widget> _continueFromTabList() {
    List<Tab> tabs = [];

    if (learnList != null && (learnList?.isNotEmpty ?? false)) {
      tabs.add(const Tab(text: 'Learn Videos'));
    }
    if (practiceList != null && (practiceList?.isNotEmpty ?? false)) {
      tabs.add(const Tab(text: "Practice"));
    }
    return tabs;
  }
}
