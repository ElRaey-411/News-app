import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData();
  static final ThemeData dark = ThemeData(
    primaryColor: ColorsManager.black,
    secondaryHeaderColor: ColorsManager.white,

    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: ColorsManager.black,
      titleTextStyle: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsManager.white),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorsManager.black,
      width: 269.w,
    ),
    iconTheme: IconThemeData(color: ColorsManager.white),

    textTheme: TextTheme(
      titleMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),

    ),
  );
}
