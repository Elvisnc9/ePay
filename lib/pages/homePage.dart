import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:epay/constant/color.dart';
import 'package:epay/model/last_recipents.dart';
import 'package:epay/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isBalanceVisible = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 7.h,  left: 1.h, right: 1.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(theme: theme),

            Row(
              children: [
                Text('Total balance', style: theme.textTheme.titleMedium),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  _isBalanceVisible ? '202 688 7910' : '**** **** 791',
                  style: theme.textTheme.titleMedium,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isBalanceVisible = !_isBalanceVisible;
                    });
                  },
                  icon: _isBalanceVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ],
            ),

            //BALANCE
            Text(
              _isBalanceVisible ? '\$21,928.320' : '\$ ******',
              style: theme.textTheme.labelLarge?.copyWith(
                color: AppColors.dark,
              ),
            ),

            SizedBox(
              height: 1.h,
            ),

            //Send AND Recieve Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 7.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color: AppColors.light.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/arrow-1.svg',
                        width: 15,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        'Recieve',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: AppColors.dark),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 7.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color: AppColors.light.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/arrow-2.svg',
                        width: 15,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        'Send',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: AppColors.dark),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            SizedBox(
              height: 2.h,
            ),
            //Last Recipents

            Row(
              children: [
                Text('Last Recipients', style: theme.textTheme.titleMedium),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: AppColors.dark),
                    ))
              ],
            ),

            //Last Recipents List

            SizedBox(
              height: 15.h,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: lastRecipents
                    .map((recipent) => Recipients(
                          name: recipent.name,
                          image: recipent.image,
                        ))
                    .toList(),
              ),
            ),

            SizedBox(
              height: 22.h,
              child: HorizontalListViewWithIndicator()),

   


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lastest Transactions',
                  style: theme.textTheme.titleMedium,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: AppColors.dark),
                    ))
              ],
            ),

            

            //latest Transactions
            SizedBox(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: latest
                    .map((transaction) => Lastest_Transactions(
                          title: transaction.title,
                          date: transaction.date,
                          amount: transaction.amount,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: AppColors.dark.withOpacity(0.6)),
                ),
                Text(
                  'Ngwu Elvis Chukwudalu',
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 1.8.h, color: AppColors.dark.withOpacity(0.6)),
                ),
              ],
            ),
            const Spacer(),
            Container(
                height: 7.h,
                width: 5.h,
                decoration: BoxDecoration(
                    color: AppColors.light,
                    shape: BoxShape.circle),
                child: Stack(
                  children: [
                    Center(
                      child: LineIcon.bell(
                        color: AppColors.dark.withOpacity(0.8),
                        size: 25,
                      ),
                    ),
                    Positioned(
                      right: -10,
                      top: 0,
                      left: 0,
                      child:Image.asset('assets/images/sign.png') ,)
                  ],
                )),
            SizedBox(
              width: 1.w,
            ),
            Container(
              height: 7.h,
              width: 5.h,
              decoration: BoxDecoration(
                  color: AppColors.light,
                  shape: BoxShape.circle),
              child: LineIcon(
                Icons.menu,
                color: AppColors.dark.withOpacity(0.8),
                size: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Recipients extends StatelessWidget {
  final String name;
  final String image;
  const Recipients({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.dark,
                  fontSize: 1.5.h,
                ),
          ),
        ],
      ),
    );
  }
}

class Lastest_Transactions extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String status = 'Successful';
  final String image = 'assets/images/cashapp.jpg';
  const Lastest_Transactions(
      {super.key,
      required this.title,
      required this.date,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 8.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(image),
              backgroundColor: AppColors.dark,
            ),
            SizedBox(width: 2.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: 2.2.h),
                ),
                SizedBox(height: 2),
                Text(
                  date,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 1.5.h),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text('-\$' + amount, style: theme.textTheme.labelMedium),
                Text(
                  status,
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 1.5.h,
                      color: const Color.fromARGB(255, 23, 169, 27)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}










class HorizontalListViewWithIndicator extends StatefulWidget {
  @override
  _HorizontalListViewWithIndicatorState createState() =>
      _HorizontalListViewWithIndicatorState();
}

class _HorizontalListViewWithIndicatorState
    extends State<HorizontalListViewWithIndicator> {
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



//                      ClipRRect(
//   borderRadius: BorderRadius.circular(15),
//   child: Container(
    
//     height: 20.h, // or a fixed height like 200
//     width: double.infinity,
//     child: Stack(
//       fit: StackFit.expand,
//       children: [
//         Image.network(
//           'https://img.freepik.com/premium-psd/bank-services-instagram-posts_23-2150248578.jpg?w=826',
//           fit: BoxFit.cover,
//           loadingBuilder: (context, child, loadingProgress) {
//             if (loadingProgress == null) return child;
//             return Center(child: CircularProgressIndicator());
//           },
//           errorBuilder: (context, error, stackTrace) {
//             return Center(child: Icon(Icons.broken_image));
//           },
//         ),

//       ],
//     ),
//   ),
// ),