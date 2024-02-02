import 'package:auth_task/core/utils/app_regex.dart';
import 'package:auth_task/core/widgets/custom_form_field.dart';
import 'package:auth_task/features/register/presentation/logic/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFormFields extends StatelessWidget {
  const RegisterFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterBloc>().formKey,
      child: Column(
        children: [
          CustomFormField(
            text: 'Full name',
            validator: (value) {
              if(value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
            icon: Icons.person_2_outlined,
            controller: context.read<RegisterBloc>().nameController,
          ),
          const SizedBox(height: 25),
          CustomFormField(
            text: 'Valid email',
            validator: (value) {
              if(value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            icon: Icons.mail_outline_outlined,
            controller: context.read<RegisterBloc>().emailController,
          ),
          const SizedBox(height: 25),
          CustomFormField(
            text: 'Phone number',
            validator: (value) {
              if(value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            icon: Icons.phone_android_outlined,
            controller: context.read<RegisterBloc>().phoneController,
          ),
          const SizedBox(height: 25),
          CustomFormField(
            text: 'Strong Password',
            validator: (value) {
              if(value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                return 'Please enter a strong password';
              }
              return null;
            },
            icon: Icons.lock_open_outlined,
            controller: context.read<RegisterBloc>().passwordController,
          ),
        ],
      ),
    );
  }
}
