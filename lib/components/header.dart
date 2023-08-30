import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String text;
  const Header({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 50.0,
          backgroundColor: Colors.black,
          child: Center(
            child: Image.asset(
              'assets/image/giphy.gif',
              width: 500.0,
              height: 500.0,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          text,
          style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ],
    );
  }
}
