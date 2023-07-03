import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import 'bloc/document_bloc.dart';

class DocumentScreen extends StatefulWidget {
  final String id;

  const DocumentScreen({super.key, required this.id});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DocumentBloc()..add(DocumentInitialEvent(id: widget.id)),
      child: BlocBuilder<DocumentBloc, DocumentState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                context.read<DocumentBloc>().docTitle,
                style: AppTheme.instance.theme.textTheme.labelMedium,
              ),
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 23.w,
                  weight: 0.1,
                  color: Colors.white,
                ),
              ),
            ),
            body: SizedBox(
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  8.verticalSpace,
                  quill.QuillToolbar.basic(
                    controller: context.read<DocumentBloc>().controller,
                    toolbarIconSize: 17.5.w,
                    iconTheme: quill.QuillIconTheme(
                      borderRadius: 8.r,
                    ),
                    toolbarSectionSpacing: 6.w,
                    showFontSize: false,
                    showFontFamily: false,
                    showSearchButton: false,
                  ),
                  10.verticalSpace,
                  Expanded(
                    child: SizedBox(
                      width: 0.86.sw,
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 25.h),
                          child: quill.QuillEditor.basic(
                            controller: context.read<DocumentBloc>().controller,
                            readOnly: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
