import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potter_book/config/dark_theme.dart';
import 'package:potter_book/config/light_theme.dart';
import 'package:potter_book/features/base/view/base_view.dart';
import 'package:potter_book/features/home/view_model/home_view_model.dart';
import 'package:potter_book/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(homeViewModelProvider);

    return MaterialApp.router(
      title: 'Potter Book',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: themeMode,
      routerConfig: AppRouter().router,
    );
  }
}
