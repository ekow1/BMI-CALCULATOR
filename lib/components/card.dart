import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final VoidCallback? onClick;

  const BoxCard({
    Key? key,
    this.colour,
    this.cardChild,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
