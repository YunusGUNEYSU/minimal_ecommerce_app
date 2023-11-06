import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_ecommerce_app/core/constants/border.dart';
import 'package:minimal_ecommerce_app/core/constants/padding.dart';
import 'package:minimal_ecommerce_app/features/models/product.dart';
import 'package:minimal_ecommerce_app/utils/widgets/app_button.dart';
import 'package:minimal_ecommerce_app/utils/widgets/custom_dialog.dart';
import 'package:provider/provider.dart';

import '../provider/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(BuildContext context, Product product) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          content: 'Are you sure remove this item ?',
          onTap: () {
            context.read<Shop>().deleteFromCart(product);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void showPayDialog(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          content: 'User wants to pay.Connect your backend',
          onTap: () => Navigator.pop(context),
        );
      },
    );
  }

  static const String _title = 'Cart';
  static const String _subtitle = 'Check your cart before paying!';
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const AppPadding.onlyLeft(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(_subtitle),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (BuildContext context, int index) {
                final cartItem = cart[index];
                return Container(
                  margin: const AppPadding.normalHorizontal(),
                  padding: const AppPadding.normalAll(),
                  decoration: BoxDecoration(
                    borderRadius: AppBorder.circular(),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: ListTile(
                      leading: Container(
                          padding: const AppPadding.normalAll(),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: AppBorder.circular()),
                          child: const Icon(Icons.favorite)),
                      title: Text(cartItem.name),
                      subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
                      trailing: IconButton.filled(
                          onPressed: () {
                            removeFromCart(context, cartItem);
                          },
                          icon: const Icon(Icons.close))),
                );
              },
            ),
          ),
          Center(
              child: AppButton(
            onTap: () {
              showPayDialog(context);
            },
            width: size.width * 0.8,
            child: const Center(child: Text('PAY NOW')),
          )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
