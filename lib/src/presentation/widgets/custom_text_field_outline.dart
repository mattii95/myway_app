import 'package:flutter/material.dart';

class CustomTextFieldOutline extends StatelessWidget {
  final String label;
  final Function(String) onChanged;
  final IconData icon;
  final EdgeInsetsGeometry? margin;
  final String? Function(String?)? validator;
  const CustomTextFieldOutline({
    super.key,
    required this.label,
    required this.onChanged,
    required this.icon,
    this.margin,
    this.validator,
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
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          label: Text(label),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(103, 58, 183, 1),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(103, 58, 183, 0.5),
              width: 2,
            ),
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 12),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon, color: Colors.deepPurple),
                Container(height: 22, width: 1, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
