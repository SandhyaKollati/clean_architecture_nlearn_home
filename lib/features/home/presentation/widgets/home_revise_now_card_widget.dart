import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_colors.dart';
import 'package:nlearn_v3_home/features/home/domain/entities/response/home_revise_now_status_response.dart';

import '../bloc/home_bloc.dart';

class HomeReviseNowCardWidget extends StatelessWidget {
  final PracticeReviseNowResponse? reviseNowResponse;
  const HomeReviseNowCardWidget({super.key, this.reviseNowResponse});

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text('Revise your incorrectly answered & skipped questions'),
          ),
          const SizedBox(height: 16,),
          Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
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
            children: [
              Row(
                children: [
                  reviseNowDetails(
                    color: Colors.blue, // Replace with your AppColors
                    headingText: 'Tests Attempted',
                    detailText: reviseNowResponse?.testsAttempted.toString() ?? "0",
                  ),
                  const SizedBox(width: 24.0),
                  reviseNowDetails(
                    color: Colors.red, // Replace with your AppColors
                    headingText: 'Questions To Be revised',
                    detailText: reviseNowResponse?.questionsToBeRevised.toString() ?? "0",
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Container(height: 1, color: AppColors.text_black_30.withOpacity(0.1)),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add((ReviseNowViewAllClickedEvent()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                      child: const Text(
                        "VIEW ALL",
                        style: TextStyle(color: AppColors.gradient_blue_600),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add((ReviseNowReviseLatestClickedEvent()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                      child: const Text(
                        "REVISE LATEST!",
                        style: TextStyle(color: AppColors.gradient_blue_600),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
              ),
        ],
      );
  }
}

Widget reviseNowDetails({
  required Color color,
  required String headingText,
  required String detailText,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.only(left: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color.withOpacity(0.7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Text(
            headingText,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.text_black_30,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Text(
                'Q',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.text_black_30,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                detailText,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.text_black_30,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
