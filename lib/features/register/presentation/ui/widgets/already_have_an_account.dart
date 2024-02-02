import 'package:auth_task/core/routes/extensions.dart';
import 'package:auth_task/core/routes/routes.dart';
import 'package:auth_task/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already a member? ',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: MyColors.textColor,
          ),
        ),
        InkWell(
          onTap: () {
            context.pushReplacementNamed(Routes.login);
          },
          child: const Text(
            'Log In',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: MyColors.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
