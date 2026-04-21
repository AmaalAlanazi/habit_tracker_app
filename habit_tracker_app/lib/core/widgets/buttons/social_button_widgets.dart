  import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget socialButton(String text) {
    return Container(
      height: 55,
      width: 100.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(child: Text(text)),
    );
  }
