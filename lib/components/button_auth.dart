import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const Button({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 100.0, vertical: 25.0),
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            text,
            style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            )),
          )),
    );
  }
}
