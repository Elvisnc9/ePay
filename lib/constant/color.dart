import 'package:flutter/material.dart';

class AppColors{
  static  LinearGradient backgroundColor = const LinearGradient(
    begin: Alignment.topCenter,
    stops: [
      0.0,
      1.0
    ],
    end: Alignment(0.03,0.1),
    colors: [
    Color(0xFF177245),
    Color.fromARGB(255, 245, 244, 244)
  ]);
  static const Color dark = Color(0xFF100C08);
  static const  Color light = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF177245);
}