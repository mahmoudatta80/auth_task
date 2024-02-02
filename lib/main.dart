import 'package:auth_task/core/routes/app_router.dart';
import 'package:auth_task/core/routes/routes.dart';
import 'package:auth_task/core/utils/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mont',
      ),
      initialRoute: Routes.onboarding,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
