import 'package:auth_task/core/routes/routes.dart';
import 'package:auth_task/features/login/presentation/ui/login_view.dart';
import 'package:auth_task/features/login/presentation/ui/widgets/login_provider.dart';
import 'package:auth_task/features/on_boarding/ui/onboarding_view.dart';
import 'package:auth_task/features/register/presentation/ui/register_view.dart';
import 'package:auth_task/features/register/presentation/ui/widgets/register_provider.dart';
import 'package:auth_task/features/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginProvider(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterProvider(),
        );
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomeView(),
        );
    }
    return null;
  }
}
