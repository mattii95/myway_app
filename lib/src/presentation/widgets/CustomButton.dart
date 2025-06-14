import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsetsGeometry? margin;

  const CustomButton({
    super.key,
    required this.width,
    required this.label,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.deepPurple,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
