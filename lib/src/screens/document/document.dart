import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scribe/src/app/theme.dart';

class DocumentScreen extends StatefulWidget {
  final String id;

  const DocumentScreen({super.key, required this.id});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  late quill.QuillController _controller;

  @override
  void initState() {
    _controller = quill.QuillController.basic();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Document',
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
              controller: _controller,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                    child: quill.QuillEditor.basic(
                      controller: _controller,
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
  }
}
