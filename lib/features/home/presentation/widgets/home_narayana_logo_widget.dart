import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nlearn_v3_home/core/utils/constants/app_icons.dart';

class HomeNaryanaLogoWidget extends StatelessWidget {
  const HomeNaryanaLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: SvgPicture.asset(AppIcons.narayanalogo, semanticsLabel: "Narayana logo",),
      ),
    );
  }
}
