import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potter_book/constants/app_color.dart';

final class LightTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme(),
    colorScheme: _colorScheme(),
  );

  static ColorScheme _colorScheme() {
    return ColorScheme(
      primary: AppColor.primary,
      secondary: AppColor.primary,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      surfaceTint: AppColor.hintColor,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      labelSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
