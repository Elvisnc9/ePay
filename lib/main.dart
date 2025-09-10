// ignore_for_file: non_constant_identifier_names

import 'package:epay/pages/homePage.dart';
import 'package:epay/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(
    ProviderScope(
      child: TheResponsiveBuilder(builder: (Context, Orientation, ScreenType) {
      return const MyApp();
        }),
    ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ePay',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const Homepage(),
    );
  }
}
