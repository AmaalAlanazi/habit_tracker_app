import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SheetOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailing;
  final VoidCallback onTap;

  const SheetOption({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87),
            Gap(15),
            Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            Spacer(),
            Text(trailing, style: TextStyle(color: Colors.grey, fontSize: 13)),
            Gap(5),
            Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}