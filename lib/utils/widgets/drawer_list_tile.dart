import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/core/constants/padding.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({super.key, required this.text, required this.onTap, required this.icon});
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const AppPadding.heightAll(),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
