import 'package:flutter/material.dart';
import 'package:projekt/presentation/pages/homepage.dart';
import 'package:projekt/presentation/pages/sign_in_page.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
