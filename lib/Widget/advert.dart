

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class Advert extends StatefulWidget {
  @override
  _AdvertState createState() =>
      _AdvertState();
}

class _AdvertState
    extends State<Advert> {
  final PageController _pageController = PageController();
  final PageController _scrollController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % 3; // Loop through 3 items
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Number of items
            itemBuilder: (context, index) {
              return _buildPage(
                'https://img.freepik.com/free-vector/bank-finance-social-media-cover-template_23-2149730421.jpg?t=st=1745184016~exp=1745187616~hmac=e5fe5f0581f9703ae8a0545eb6582ca032d1566f117d057f65b4039d3320972e&w=826'
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPage(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 40.h, // Set a fixed width for each item
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.broken_image));
              },
            ),
          ],
        ),
      ),
    );
  }
}
