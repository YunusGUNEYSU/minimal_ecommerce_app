import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/features/pages/cart_page.dart';
import 'package:minimal_ecommerce_app/features/provider/shop.dart';
import 'package:minimal_ecommerce_app/utils/routes/route.dart';
import 'package:minimal_ecommerce_app/core/theme/app_theme.dart';
import 'package:minimal_ecommerce_app/features/pages/intro_page.dart';
import 'package:provider/provider.dart';

import 'features/pages/shope_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const IntroPage(),
      routes: {
        AppRoute.introPage: (context) => const IntroPage(),
        AppRoute.shopPage: (context) => const ShopPage(),
        AppRoute.cartPage: (context) => const CartPage()
      },
    );
  }
}
