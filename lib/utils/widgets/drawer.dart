import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_ecommerce_app/core/constants/padding.dart';
import 'package:minimal_ecommerce_app/utils/constants/asset.dart';
import 'package:minimal_ecommerce_app/utils/routes/route.dart';
import 'package:minimal_ecommerce_app/utils/widgets/drawer_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  static const _shopText = 'Shop';
  static const _cartText = 'Cart';
  static const _exitText = 'Exit';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Container(child: Lottie.asset(AssetEnum.shopBag.path, repeat: true))),
              AppListTile(
                  text: _shopText, onTap: () => Navigator.of(context).pop(), icon: Icons.home),
              AppListTile(
                  text: _cartText,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(AppRoute.cartPage);
                  },
                  icon: Icons.shopping_cart),
            ],
          ),
          Padding(
            padding: const AppPadding.onlyBottom(),
            child: AppListTile(
                text: _exitText,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, AppRoute.introPage, (route) => false),
                icon: Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
