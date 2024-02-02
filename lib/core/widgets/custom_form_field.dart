import 'package:auth_task/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomFormField({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: MyColors.mainColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xff000000).withOpacity(.5),
        ),
        suffixIcon: Icon(
          icon,
          size: 24,
          color: const Color(0xff000000).withOpacity(.3),
        ),
        filled: true,
        fillColor: const Color(0xffC4C4C4).withOpacity(.2),
      ),
    );
  }
}
