import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnalogClock extends StatelessWidget {
  final DateTime datetime;
  final double size;

  const AnalogClock({super.key, required this.datetime, this.size = 200});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _AnalogClockPainter(datetime),
      ),
    );
  }
}

class _AnalogClockPainter extends CustomPainter {
  final DateTime datetime;

  _AnalogClockPainter(this.datetime);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final fillPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius, fillPaint);

    final borderPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02;
    canvas.drawCircle(center, radius, borderPaint);

    // Draw hour markers
    final tickPaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 60; i++) {
      final angle = (i / 60) * 2 * 3.141592653589793;
      final isHour = i % 5 == 0;
      final tickLength = isHour ? radius * 0.12 : radius * 0.06;
      final inner = Offset(
        center.dx + (radius - tickLength) * math.sin(angle),
        center.dy - (radius - tickLength) * math.cos(angle),
      );
      final outer = Offset(
        center.dx + radius * math.sin(angle),
        center.dy - radius * math.cos(angle),
      );
      canvas.drawLine(inner, outer, tickPaint..strokeWidth = isHour ? size.width * 0.02 : size.width * 0.007);
    }

    // Calculate hand angles
    final secondAngle = (datetime.second + datetime.millisecond / 1000) * 6 * (3.141592653589793 / 180);
    final minuteAngle = (datetime.minute + datetime.second / 60) * 6 * (3.141592653589793 / 180);
    final hourAngle = ((datetime.hour % 12) + datetime.minute / 60) * 30 * (3.141592653589793 / 180);

    // Hour hand
    final hourHandPaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = size.width * 0.04
      ..strokeCap = StrokeCap.round;
    final hourHand = Offset(
      center.dx + (radius * 0.5) * math.sin(hourAngle),
      center.dy - (radius * 0.5) * math.cos(hourAngle),
    );
    canvas.drawLine(center, hourHand, hourHandPaint);

    // Minute hand
    final minuteHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = size.width * 0.03
      ..strokeCap = StrokeCap.round;
    final minuteHand = Offset(
      center.dx + (radius * 0.72) * math.sin(minuteAngle),
      center.dy - (radius * 0.72) * math.cos(minuteAngle),
    );
    canvas.drawLine(center, minuteHand, minuteHandPaint);

    // Second hand
    final secondHandPaint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.round;
    final secondHand = Offset(
      center.dx + (radius * 0.82) * math.sin(secondAngle),
      center.dy - (radius * 0.82) * math.cos(secondAngle),
    );
    canvas.drawLine(center, secondHand, secondHandPaint);

    // center dot
    final centerDot = Paint()..color = Colors.black;
    canvas.drawCircle(center, size.width * 0.02, centerDot);
  }

  @override
  bool shouldRepaint(covariant _AnalogClockPainter oldDelegate) => oldDelegate.datetime != datetime;
}

// Small math helpers (sin/cos using radians)

