import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_colors.dart';
import 'package:nlearn_v3_home/core/utils/enums/home_section_type.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';

class HomeSectionHeaderWidget extends StatelessWidget {
  final String headerText;
  final SectionType? sectionType;
  const HomeSectionHeaderWidget({super.key, required this.headerText, this.sectionType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: headerText.isEmpty ? 0 : 24.0, bottom: headerText.isEmpty ? 0 : 16.0, right: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(headerText, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.text_black_30)),
          if (sectionType == SectionType.scheduledTest)
          TextButton(
              onPressed:(){
                context.read<HomeBloc>().add(ScheduleTestViewAllClickedEvent());
              } , child: const Text('View All (3)'),),
        ],
      ),
    );
  }
}
