import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  // final Color backgroundColor;
  // final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    // required this.backgroundColor,
    // required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     padding: const EdgeInsets.all(20),
    //     margin: const EdgeInsets.symmetric(horizontal: 25),
    //     decoration: BoxDecoration(
    //         color: backgroundColor, borderRadius: BorderRadius.circular(5)),
    //     child: Center(
    //         child: Text(
    //       text,
    //       style: TextStyle(
    //           color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
    //     )),
    //   ),
    // );
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[900],
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        minimumSize: Size(double.infinity, 50), // Set width to 100%
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
