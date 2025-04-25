import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potter_book/constants/app_color.dart';

final class LightTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme(),
    colorScheme: _colorScheme(),
    appBarTheme: _appbarTheme(),
  );

  static AppBarTheme _appbarTheme() => AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    centerTitle: true,
  );

  static ColorScheme _colorScheme() {
    return ColorScheme(
      primary: AppColor.primary,
      secondary: Colors.white,
      surface: Colors.black12,
      background: Colors.white,
      error: Colors.red,
      onPrimary: AppColor.darkPageBackground,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      surfaceTint: AppColor.lightHintColor,
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
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
