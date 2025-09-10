
import 'package:epay/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);


final lightTheme = ThemeData(
scaffoldBackgroundColor :AppColors.light,
primaryColor:  Colors.white70,

);


final darkTheme = ThemeData(
scaffoldBackgroundColor:  AppColors.dark,
primaryColor: Colors.black87
);