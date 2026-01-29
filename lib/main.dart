import 'package:flutter/material.dart';
import 'package:salary_management_kata/feature/app/core/router/app_router.dart';
import 'package:salary_management_kata/feature/app/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Salary Management Kata',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
