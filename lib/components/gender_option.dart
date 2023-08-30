import 'package:flutter/material.dart';

class GenderOption extends StatelessWidget {
  const GenderOption({super.key, this.icon, this.label});

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label!,
          style: const TextStyle(fontSize: 18.0),
        )
      ],
    );
  }
}
