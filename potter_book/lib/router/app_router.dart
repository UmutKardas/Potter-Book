import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:potter_book/features/base/view/base_view.dart';
import 'package:potter_book/features/detail/view/detail_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final class AppRouter {
  final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const BaseView();
        },
      ),
      GoRoute(
        path: '/details/:title',
        builder: (BuildContext context, GoRouterState state) {
          final String detailTitle = state.pathParameters['title'] ?? '';
          return DetailView(detailTitle: detailTitle);
        },
        name: 'details',
      ),
    ],
  );

  GoRouter get router => _router;
}
