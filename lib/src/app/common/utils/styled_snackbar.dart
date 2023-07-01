import 'package:flutter/material.dart';

import '../../theme.dart';

extension StyledSnackbar on BuildContext {
  void styledSnackBar(String message, {int? statusCode}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content: statusCode == null
            ? Text(
                'Error: $message',
                style: AppTheme.instance.theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
              )
            : Text(
                'Error: $statusCode \n$message',
                style: AppTheme.instance.theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
