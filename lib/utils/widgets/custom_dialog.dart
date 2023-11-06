import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.content, required this.onTap});
  final String content;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: Text(content),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        MaterialButton(
          onPressed: onTap,
          child: const Text('Yes'),
        )
      ],
    );
  }
}
