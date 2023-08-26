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
  outlinedButtonTheme: outlinedButton,
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.purple,
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: AppColors.darkBlue,
  brightness: Brightness.dark,
  inputDecorationTheme: textFieldDark,
  elevatedButtonTheme: elevatedButtonDark,
  appBarTheme: appbar.copyWith(foregroundColor: AppColors.white),
  outlinedButtonTheme: outlinedButtonDark,
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
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade700;
      }
      return AppColors.white;
    }),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      return AppColors.darkPurple;
    }),
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
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade700;
      }
      return AppColors.white;
    }),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      return AppColors.purple;
    }),
    minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
final outlinedButton = OutlinedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: const MaterialStatePropertyAll(AppColors.darkPurple),
    minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
    side: const MaterialStatePropertyAll(
      BorderSide(
        color: AppColors.darkPurple,
        width: 1.5,
      ),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
final outlinedButtonDark = OutlinedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: const MaterialStatePropertyAll(AppColors.purple),
    minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
    side: const MaterialStatePropertyAll(
      BorderSide(color: AppColors.purple, width: 1.5),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
