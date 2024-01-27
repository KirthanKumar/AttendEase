import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboard;
  final TextEditingController contro;
  final Icon? suffixIcon; // can be null
  final TextStyle? labelTextStyle; // can be null
  final bool obscureTextIsIt;

  CustomTextFormField(
      {required this.labelText,
        required this.keyboard,
        required this.contro,
      this.suffixIcon,
      this.labelTextStyle,
      required this.obscureTextIsIt,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill specified field';
        }
        return null;
      },
      keyboardType: keyboard,
      controller: contro,
      obscureText: obscureTextIsIt,
      decoration: InputDecoration(
          label: Text(
            labelText,
            style: labelTextStyle,
          ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21),
          ),
      ),
    );
  }
}
