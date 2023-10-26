// #21252A
// #0F1117
//
// #141718
// #232627
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static  ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xfffed36a),
      scaffoldBackgroundColor: const Color(0xff141718),
      elevatedButtonTheme: elevatedButtonThemeData,
      textTheme: textTheme(),


    );
  }

  static TextTheme textTheme() {
    return TextTheme(
      bodyMedium: GoogleFonts.inter(
        color: const Color(0xFF000000),
      ),
      titleLarge: GoogleFonts.inter(
        color: const Color(0xFF000000),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xfffed36a)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Border radius
          ),
        ),
      ),
    );
  }
}
