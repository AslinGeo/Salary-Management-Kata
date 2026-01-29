import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_management_kata/feature/app/core/router/app_router.dart';
import 'package:salary_management_kata/feature/app/core/theme.dart';
import 'package:salary_management_kata/feature/app/data/repositories/employee_repository.dart';
import 'package:salary_management_kata/feature/app/data/services/employee_db_service.dart';
import 'package:salary_management_kata/feature/app/presentation/state/employee/employee_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => EmployeeBloc(EmployeeRepository(EmployeeDbService())),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Salary Management Kata',
        theme: appTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
