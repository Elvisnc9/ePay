import 'package:epay/constant/color.dart';
import 'package:epay/pages/cardPage.dart';
import 'package:epay/pages/historyPage.dart';
import 'package:flutter/material.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundColor
        ),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // Disable swipe
          children: _pages,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 7.5.h,
          
          margin: const EdgeInsets.symmetric(horizontal: 35),
          decoration: BoxDecoration(
             color: AppColors.dark,
           borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavIcon(Icons.home, 0),
            _buildNavIcon(Icons.add_card, 1),
            _buildCenterIcon(Icons.qr_code_scanner, 2),
             _buildNavIcon(Icons.bar_chart_outlined, 3),
            _buildNavIcon(Icons.person, 4),
          ],
                    ),
        ),
      ),
    );
  }


  Widget _buildCenterIcon(IconData icon, int index) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
       color:   Color.fromARGB(255, 120, 236, 158) ,
       shape:BoxShape.circle 
        ),
        child: Icon(
          icon,
          color:  Colors.black ,
          size: 35,
        ),
      ),
      onPressed: () => _onItemTapped(index),
    );
  }





   Widget _buildNavIcon(IconData icon, int index) {
    return IconButton(
      icon: Container(
       padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: _selectedIndex == index 
              ? Colors.white.withOpacity(0.2)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: _selectedIndex == index 
              ? Color.fromARGB(255, 120, 236, 158) 
              : Colors.white,
          size: 35,
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