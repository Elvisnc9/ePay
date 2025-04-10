import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.w),
      child:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text('Welcome', style: theme.textTheme.titleLarge,
            )
          ],
        ),
        
      ),
    );
  }
}