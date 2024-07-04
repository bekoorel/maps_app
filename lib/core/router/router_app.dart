import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_app/features/login_py_google/screens/login_screen.dart';
import 'package:maps_app/features/map/screens/map_screen.dart';

class AppRouter {
  static List<RouteBase> routeList = [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/MapScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const MapScreen();
      },
    ),
  ];
}
