// #21252A
// #0F1117
//
// #141718
// #232627
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xffb42c3a),
      scaffoldBackgroundColor: const Color(0xff141718),
      splashColor: const Color(0xff141718),
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
      textTheme: textTheme(),
      checkboxTheme: checkboxThemeData(),
      textButtonTheme: textButtonThemeData(),
    );
  }

  static TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const StadiumBorder(),
        padding: EdgeInsets.zero,
        foregroundColor: const Color(0xffb42c3a),
      ),
    );
  }

  static CheckboxThemeData checkboxThemeData() {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Colors.transparent),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      checkColor: WidgetStateProperty.all(Colors.black),
      shape: const CircleBorder(),
    );
  }

  static TextTheme textTheme() {
    return TextTheme(
      bodyMedium: GoogleFonts.inter(
        color: const Color(0xFFa6a6a7),
      ),
      titleLarge: GoogleFonts.inter(
        color: const Color(0xFFa6a6a7),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          const Color(0xffb42c3a),
        ),
        minimumSize: WidgetStateProperty.all(Size(376.w, 70.h)),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Border radius
          ),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData get outlinedButtonThemeData {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          const BorderSide(
            color: Color(0xFFa6a6a7), // Border width
          ),
        ),
        minimumSize: WidgetStateProperty.all(Size(376.w, 70.h)),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Border radius
          ),
        ),
      ),
    );
  }
}
