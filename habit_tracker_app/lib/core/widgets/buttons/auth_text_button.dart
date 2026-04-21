import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthTextButton extends StatelessWidget {
  final String text;
  final String actionText;
  final String route;
  final Color actionColor;
  final Color textColor;

  const AuthTextButton({
    super.key,
    required this.text,
    required this.actionText,
    required this.route,
    required this.actionColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$text ",
        style: TextStyle(color: textColor),
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                context.push(route);
              },
              child: Text(
                actionText,
                style: TextStyle(
                  color: actionColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}