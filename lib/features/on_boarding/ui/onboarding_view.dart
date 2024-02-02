import 'package:auth_task/core/routes/extensions.dart';
import 'package:auth_task/core/routes/routes.dart';
import 'package:auth_task/core/theming/my_colors.dart';
import 'package:auth_task/features/on_boarding/model/onboarding_model.dart';
import 'package:auth_task/features/on_boarding/ui/widgets/custom_indicator.dart';
import 'package:auth_task/features/on_boarding/ui/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      image: 'assets/images/first_onboarding.png',
      title: 'Explore the world easily',
      subTitle: 'To your desire',
    ),
    OnboardingModel(
      image: 'assets/images/second_onboarding.png',
      title: 'Reach the unknown spot',
      subTitle: 'To your destination',
    ),
    OnboardingModel(
      image: 'assets/images/third_onboarding.png',
      title: 'Make connects with explora',
      subTitle: 'To your dream trip',
    ),
  ];

  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: CustomPageView(
                    pageController: pageController,
                    onboardingItems: onboardingItems,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      pageController: pageController,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (pageController.page! < 2) {
                          pageController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.ease,
                          );
                        } else {
                          context.pushReplacementNamed(
                            Routes.login,
                          );
                        }
                      },
                      shape: const CircleBorder(),
                      backgroundColor: MyColors.textColor,
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
