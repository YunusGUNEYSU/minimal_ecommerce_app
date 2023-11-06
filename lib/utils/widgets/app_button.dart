import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/core/constants/border.dart';
import 'package:minimal_ecommerce_app/core/constants/padding.dart';

final class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onTap, required this.child, this.width});
  final VoidCallback onTap;
  final Widget child;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          padding: const AppPadding.heightAll(),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Theme.of(context).colorScheme.secondary),
              borderRadius: AppBorder.circular(),
              color: Theme.of(context).colorScheme.secondary),
          child: child),
    );
  }
}
