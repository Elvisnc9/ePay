// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class Card_Swipe extends StatelessWidget {
  Card_Swipe({super.key});
  List<String> cardList = [
    'assets/images/card1-.png',
    'assets/images/card2.png',
    'assets/images/card3-.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: CardSwiper(
          numberOfCardsDisplayed: 3,
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 1.w),
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              Image.asset(
                cardList[index],
                fit: BoxFit.cover,
              ),
          cardsCount: cardList.length),
    );
  }
}
