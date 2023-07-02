import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledListTile extends StatelessWidget {
  final String title;

  const StyledListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      child: ListTile(
        title: Text(title),
        leading: const Icon(
          Icons.edit_document,
          color: Color(0xFFFFFFFF),
        ),
        onTap: () {},
      ),
    );
  }
}
