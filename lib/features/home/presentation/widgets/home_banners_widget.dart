import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_colors.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';

class HomeBannersWidget extends StatefulWidget {
  const HomeBannersWidget({super.key});

  @override
  State<HomeBannersWidget> createState() => _HomeBannersWidgetState();
}

class _HomeBannersWidgetState extends State<HomeBannersWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final int bannerCount = 9; // Total number of banners
  Timer? _autoPlayTimer; // Timer for auto-play

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentIndex) {
        setState(() {
          _currentIndex = page;
        });
      }
    });
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoPlayTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentIndex + 1) % bannerCount;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 24.0),
          height: 108,
          child: PageView.builder(
            controller: _pageController,
            itemCount: bannerCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Image.asset(
                  AppIcons.bannerImage,
                  fit: BoxFit.cover,
                  // Ensure image covers the container// Full width
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12), // Space between the carousel and the dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(bannerCount, (index) {
            final bool isActive = _currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 14.0 : 6.0, // Expanded size for active dot
              height: 6.0,
              decoration: BoxDecoration(
                color: AppColors.gradient_blue_300,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
