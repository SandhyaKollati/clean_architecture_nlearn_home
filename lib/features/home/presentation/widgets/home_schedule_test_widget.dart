import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_colors.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';

import '../../domain/entities/response/home_scheduled_test_response.dart';
import '../bloc/home_bloc.dart';

class HomeScheduleTest extends StatelessWidget {
  final List<HomeGetScheduledTestResponse>? homeGetScheduledTestResponse;
  const HomeScheduleTest({super.key, required this.homeGetScheduledTestResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 4, // Blur radius
            offset: const Offset(0, 2), // Offset of the shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upcoming",
            style: TextStyle(backgroundColor: Colors.red),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(AppIcons.graphicsIcon),
              const SizedBox(width: 10),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(homeGetScheduledTestResponse?.first.examName ?? "", style: const TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(width: 10),
                  const Text("60 Qs • 120 Mins • 120 Marks"),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8.0,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 0.8, // Spread radius
                        blurRadius: 0.8, // Blur radius
                        offset: const Offset(0, 2), // Offset of the shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.text_black_30.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(6), topLeft: Radius.circular(6)),
                        ),
                        child: const Text('Schedule From',
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text('2 Nov, 2023'),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text('10 : 00 AM'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 0.8, // Spread radius
                        blurRadius: 0.8, // Blur radius
                        offset: const Offset(0, 2), // Offset of the shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.text_black_30.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(6), topLeft: Radius.circular(6)),
                        ),
                        padding: const EdgeInsets.only(top: 5.0),
                        width: double.infinity,
                        child: const Text(
                          'Till',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('2 Nov, 2023'),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('10 : 00 AM'),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16.0,),
          Container(height: 1, color: AppColors.text_black_30.withOpacity(0.1)),
          const SizedBox(height: 5.0,),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(ScheduleTestNotifyMeClickedEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: const Text(
                    "Warm-up Test",
                    style: TextStyle(color: AppColors.gradient_blue_600),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(ScheduleTestWarmUpClickedEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: const Text(
                    "Notify Me",
                    style: TextStyle(color: AppColors.gradient_blue_600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
