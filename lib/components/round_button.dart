import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    this.colour,
    this.iconColor,
    this.tap,
    this.icon,
  });

  final Color? colour;
  final VoidCallback? tap;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: tap,
      fillColor: colour,
      shape: const CircleBorder(),
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
