import 'package:auth_task/core/utils/app_regex.dart';
import 'package:auth_task/core/widgets/custom_form_field.dart';
import 'package:auth_task/features/login/presentation/logic/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginBloc>().formKey,
      child: Column(
        children: [
          CustomFormField(
            validator: (value) {
              if(value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            text: 'Enter your email',
            icon: Icons.mail_outline_outlined,
            controller: context.read<LoginBloc>().emailController,
          ),
          const SizedBox(height: 25),
          CustomFormField(
            text: 'Password',
            validator: (value) {
              if(value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
            icon: Icons.lock_open_outlined,
            controller: context.read<LoginBloc>().passwordController,
          ),
        ],
      ),
    );
  }
}
