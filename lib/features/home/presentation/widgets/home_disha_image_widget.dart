import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';
import 'package:nlearn_v3_home/features/home/presentation/bloc/home_bloc.dart';

class HomeDishaConfigImage extends StatelessWidget {
  const HomeDishaConfigImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeBloc>().add(DishaBannerClickedEvent());
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
        child: Image.asset(AppIcons.dishaImage, fit: BoxFit.cover,),
      ),
    );

  }
}
