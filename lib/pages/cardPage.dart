// ignore_for_file: must_be_immutable

import 'package:epay/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:line_icons/line_icon.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: 6.h, left: 2.w, right: 2.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is Where',
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.dark.withOpacity(0.5),
                          fontSize: 1.8.h),
                    ),
                    Text(
                      'List all Your Credit Cards',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontSize: 1.8.h),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                    height: 7.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                        color: AppColors.light, shape: BoxShape.circle),
                    child: Center(
                      child: LineIcon.plus(
                        color: AppColors.dark.withOpacity(0.8),
                        size: 25,
                      ),
                    )),
                SizedBox(
                  width: 1.w,
                ),
                Container(
                  height: 7.h,
                  width: 5.h,
                  decoration: BoxDecoration(
                      color: AppColors.light, shape: BoxShape.circle),
                  child: LineIcon(
                    Icons.menu,
                    color: AppColors.dark.withOpacity(0.8),
                    size: 20,
                  ),
                ),
              ],
            ),
            Card_Swipe(),


            Text(
              'Monthly Card Balance',
              style: theme.textTheme.titleLarge?.copyWith(
                 fontSize: 2.2.h, color: AppColors.dark,
                 ),
            ),
            SizedBox(
              height:0.5.h
            ),
            Text(
              '\$ 12,550.310',
              style: theme.textTheme.labelLarge?.copyWith(
               color: AppColors.dark, fontSize: 6.h,
                 ),
            ),

            SizedBox(
              height: 1.h,
            ),

            CardDetails(theme: theme),
          ],
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'card Details',
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 1.8.h, color: AppColors.dark,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: AppColors.dark),
                ))
          ],
        ),
        SizedBox(
          height: 1.h,
        ),

       

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CVV:',
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 1.8.h, color: AppColors.dark,
              ),
            ),

            Text(
              '435',
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 1.8.h, color: AppColors.dark,
              ),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Valid:',
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 1.8.h, color: AppColors.dark,
              ),
            ),

            Text(
              '12/25',
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 1.8.h, color: AppColors.dark,
              ),
            )
          ],
        ),

          SizedBox(
          height: 2.h,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Card Number:',
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 1.8.h, color: AppColors.dark,
              ),
            ),

            Text(
              '162  **** **12',
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 1.8.h, color: AppColors.dark,
              ),
            )
          ],
        ),
      ],
    );
  }
}








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
