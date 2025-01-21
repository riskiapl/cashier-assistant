import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final Icon icon;
  final double borderRadius;
  final Color containerColor;
  final Color iconColor;

  const IconButton({
    super.key,
    required this.icon,
    this.borderRadius = 8.0,
    this.containerColor = Colors.white,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.all(8.0),
        child: icon,
      ),
    );
  }
}
