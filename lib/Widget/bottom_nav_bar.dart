import 'dart:ui';

import 'package:epay/constant/color.dart';
import 'package:epay/pages/cardPage.dart';
import 'package:epay/pages/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import '../pages/homepage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  // Your pages
  static const List<Widget> _pages = [
   Homepage(),
    CardPage(),
    Center(child: Text('Cards Page', style: TextStyle(fontSize: 24))),
    HistoryPage(),
       Center(child: Text('Cards Page', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        backgroundColor: Colors.transparent, // important!
      body: MediaQuery.removePadding(
    context: context,
    removeTop: true,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.backgroundColor
              ),
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(), // Disable swipe
                children: _pages,
              ),
            ),
             Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric( horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.light.withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavIcon(LineIcons.home, 0),
                      _buildNavIcon(LineIcons.creditCard, 1),
                      _buildCenterIcon(LineIcons.qrcode, 2),
                      _buildNavIcon(LineIcons.barChartAlt, 3),
                      _buildNavIcon(LineIcons.user, 4),
           ],
                  )
                     ),
         ),
       ),
     ),
          ],
        ),
      ),
    
    );
  }


  Widget _buildCenterIcon(IconData icon, int index) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(5),
        decoration:  BoxDecoration(
       color:  Colors.black,
       shape:BoxShape.circle 
        ),
        child: Icon(
          icon,
          color:  Colors.white ,
          size: _selectedIndex == index 
              ? 5.h  : 4.h ,
        ),
      ),
      onPressed: () => _onItemTapped(index),
    );
  }





   Widget _buildNavIcon(IconData icon, int index) {
    return IconButton(
      icon: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _selectedIndex == index 
              ? Colors.white.withOpacity(0.4)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: _selectedIndex == index 
              ? Colors.black
              : Colors.black,
          size: _selectedIndex == index 
          ? 4.5.h : 3.5.h,
        ),
      ),
      onPressed: () => _onItemTapped(index),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}