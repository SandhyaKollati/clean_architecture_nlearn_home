import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_icons.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../bloc/home_bloc.dart';
import 'home_course_switch_widget.dart';

class SliverAppBarWidget extends StatefulWidget {
  final ScrollController scrollController;
  final String headerTitle;
  final String courseSwitchTitle;

  const SliverAppBarWidget({
    super.key,
    required this.scrollController,
    required this.headerTitle, required this.courseSwitchTitle,
  });

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      if (widget.scrollController.hasClients) {
        setState(() {
          print("scroll${widget.scrollController.offset}");
          _isScrolled = widget.scrollController.offset > (120 - kToolbarHeight);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      leading: _iconButton(AppIcons.menuIcon, true, () => context.read<HomeBloc>().add((MenuIconClickedEvent()))),
      floating: false,
      pinned: true,
      expandedHeight: 120,
      actions: [
         HomeCourseSwitchWidget(title: widget.courseSwitchTitle,),
        _iconButton(AppIcons.notificationIcon, false, () {
           context.read<HomeBloc>().add((NotificationIconClickedEvent()));
        }),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: !_isScrolled
            ? const EdgeInsets.only(left: 16.0, bottom: 16.0)
            : const EdgeInsets.only(left: 50.0, bottom: 16.0),
        title: Text(
          _isScrolled ? AppStrings.homeHeaderName : 'Hi, ${widget.headerTitle}',
          style: const TextStyle(color: AppColors.text_grey_800, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        background: _isScrolled
            ? Container(color: Colors.white) // Fallback background when scrolled
            : Image.asset(
          AppIcons.homeBackGroundImage,
          width: double.infinity,
          fit: BoxFit.cover,
          // For debugging purposes:
        ),
        collapseMode: CollapseMode.pin,
      ),
    );
  }
}

Widget _iconButton(String icon, bool isMenu, VoidCallback onPressed) {
  return IconButton(onPressed: onPressed, icon: SvgPicture.asset(icon), padding: EdgeInsets.zero, iconSize: 24,);
}