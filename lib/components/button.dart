import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton(
      {super.key, this.colour, this.text, this.height, this.navigate});

  final Color? colour;
  final Text? text;
  final double? height;
  final VoidCallback? navigate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: navigate,
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          color: colour,
          width: double.infinity,
          height: height,
          child: Center(child: text),
        ));
  }
}
