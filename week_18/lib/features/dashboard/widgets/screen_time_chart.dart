import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ScreenTimeChart extends StatelessWidget {
  final List<double> data;

  const ScreenTimeChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final timeLabels = ['AM', '10 AM', '12 PM', '2 PM', '4 PM', '6 PM', '8 PM'];

    return Column(
      children: [
        SizedBox(
          height: 100,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width - 96, 100),
            painter: ChartPainter(data: data),
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: timeLabels.map((label) {
            return Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: AppColors.textLight,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ChartPainter extends CustomPainter {
  final List<double> data;

  ChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.chartGreen
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final stepX = size.width / (data.length - 1);

    path.moveTo(0, size.height - (data[0] * size.height));

    for (int i = 0; i < data.length - 1; i++) {
      final x1 = i * stepX;
      final y1 = size.height - (data[i] * size.height);
      final x2 = (i + 1) * stepX;
      final y2 = size.height - (data[i + 1] * size.height);

      final controlX1 = x1 + (x2 - x1) / 3;
      final controlY1 = y1;
      final controlX2 = x1 + 2 * (x2 - x1) / 3;
      final controlY2 = y2;

      path.cubicTo(controlX1, controlY1, controlX2, controlY2, x2, y2);
    }

    canvas.drawPath(path, paint);

    final pointPaint = Paint()
      ..color = AppColors.chartGreen
      ..style = PaintingStyle.fill;

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = size.height - (data[i] * size.height);
      canvas.drawCircle(Offset(x, y), 4, pointPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
