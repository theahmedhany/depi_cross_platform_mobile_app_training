import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(size: const Size(200, 200), painter: DiamondShapePainter()),
        const SizedBox(height: 24),

        const Text(
          AppStrings.appName,
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}

class DiamondShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFF4D6)
      ..style = PaintingStyle.fill;

    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    path.moveTo(centerX, 0);
    path.quadraticBezierTo(centerX + 30, centerY - 30, size.width, centerY);
    path.quadraticBezierTo(centerX + 30, centerY + 30, centerX, size.height);
    path.quadraticBezierTo(centerX - 30, centerY + 30, 0, centerY);
    path.quadraticBezierTo(centerX - 30, centerY - 30, centerX, 0);

    canvas.drawPath(path, paint);

    final gradient = RadialGradient(
      colors: [const Color(0xFFFFF9E6), const Color(0xFFFFE5B8)],
    );

    final gradientPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: 100),
      );

    canvas.drawPath(path, gradientPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
