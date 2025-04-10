import 'package:flutter/material.dart';

class AppColors{
  static  LinearGradient backgroundColor = const LinearGradient(
    begin: Alignment.topCenter,
    stops: [
      0.0,
      0.9
    ],
    end: Alignment(0.003,0.01),
    colors: [
    Color(0xFF00693E),
    Color(0xFFFFFFFF)
  ]);
  static const Color dark = Color(0xFF100C08);
  static const  Color light = Color(0xFFFFFFFF);
}