import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InsightWarningBanner extends StatelessWidget {
  const InsightWarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFFDE9EC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.pink, size: 24),
              Gap(10),
              Expanded(
                child: Text(
                  "Your habits score dropped 12% compared to yesterday.",
                  style: TextStyle(color: Color(0xFF880E4F), fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Gap(15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1E1E1E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text("Let's discuss", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}