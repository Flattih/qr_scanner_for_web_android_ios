import 'package:flutter/material.dart';

import 'app_constants.dart';
import 'home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: AppColors.mainColor)),
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainColor),
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: AppColors.mainColor),
          ),
          inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: AppColors.outlineInputBorder,
              border: AppColors.outlineInputBorder,
              enabledBorder: AppColors.outlineInputBorder),
        ),
        debugShowCheckedModeBanner: false,
        title: 'QR SCANNER',
        home: const HomeScreen());
  }
}
