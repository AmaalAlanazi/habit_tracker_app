import 'package:flutter/material.dart';

Widget input(
  String hint, {
  TextEditingController? controller,
  String? Function(String?)? validator,
  bool isPassword = false,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hint,
    ),
  );
}