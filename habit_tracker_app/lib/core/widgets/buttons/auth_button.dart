import 'package:flutter/material.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/widgets/loading_widget.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;

  const AuthButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.accent,
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: isLoading ? null : onTap,
      child: isLoading
          ? LoadingWidget()
          : Text(title, style: TextStyle(fontSize: 18, fontWeight: .bold),),
    );
  }
}