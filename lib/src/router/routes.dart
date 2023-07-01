import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../screens/screens.dart';

class AppRouterPath {
  static const String home = '/';
  static const String login = '/login';
  static const String auth = '/auth';
}

class AppRouter {
  static final RouteMap loggedInRoute = RouteMap(routes: {
    AppRouterPath.home: (_) => const MaterialPage<void>(child: HomeScreen()),
  });

  static final RouteMap loggedOutRoute = RouteMap(routes: {
    AppRouterPath.home: (_) => const MaterialPage<void>(child: AuthScreen()),
  });
}
