import 'package:epay/Widget/chart.dart';
import 'package:epay/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 7.h, left: 1.h, right: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Expenses',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.dark,
                  fontSize: 4.5.h
                ) ,
              ),

              SizedBox(height: 4.h),
             


            ],
          ),
        ),
      
      
    );

  }

}

  






