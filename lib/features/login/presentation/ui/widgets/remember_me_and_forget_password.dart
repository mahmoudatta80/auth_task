import 'package:auth_task/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  State<RememberMeAndForgetPassword> createState() => _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState extends State<RememberMeAndForgetPassword> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isActive,
          activeColor: MyColors.mainColor,
          onChanged: (value) {
            setState(() {
              isActive = value!;
            });
          },
        ),
        const Text(
          'Remember me',
          style:
          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        const Text(
          'Forget Password ?',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: MyColors.mainColor,
          ),
        ),
      ],
    );
  }
}
