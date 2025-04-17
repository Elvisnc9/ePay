


import 'package:epay/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

final themeData = ThemeData(
  fontFamily: 'poppins',
      useMaterial3: true,
       textTheme:  TextTheme(
          titleLarge:  GoogleFonts.sora(
            color: AppColors.light,
            fontSize: 5.2.h,
            fontWeight: FontWeight.w600
          ),
          labelLarge:  GoogleFonts.sora(
            color: AppColors.light,
            fontSize: 6.h,
            fontWeight: FontWeight.w600
          ),
          titleMedium:  TextStyle(
            fontSize: 2.h,
            fontWeight: FontWeight.bold,
            color: AppColors.dark,
          ),
          labelSmall:  TextStyle(
            fontSize: 1.6.h,
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w600            
          ),
          labelMedium: GoogleFonts.sora(
            fontSize: 2.5.h,
            fontWeight: FontWeight.bold
          ),

          titleSmall: GoogleFonts.fredoka(
            fontSize: 2.5.h,
            fontWeight: FontWeight.bold
          ),
         ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),



        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: AppColors.dark.withOpacity(0.6),
            padding: EdgeInsets.all(1.h),
            shape: const CircleBorder(),
          ),
        ),





);