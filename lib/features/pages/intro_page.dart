import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_ecommerce_app/utils/constants/asset.dart';
import 'package:minimal_ecommerce_app/utils/routes/route.dart';
import 'package:minimal_ecommerce_app/utils/widgets/app_button.dart';

final class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static const String description = 'Premium Quality Products';
  static const String title = 'Minimal Shop';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetEnum.shopBag.path,
                animate: true,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                height: size.height * 0.4),
            const SizedBox(
              height: 25,
            ),
            Text(
              title,
              style:
                  Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 25,
            ),
            AppButton(
                onTap: () => Navigator.pushReplacementNamed(context, AppRoute.shopPage),
                child: const Icon(Icons.arrow_forward_rounded))
          ],
        ),
      ),
    );
  }
}
