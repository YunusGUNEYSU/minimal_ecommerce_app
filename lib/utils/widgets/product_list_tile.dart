import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/core/constants/border.dart';
import 'package:minimal_ecommerce_app/core/constants/padding.dart';
import 'package:minimal_ecommerce_app/utils/widgets/app_button.dart';
import 'package:minimal_ecommerce_app/utils/widgets/custom_dialog.dart';
import 'package:provider/provider.dart';

import '../../features/models/product.dart';
import '../../features/provider/shop.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
  });
  final Product product;
  void addToCart(BuildContext context) {
    showAdaptiveDialog(
        builder: (context) {
          return CustomDialog(
            content: 'Add this item to your cart ?',
            onTap: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product);
            },
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary, borderRadius: AppBorder.circular()),
      margin: const AppPadding.normalAll(),
      padding: const AppPadding.heightAll(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: AppBorder.circular()),
                    padding: const AppPadding.heightAll(),
                    child: Image.asset(product.image,)),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                product.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(product.description),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              AppButton(
                  onTap: () {
                    addToCart(context);
                  },
                  child: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
