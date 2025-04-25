import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potter_book/config/light_theme.dart';
import 'package:potter_book/features/base/view/base_view.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Potter Book',
      theme: LightTheme.theme,
      home: const BaseView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
