import 'package:auth_task/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
              'Get Started',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: MyColors.textColor,
              ),
            ),
            Text(
              'by creating a free account.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: MyColors.textColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
