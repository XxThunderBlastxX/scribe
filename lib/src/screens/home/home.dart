import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scribe/src/app/common/widgets/styled_list_tile.dart';

import '../../app/common/widgets/styled_alert_dialog.dart';
import '../../app/router/routes.dart';
import '../../app/theme.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userName = FirebaseAuth.instance.currentUser?.displayName;

    Future<void> signOut(BuildContext context) async {
      context.styledAlertDialog(onYes: () {
        context.read<HomeBloc>().add(HomeSignOutEvent());
        GoRouter.of(context).replace(AppRouterPath.auth);
      });
    }

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeSignOutState) {
            GoRouter.of(context).replace(AppRouterPath.auth);
          }
        },
        builder: (context, state) {
          if (state is HomeInitialState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  userName ?? 'Welcome',
                  style: AppTheme.instance.theme.textTheme.bodyMedium,
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser?.photoURL ?? ''),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () => signOut(context),
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 8.r),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 5,
                  itemBuilder: (context, i) => StyledListTile(
                    title: 'Item $i',
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
