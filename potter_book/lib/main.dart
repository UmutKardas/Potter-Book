import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potter_book/config/dark_theme.dart';
import 'package:potter_book/config/light_theme.dart';
import 'package:potter_book/controller/character_controller.dart';
import 'package:potter_book/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsyncValue = ref.watch(studentsProvider);

    return MaterialApp.router(
      title: 'Potter Book',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter().router,
      builder: (context, child) {
        return studentsAsyncValue.when(
          data: (students) {
            return child!;
          },
          loading:
              () => const MaterialApp(
                home: Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
              ),
          error: (error, stack) {
            return MaterialApp(
              home: Scaffold(
                body: Center(child: Text('Error loading data: $error')),
              ),
            );
          },
        );
      },
    );
  }
}
