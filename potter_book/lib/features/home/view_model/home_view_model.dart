// home_view_model.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends StateNotifier<ThemeMode> {
  static const _themeKey = 'theme_mode';
  String _currentTheme = 'light';

  String get currentTheme => _currentTheme;

  HomeViewModel() : super(ThemeMode.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeKey) ?? 'light';

    state = themeString == 'dark' ? ThemeMode.dark : ThemeMode.light;
    _currentTheme = themeString;
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      await prefs.setString(_themeKey, 'dark');
    } else {
      state = ThemeMode.light;
      await prefs.setString(_themeKey, 'light');
    }

    _currentTheme = state == ThemeMode.dark ? 'dark' : 'light';
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, ThemeMode>(
  (ref) => HomeViewModel(),
);
