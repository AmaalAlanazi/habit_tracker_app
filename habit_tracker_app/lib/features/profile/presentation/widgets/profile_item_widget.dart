import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        Gap(10),
        Text(title, style: TextStyle(color: Colors.grey)),
        Spacer(),
        Text(value, style: TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
