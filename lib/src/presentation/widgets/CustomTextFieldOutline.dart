import 'package:flutter/material.dart';

class CustomTextFieldOutline extends StatelessWidget {
  final String label;
  final IconData icon;
  final EdgeInsetsGeometry? margin;
  const CustomTextFieldOutline({
    super.key,
    required this.label,
    required this.icon,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(label),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:  Color.fromRGBO(103, 58, 183, 1), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(103, 58, 183, 0.5), width: 2),
          ),
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
