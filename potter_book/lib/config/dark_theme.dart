import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potter_book/constants/app_color.dart';

final class DarkTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.darkPageBackground,
    textTheme: _textTheme(),
    colorScheme: _colorScheme(),
    appBarTheme: _appbarTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
  );

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColor.darkPageBackground,
      hintStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.lightHintColor,
      ),
      prefixIconColor: AppColor.primary,
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
    );
  }

  static OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColor.primary, width: 1.5),
    );
  }

  static AppBarTheme _appbarTheme() => AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    centerTitle: true,
  );

  static ColorScheme _colorScheme() {
    return ColorScheme(
      primary: AppColor.primary,
      secondary: AppColor.darkPageBackground,
      surface: Colors.black,
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      surfaceTint: AppColor.darkHintColor,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
