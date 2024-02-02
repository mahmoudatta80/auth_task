import 'package:auth_task/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          'assets/images/auth.png',
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: MyColors.textColor,
                fontSize: 30,
              ),
            ),
            Text(
              'sign in to access your account',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: MyColors.textColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
