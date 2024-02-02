import 'package:auth_task/core/routes/extensions.dart';
import 'package:auth_task/core/routes/routes.dart';
import 'package:auth_task/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'New Member ? ',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: MyColors.textColor,
          ),
        ),
        InkWell(
          onTap: () {
            context.pushReplacementNamed(Routes.register);
          },
          child: const Text(
            'Register Now',
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
