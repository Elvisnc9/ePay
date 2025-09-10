import 'package:cached_network_image/cached_network_image.dart';
import 'package:epay/Widget/advert.dart';
import 'package:epay/Widget/edge_to_edge.dart';
import 'package:epay/constant/color.dart';
import 'package:epay/model/last_recipents.dart';
import 'package:epay/model/transactions.dart';
import 'package:epay/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  final bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final theme = Theme.of(context);
    return EdgeToEdgeWrapperWidget(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 2.h, right: 2.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/App-Logo.png',
                        width: 12.w,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        'Pesoredee',
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 20,
                        child: IconButton(
                         icon : Icon(
                        themeMode == ThemeMode.light
                        ? Icons.nightlight_round
                        :Icons.wb_sunny,
                          ),

                          onPressed: (){
                            ref.read(themeProvider.notifier).state =
                             themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light; 
                          },
                      ))
                    ],
                  ),

                  SizedBox(
                    height: 2.h,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Elvis\'s Card Balance',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.grey)),

                      //BALANCE
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Center(
                          child: Text(
                            _isBalanceVisible ? '\$21,928.320' : '\$ ******',
                            style: theme.textTheme.labelLarge
                                ?.copyWith(color: AppColors.dark, fontSize: 35),
                          ),
                        ),
                      ),

                      Container(
                        width: 160,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 0.5.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primary),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Money on hold ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.grey)),
                            Text(
                              '\$400',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 1.h,
                  ),

                  //Send AND Recieve Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionButton(
                        theme: theme,
                        icon: Icons.upcoming_outlined,
                        text: 'Recieve',
                      ),
                      ActionButton(
                        theme: theme,
                        icon: Icons.move_down,
                        text: 'Send',
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 2.h,
                  ),

                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color:  AppColors.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Last Recipients',
                                style: theme.textTheme.titleMedium),
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
                        SizedBox(
                          height: 7.h,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: lastRecipents
                                .map((recipent) => Recipients(
                                      image: recipent.image,
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 22.h, child: Advert()),
                  //Last Recipents

                  SizedBox(
                    height: 1.h,
                  ),

                  Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.theme,
    required this.icon,
    required this.text,
  });

  final ThemeData theme;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.orange),
              child: Icon(
                icon,
                size: 20,
                weight: 2,
              ),
            ),
          ),
          Text(
            text,
            style: theme.textTheme.titleMedium?.copyWith(color: AppColors.dark),
          ),
        ],
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
                    color: AppColors.light, shape: BoxShape.circle),
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
                      child: Image.asset('assets/images/sign.png'),
                    )
                  ],
                )),
            SizedBox(
              width: 1.w,
            ),
            Container(
              height: 7.h,
              width: 5.h,
              decoration:
                  BoxDecoration(color: AppColors.light, shape: BoxShape.circle),
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
  final String image;
  const Recipients({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[200],
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: image,
                width: 40,
                height: 40,
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
