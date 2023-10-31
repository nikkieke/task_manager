// #21252A
// #0F1117
//
// #141718
// #232627
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static  ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xffb42c3a),
      scaffoldBackgroundColor: const Color(0xff141718),
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
      textTheme: textTheme(),
      checkboxTheme: checkboxThemeData(),


    );
  }

  static CheckboxThemeData checkboxThemeData() {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      checkColor: MaterialStateProperty.all(Colors.black),
      shape:const CircleBorder(),
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
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffb42c3a),),
        minimumSize: MaterialStateProperty.all( Size(376.w, 70.h)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
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
          side: MaterialStateProperty.all(const BorderSide(
            color: Color(0xFFa6a6a7),         // Border width
          ),),
            minimumSize: MaterialStateProperty.all( Size(376.w, 70.h)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
        ),
    );
  }

}
