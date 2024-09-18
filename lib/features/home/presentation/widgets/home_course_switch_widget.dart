import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_colors.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';

import '../bloc/home_bloc.dart';

class HomeCourseSwitchWidget extends StatelessWidget {
  final String title;
  const HomeCourseSwitchWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 8,
          shadowColor: AppColors.text_grey_950.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          minimumSize: const Size(0, 36)
        ),
        onPressed: () {
          context.read<HomeBloc>().add(((CourseSwitchClickedEvent())));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
             title,
              style: const TextStyle(fontSize: 14, color: AppColors.gradient_blue_500, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8), // Space between text and icon
            SvgPicture.asset(AppIcons.arrowDownWard, height: 16,)
          ],
        ),
      ),
    );
  }
}
