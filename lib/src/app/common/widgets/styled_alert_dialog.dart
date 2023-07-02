import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../theme.dart';
import 'styled_outline_button.dart';

extension StyledAlertDialog on BuildContext {
  void styledAlertDialog({
    required void Function() onYes,
  }) =>
      showDialog(
        context: this,
        builder: (context) => AlertDialog(
          title: Text(
            'Are you sure you want to sign out?',
            style: AppTheme.instance.theme.textTheme.bodySmall!.copyWith(
              fontSize: 14.sp,
            ),
          ),
          elevation: 12,
          backgroundColor: const Color(0xFFFFB5A7),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledOutlineButton(
                label: 'No',
                onPressed: () => context.pop(),
              ),
              12.horizontalSpace,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  elevation: 0.0,
                  backgroundColor: const Color(0xFFF8EDEB),
                ),
                onPressed: () {
                  GoRouter.of(context).pop();
                  onYes();
                },
                child: Text(
                  'Yes',
                  style: AppTheme.instance.theme.textTheme.bodySmall!.copyWith(
                    color: const Color(0xFFFFB5A7),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
