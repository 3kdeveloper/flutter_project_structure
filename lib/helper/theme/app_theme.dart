import 'package:flutter/material.dart';
import 'package:flutter_project_structure/helper/constants/colors_resources.dart';
import 'package:flutter_project_structure/helper/constants/dimensions_resources.dart';
import 'package:flutter_project_structure/helper/theme/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: GoogleFonts.manrope().fontFamily,
    brightness: Brightness.light,
    cardColor: ColorsResouces.cardBackgroundColor,
    primaryColorDark: ColorsResouces.primaryColorDark,
    scaffoldBackgroundColor: ColorsResouces.whiteColor,
    primaryColor: ColorsResouces.primaryColor,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsResouces.whiteColor,
        titleTextStyle: textTheme.headlineSmall),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsResouces.primaryColor,
      selectionColor: ColorsResouces.textFieldBorderColor,
      selectionHandleColor: ColorsResouces.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResouces.r_8.r),
          borderSide: const BorderSide(color: ColorsResouces.primaryColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResouces.r_8.r),
          borderSide: const BorderSide(color: ColorsResouces.primaryColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResouces.r_8.r),
          borderSide: const BorderSide(color: ColorsResouces.primaryColor)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResouces.r_8.r),
          borderSide: const BorderSide(color: ColorsResouces.primaryColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResouces.r_8.r),
          borderSide: const BorderSide(color: ColorsResouces.primaryColor)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimensionsResouces.r_8.r),
          borderSide: const BorderSide(color: ColorsResouces.primaryColor)),
    ),
    textTheme: textTheme,
    tabBarTheme: TabBarTheme(
        labelColor: ColorsResouces.blackColor,
        unselectedLabelColor: ColorsResouces.unselectedLabelColor,
        labelStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        unselectedLabelStyle: textTheme.bodyMedium,
        indicatorColor: ColorsResouces.blackColor,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                color: ColorsResouces.blackColor,
                width: DimensionsResouces.d_2.w))),
    colorScheme: ThemeData()
        .colorScheme
        .copyWith(primary: ColorsResouces.cardBackgroundColor)
        .copyWith(background: ColorsResouces.errorColor),
  );
}
