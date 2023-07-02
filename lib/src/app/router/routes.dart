import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../screens/screens.dart';

class AppRouterPath {
  static const String home = '/home';
  static const String auth = '/auth';
}

class AppRouterName {
  static const String home = 'home';
  static const String auth = 'auth';
}

class AppRouter {
  static final router = GoRouter(
      initialLocation: AppRouterPath.auth,
      routes: [
        GoRoute(
          name: AppRouterName.auth,
          path: AppRouterPath.auth,
          builder: (_, __) => const AuthScreen(),
        ),
        GoRoute(
          name: AppRouterName.home,
          path: AppRouterPath.home,
          builder: (_, __) => const HomeScreen(),
        ),
      ],
      redirect: (_, state) {
        final user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          return AppRouterPath.auth;
        } else {
          return AppRouterPath.home;
        }
      });
}
