


import 'package:epay/constant/color.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
  fontFamily: 'poppins',
      useMaterial3: true,
       textTheme: const TextTheme(
          titleLarge:  TextStyle(
            color: AppColors.light,
            fontSize: 45,
            fontWeight: FontWeight.bold
          ),
          titleMedium:  TextStyle(
            fontSize: 25
          ),
         ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    

);