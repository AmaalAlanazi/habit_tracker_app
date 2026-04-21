import 'package:flutter/material.dart';
import 'dart:math';

import 'package:gap/gap.dart';


class HabitCircleProgress extends StatelessWidget {
  final int progress;
  final int total;
  final List<String> habitIcons;

  const HabitCircleProgress({
    super.key,
    required this.progress,
    required this.habitIcons,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              progress.toString(),
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "out of $total",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Gap(8),
            Text(
              "Your daily habits are not\ncompleted.",
              textAlign: .center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: HabitCircleEmojisPainter(
              iconCount: total,
              completedCount: progress.toInt(),
              emojis: habitIcons,
            ),
          ),
        ),
      ],
    );
  }
}

class HabitCircleEmojisPainter extends CustomPainter {
  final int iconCount;
  final int completedCount;
  final List<String> emojis;

  HabitCircleEmojisPainter({
    required this.iconCount,
    required this.completedCount,
    required this.emojis,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double totalGapAngle = 0.15;
    final double segmentAngle = (2 * pi / iconCount) - totalGapAngle;

    List<Color> pastelColors = [
      Color(0xFFE1BEE7),
      Color(0xFFC8E6C9),
      Color(0xFFF8BBD0),
      Color(0xFFFFE0B2),
      Color(0xFFB3E5FC),
      Color(0xFFFFF9C4),
    ];

    for (int i = 0; i < iconCount; i++) {
      final double startAngle = (i * (segmentAngle + totalGapAngle)) - pi / 2;
      final Color segmentColor = pastelColors[i % pastelColors.length];

      final Paint paint = Paint()
        ..color = segmentColor.withValues(alpha: i < completedCount ? 1.0 : 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 35
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - 25),
        startAngle,
        segmentAngle,
        false,
        paint,
      );

      if (i < emojis.length) {
        final double currentAngle = startAngle + (segmentAngle / 2);
        final double iconRadius = radius - 25;
        final double x = center.dx + iconRadius * cos(currentAngle);
        final double y = center.dy + iconRadius * sin(currentAngle);

        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: emojis[i],
            style: TextStyle(
              fontSize: 22,
              color: Colors.white.withValues(
                alpha: i < completedCount ? 1.0 : 0.5,
              ),
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
