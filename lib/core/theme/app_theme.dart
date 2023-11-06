import 'package:flutter/material.dart';

@immutable
final class AppTheme {
  const AppTheme._();
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
          background: Colors.grey.shade300,
          primary: Colors.grey.shade200,
          secondary: Colors.white,
          inversePrimary: Colors.grey.shade700));
}
