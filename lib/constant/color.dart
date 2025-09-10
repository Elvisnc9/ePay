import 'package:flutter/material.dart';

class AppColors{
  static  Gradient backgroundColor = const  RadialGradient(
            center: Alignment.center,
            radius: 0.4,
            
            colors: [
             Color(0xFFFFA726),
               Color(0xFFFF00FF), // Pink
              // Purple
            ],
            stops: [ 0.6, 1.0],
          );
  static const Color dark = Colors.black;
  static const Color orange = Color(0xFFFFA726);
  static const  Color light = Color.fromARGB(255, 224, 231, 232);
 


}
