import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';

class PercentageBar extends StatefulWidget {
  final double percentage; // 0.0 to 1.0
  final double size;

  const PercentageBar({super.key, required this.percentage, this.size = 140});

  @override
  State<PercentageBar> createState() => _PercentageBarState();
}

class _PercentageBarState extends State<PercentageBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _currentPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.percentage,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    ));

    _animation.addListener(() {
      setState(() {
        _currentPercentage = _animation.value;
      });
    });

    _startAnimation();
  }

  @override
  void didUpdateWidget(PercentageBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      _animation = Tween<double>(
        begin: _currentPercentage,
        end: widget.percentage,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ));
      _startAnimation();
    }
  }

  void _startAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Convert to percent
    final percentValue = (_currentPercentage * 100).clamp(0, 100).toInt();

    // Color logic
    late List<Color> activeGradient;
    late Color inactiveColor;
    if (percentValue <= 40) {
      activeGradient = [
        Utils.hexToColor('#21CCAE'),
        Utils.hexToColor('#2CC76E'),
      ];
      inactiveColor = Utils.hexToColor('#CCF6E0');
    } else if (percentValue <= 70) {
      activeGradient = [
        Utils.hexToColor('#FFC413'),
        Utils.hexToColor('#FFDB60'),
      ];
      inactiveColor = Utils.hexToColor('#FFEEC9');
    } else {
      activeGradient = [
        Utils.hexToColor('#FD530B'),
        Utils.hexToColor('#FC3B05'),
      ];
      inactiveColor = Utils.hexToColor('#FFC1B1');
    }

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Inactive background circle
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _CirclePainter(
                color: inactiveColor,
                strokeWidth: 14,
              ),
            ),
          ),
          // Active arc
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: _GradientArcPainter(
                percentage: _currentPercentage,
                gradient: activeGradient,
                strokeWidth: 14,
              ),
            ),
          ),
          // Center text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$percentValue%',
                style: context.appTextTheme.title2.copyWith(
                  color: activeGradient.first,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'AI Generated',
                style: context.appTextTheme.body3Light.copyWith(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _CirclePainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = (size.width - strokeWidth) / 2;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _GradientArcPainter extends CustomPainter {
  final double percentage;
  final List<Color> gradient;
  final double strokeWidth;

  _GradientArcPainter({
    required this.percentage,
    required this.gradient,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double startAngle = -math.pi / 2;
    final double sweepAngle = 2 * math.pi * percentage.clamp(0.0, 1.0);

    final double radius = (size.width - strokeWidth) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    // Create a gradient shader that follows the arc
    final Paint paint = Paint()
      ..shader = SweepGradient(
        startAngle: startAngle,
        endAngle: startAngle + 2 * math.pi,
        colors: gradient,
        stops: const [0.0, 1.0],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is _GradientArcPainter &&
        (oldDelegate.percentage != percentage ||
            oldDelegate.gradient != gradient ||
            oldDelegate.strokeWidth != strokeWidth);
  }
}
