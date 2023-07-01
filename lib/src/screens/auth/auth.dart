import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/g-logo.png',
            width: 35.w,
          ),
          label: Text(
            'Sign In with Google',
            style: AppTheme.instance.theme.textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
