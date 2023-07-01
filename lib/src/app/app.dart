import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routemaster/routemaster.dart';
import 'package:scribe/src/router/routes.dart';

import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) =>
          MaterialApp.router(
            title: 'Scribe',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.instance.theme,
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) {
                final user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  return AppRouter.loggedInRoute;
                } else {
                  return AppRouter.loggedOutRoute;
                }
              },
            ),
            routeInformationParser: const RoutemasterParser(),
          ),
    );
  }
}
