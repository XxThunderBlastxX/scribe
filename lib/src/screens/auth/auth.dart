import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/common/utils/styled_snackbar.dart';
import '../../app/theme.dart';
import '../../router/routes.dart';
import 'bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.of(context).pushReplacementNamed(AppRouterPath.home);
            } else if (state is AuthFailureState) {
              context.styledSnackBar('Opps!!! Something went wrong.');
              context.read<AuthBloc>().add(AuthInitialEvent());
            }
          },
          builder: (context, state) {
            if (state is AuthInitialState) {
              return Center(
                child: ElevatedButton.icon(
                  onPressed: () =>
                      context.read<AuthBloc>().add(AuthSignInEvent()),
                  icon: Image.asset(
                    'assets/images/g-logo.png',
                    width: 35.w,
                  ),
                  label: Text(
                    'Sign In with Google',
                    style: AppTheme.instance.theme.textTheme.bodySmall,
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
