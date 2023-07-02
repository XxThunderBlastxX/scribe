import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scribe/src/app/theme.dart';

class StyledListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const StyledListTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      child: ListTile(
        title:
            Text(title, style: AppTheme.instance.theme.textTheme.labelMedium),
        leading: const Icon(
          Icons.edit_document,
          color: Color(0xFFFFFFFF),
        ),
        onTap: onTap,
      ),
    );
  }
}
