import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';
import '../../domain/entities/response/home_learn_subjects_response.dart';

class HomeLearnSubjects extends StatelessWidget {
  final List<HomeGetLearnSubjectListResponse>? data;

  const HomeLearnSubjects({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double itemWidth = 120.0;
    double itemHeight = 120.0;
    double spacing = 12.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        var itemsPerRow = (screenWidth / itemWidth).floor();
        var rows = ((data?.length ?? 0) / itemsPerRow).ceil();
        double gridHeight = rows * (itemHeight + spacing);

        return Container(
          color: Colors.white,
          height: gridHeight,
          child: GridView.builder(
              padding: const EdgeInsets.only(top: 12.0),
            physics: const NeverScrollableScrollPhysics(), // Prevent internal scrolling
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: itemsPerRow,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
              childAspectRatio: itemWidth / itemHeight,
            ),
            itemBuilder: (context, index) {
              return _learnSubject(index, data, context);
            },
            itemCount: data?.length ?? 0,
          ),
        );
      },
    );
  }
}

Widget _learnSubject(int index, List<HomeGetLearnSubjectListResponse>? data, BuildContext context) {
  return Column(
    children: [
      GestureDetector(
        onTap: (){
          print(data![index]);
          context.read<HomeBloc>().add(LearnSubjectCardClickedEvent(subject: data![index]));
        },
        child: SvgPicture.asset(
          AppIcons.subjectIcon,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 8.0),
      Flexible(
        child: Text(
          data?[index].subjectName ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
