import 'package:flutter/material.dart';
import 'package:projekt/presentation/pages/homepage.dart';
import 'package:projekt/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: Homepage(),
    );
  }
}
