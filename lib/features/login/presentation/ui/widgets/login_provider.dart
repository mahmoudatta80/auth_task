import 'package:auth_task/core/utils/dependency_injection.dart';
import 'package:auth_task/features/login/presentation/logic/login_bloc/login_bloc.dart';
import 'package:auth_task/features/login/presentation/ui/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const LoginView(),
    );
  }
}
