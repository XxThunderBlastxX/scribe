import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme.dart';

class StyledOutlineButton extends OutlinedButton {
  StyledOutlineButton({
    super.key,
    required String label,
    required VoidCallback onPressed,
  }) : super(
          onPressed: onPressed,
          child: Text(
            label,
            style: AppTheme.instance.theme.textTheme.bodySmall,
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            side: const BorderSide(
              color: Color(0xFFFFB5A7),
              width: 2.6,
            ),
          ),
        );
}
