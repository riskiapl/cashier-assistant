import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final double borderRadius;
  final Color iconColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.borderRadius = 16.0,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: iconColor),
      ),
      child: Center(child: icon),
    );
  }
}
