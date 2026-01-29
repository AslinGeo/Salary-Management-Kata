import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF8FAFC),
  buttonTheme: ButtonThemeData(buttonColor: const Color(0xFF14B8A6)),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF2563EB),
    primary: const Color(0xFF2563EB),
    secondary: const Color(0xFF14B8A6),
    error: const Color(0xFFDC2626),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2563EB),
    foregroundColor: Colors.white,
    centerTitle: true,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF14B8A6),
    foregroundColor: Colors.white,
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
