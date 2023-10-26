import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

final GlobalKey<NavigatorState> _rootNavigation = GlobalKey(debugLabel: 'root');

final goRouterProvider = Provider<GoRouter>((ref){
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigation,
    debugLogDiagnostics: true,
    restorationScopeId: 'app',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.getStarted.name,
        builder: (context, state) => const GetStartedView(),
      ),

      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
});

enum AppRoute {
  getStarted,
  home,
}
