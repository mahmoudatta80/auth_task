import 'package:auth_task/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
        Expanded(
          child: RichText(
            text: const TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MyColors.textColor,
                ),
                children: [
                  TextSpan(
                    text: 'By checking the box you agree to our ',
                  ),
                  TextSpan(
                    text: 'Terms ',
                    style: TextStyle(
                      color: MyColors.mainColor,
                    ),
                  ),
                  TextSpan(
                    text: 'and ',
                  ),
                  TextSpan(
                    text: 'Conditions',
                    style: TextStyle(
                      color: MyColors.mainColor,
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
