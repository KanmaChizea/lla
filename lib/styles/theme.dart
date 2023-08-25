import 'package:flutter/material.dart';
import 'package:lla/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.darkPurple,
  primarySwatch: Colors.purple,
  brightness: Brightness.light,
  inputDecorationTheme: textField,
  elevatedButtonTheme: elevatedButton,
  appBarTheme: appbar,
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.purple,
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: AppColors.darkBlue,
  brightness: Brightness.dark,
  inputDecorationTheme: textFieldDark,
  elevatedButtonTheme: elevatedButtonDark,
  appBarTheme: appbar.copyWith(foregroundColor: AppColors.white),
);
const appbar = AppBarTheme(
  centerTitle: false,
  elevation: 0,
  backgroundColor: Colors.transparent,
  foregroundColor: AppColors.black,
);
final textField = InputDecorationTheme(
  floatingLabelStyle: const TextStyle(color: AppColors.purple),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.purple),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.red),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.black),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.red),
  ),
);
final textFieldDark = InputDecorationTheme(
  floatingLabelStyle: const TextStyle(color: AppColors.purple),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.purple),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.red),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.white),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.red),
  ),
);

final elevatedButton = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll(AppColors.darkPurple),
    minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
final elevatedButtonDark = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll(AppColors.purple),
    minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
