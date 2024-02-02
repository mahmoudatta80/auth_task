import 'package:auth_task/core/utils/dependency_injection.dart';
import 'package:auth_task/features/register/presentation/logic/register_bloc/register_bloc.dart';
import 'package:auth_task/features/register/presentation/ui/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterBloc>(),
      child: const RegisterView(),
    );
  }
}
