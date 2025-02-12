import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {

  TextEditingController TEController;
  String label;
  bool obscureText;
  String? errorText;
  String? hintText;
  Widget prefixIcon;
  Widget? suffixIcon;

  InputWidget({
    super.key,
    required this.TEController,
    required this.obscureText,
    required this.prefixIcon,
    required this.label,
    this.suffixIcon,
    this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: TEController,
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20,),
        ),
        errorText: errorText,
      ),
    );
  }
}