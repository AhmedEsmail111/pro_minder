import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_minder/core/utils/colors.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';
import 'package:pro_minder/core/utils/text_styles.dart';

final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: primaryColor,
  highlightColor: primaryColor.withOpacity(0.1),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
    secondary: secondaryColor,
  ),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    titleTextStyle: style20ExtraBold,
    centerTitle: false,
  ),
  iconTheme: const IconThemeData().copyWith(
    color: Colors.white,
    size: defaultIconSize,
    weight: 0.5,
  ),
  textTheme: GoogleFonts.montserratTextTheme(
    ThemeData.dark(useMaterial3: true).textTheme,
  ),
  navigationDrawerTheme: const NavigationDrawerThemeData().copyWith(
    backgroundColor: drawerBackgroundColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
    backgroundColor: secondaryColor,
    shape: const CircleBorder(),
  ),
  navigationBarTheme: const NavigationBarThemeData().copyWith(
    height: kBottomNavigationBarHeight.h,
    elevation: 0,
    backgroundColor: primaryColor,
    indicatorColor: primaryColor,
    overlayColor: const WidgetStatePropertyAll(primaryColor),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: secondaryColor,
            size: 23.w,
          );
        }
        return IconThemeData(
          color: Colors.white,
          size: 23.w,
        );
      },
    ),
  ),
);
