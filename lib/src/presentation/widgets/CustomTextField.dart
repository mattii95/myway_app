import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final EdgeInsetsGeometry? margin;
  const CustomTextField({super.key, required this.label, required this.icon, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(label),
          border: InputBorder.none,
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 12),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(height: 22, width: 1, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
