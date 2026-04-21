import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.push('/forgotPassword'),
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}