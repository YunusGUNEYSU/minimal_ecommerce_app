import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_ecommerce_app/core/constants/padding.dart';
import 'package:minimal_ecommerce_app/utils/routes/route.dart';
import 'package:minimal_ecommerce_app/utils/widgets/drawer.dart';
import 'package:minimal_ecommerce_app/utils/widgets/product_list_tile.dart';
import 'package:provider/provider.dart';

import '../provider/shop.dart';

final class ShopPage extends StatelessWidget {
  const ShopPage({super.key});
  static const String _appBartTitle = 'Shop';
  static const String _headerBody = 'Pick from a selected list of premium products';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final products = context.watch<Shop>().products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, AppRoute.cartPage),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const AppPadding.onlyLeft(),
            child: Text(
              _appBartTitle,
              style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const AppPadding.onlyLeft(),
            child: Text(
              _headerBody,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          SizedBox(
            height: size.height * 0.67,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return ProductListTile(
                  product: product,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
