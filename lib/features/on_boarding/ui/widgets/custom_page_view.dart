import 'package:auth_task/core/theming/my_colors.dart';
import 'package:auth_task/features/on_boarding/model/onboarding_model.dart';
import 'package:flutter/cupertino.dart';

class CustomPageView extends StatelessWidget {
  final PageController pageController;
  final List<OnboardingModel> onboardingItems;

  const CustomPageView({
    super.key,
    required this.pageController,
    required this.onboardingItems,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.asset(
                onboardingItems[index].image,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboardingItems[index].title,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: MyColors.textColor,
                  ),
                ),
                Text(
                  onboardingItems[index].subTitle,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: MyColors.textColor,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
