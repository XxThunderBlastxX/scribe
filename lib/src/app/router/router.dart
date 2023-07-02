import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../screens/screens.dart';

class AppRouterPath {
  static const String auth = '/auth';
  static const String dashboard = '/dashboard';
  static const String document = 'document/:id';
}

class AppRouterName {
  static const String auth = 'auth';
  static const String dashboard = 'dashboard';
  static const String document = 'document';
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser == null
        ? AppRouterPath.auth
        : AppRouterPath.dashboard,
    routes: [
      GoRoute(
        name: AppRouterName.auth,
        path: AppRouterPath.auth,
        builder: (_, __) => const AuthScreen(),
      ),
      GoRoute(
        name: AppRouterName.dashboard,
        path: AppRouterPath.dashboard,
        builder: (_, __) => const HomeScreen(),
        routes: [
          GoRoute(
            name: AppRouterName.document,
            path: AppRouterPath.document,
            builder: (_, state) =>
                DocumentScreen(id: state.pathParameters['id']!),
          )
        ],
      ),
    ],
  );
}
