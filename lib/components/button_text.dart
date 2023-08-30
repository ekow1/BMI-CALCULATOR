import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String textDesc;
  final String action;
  final Function()? onTap;
  const BottomText({
    super.key,
    required this.textDesc,
    this.onTap,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: textDesc,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 5,
              ),
            ),
            TextSpan(
              text: action,
              style: const TextStyle(
                color: Colors.tealAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
