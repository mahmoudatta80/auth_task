import 'package:auth_task/core/theming/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicator extends StatelessWidget {
  final PageController pageController;
  const CustomIndicator({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      effect: const ExpandingDotsEffect(
        dotColor: MyColors.mainColor,
        dotHeight: 6.0,
        dotWidth: 16.0,
        spacing: 3.0,
        expansionFactor: 1.1,
        activeDotColor: MyColors.dotColor,
      ),
      controller: pageController,
      count: 3,
    );
  }
}
