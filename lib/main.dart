// ignore_for_file: non_constant_identifier_names

import 'package:epay/Widget/bottom_nav_bar.dart';
import 'package:epay/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

void main() {
  runApp(TheResponsiveBuilder(builder: (Context, Orientation, ScreenType) {
    return const MyApp();
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return AnnotatedRegion<SystemUiOverlayStyle>(
  value: SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent, 
  ),
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ePay',
    theme: themeData,
    home: const BottomNavBar(),
  ),
);
  }
}
