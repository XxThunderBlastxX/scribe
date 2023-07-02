import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scribe/src/data/repository/document_repository.dart';
import 'package:scribe/src/data/services/data_service.dart';

import '../../app/common/widgets/styled_alert_dialog.dart';
import '../../app/common/widgets/styled_list_tile.dart';
import '../../app/router/router.dart';
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

    Widget homeUi(
      QuerySnapshot<Map<String, dynamic>>? snapshot,
      VoidCallback onTapCreateNewDoc,
    ) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            userName ?? 'Welcome',
            style: AppTheme.instance.theme.textTheme.labelMedium,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: ElevatedButton(
                    onPressed: onTapCreateNewDoc,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                    ),
                    child: Text(
                      'New Document',
                      style: AppTheme.instance.theme.textTheme.labelMedium,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 14.w,
                  endIndent: 14.w,
                  color: const Color(0xFFFFB5A7),
                ),
                SizedBox(
                  height: 0.8.sh,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapshot?.docs.length,
                    itemBuilder: (context, i) => StyledListTile(
                      title: snapshot!.docs[i]['title'],
                      onTap: () => GoRouter.of(context).pushNamed(
                        AppRouterName.document,
                        pathParameters: {'id': snapshot.docs[i]['id']},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
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
            return FutureBuilder(
              future: dataService.get<DocumentRepository>().getDocuments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return homeUi(
                      snapshot.data,
                      () => context
                          .read<HomeBloc>()
                          .add(CreateNewDocumentEvent()));
                }
              },
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
