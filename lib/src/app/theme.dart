import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final instance = AppTheme._();

  final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF8EDEB),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFFFB5A7),
      onPrimary: Color(0xFFFFB5A7),
      secondary: Color(0xFFFCD5CE),
      onSecondary: Color(0xFFFCD5CE),
      error: Color(0xFFE60026),
      onError: Color(0xFFE60026),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFFFFB5A7),
      onSurface: Color(0xFFFFB5A7),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        height: 1.25,
        color: const Color(0xFFF8FEFF),
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: const Color(0xFFF8FEFF),
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        height: 1.25,
        color: const Color(0xFFF8FEFF),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFFFFB5A7),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r),
      ),
      elevation: 5,
      behavior: SnackBarBehavior.floating,
      closeIconColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
    ),
  );
}
