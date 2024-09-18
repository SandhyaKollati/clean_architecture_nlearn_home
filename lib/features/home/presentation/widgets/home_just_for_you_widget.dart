import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';

class HomeJustForYouWidget extends StatelessWidget {
  final bool warmUpTestStatus;
  final bool reviseNowStatus;
  final bool interactiveScrollStatus;

  const HomeJustForYouWidget({
    super.key,
    required this.warmUpTestStatus,
    required this.reviseNowStatus,
    required this.interactiveScrollStatus,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      if (!warmUpTestStatus)
        _buildNavigableImage(
            context,
            AppIcons.warmUpTestImage,
                () => context.read<HomeBloc>().add(WarmUpTestClickedEvent()),
            'Warm Up Test Image'
        ),
      if (!reviseNowStatus)
        _buildNavigableImage(
            context,
            AppIcons.reviseNow,
                () => context.read<HomeBloc>().add(ReviseNowClickedEvent()),
            'Revise Now Image'
        ),
      if (!interactiveScrollStatus)
        _buildNavigableImage(
            context,
            AppIcons.interactiveImage,
                () => context.read<HomeBloc>().add(InteractiveScrollsClickedEvent()),
            'Interactive Scroll Image'
        ),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(items.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: items[index],
            );
          }),
        ),
      ),
    );
  }
}

Widget _buildNavigableImage(BuildContext context, String assetPath, VoidCallback onTap, String semanticLabel) {
  return GestureDetector(
    onTap: onTap,
    child: SvgPicture.asset(
      assetPath,
      fit: BoxFit.cover,
      semanticsLabel: semanticLabel,
    ),
  );
}

