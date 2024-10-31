import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 1));

  static final lightThemeMode = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Pallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(18),
          focusedBorder: _border(Pallete.blackColor),
          enabledBorder: _border(Pallete.textFormBBorderColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Pallete.backgroundColor));

  getTextTheme() {}
}
