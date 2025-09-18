import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimationConstants {
  // Duration constants
  static const Duration fastDuration = Duration(milliseconds: 300);
  static const Duration normalDuration = Duration(milliseconds: 600);
  static const Duration slowDuration = Duration(seconds: 1);
  static const Duration verySlowDuration = Duration(seconds: 2);

  // Common curves
  static const Curve bounceInCurve = Curves.bounceIn;
  static const Curve bounceOutCurve = Curves.bounceOut;
  static const Curve elasticInCurve = Curves.elasticIn;
  static const Curve elasticOutCurve = Curves.elasticOut;
  static const Curve easeInOutCurve = Curves.easeInOut;

  // Common colors for animations
  static const List<Color> rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  // Animation sizes
  static const double smallSize = 60;
  static const double mediumSize = 100;
  static const double largeSize = 150;
}

class AnimationUtils {
  /// Generate a sequence of delayed animations
  static List<Duration> generateDelays(int count, Duration interval) {
    return List.generate(
      count,
      (index) => Duration(milliseconds: interval.inMilliseconds * index),
    );
  }

  /// Get a color from the rainbow colors list by index
  static Color getRainbowColor(int index) {
    return AnimationConstants.rainbowColors[index %
        AnimationConstants.rainbowColors.length];
  }

  /// Interpolate between two colors
  static Color interpolateColor(Color start, Color end, double progress) {
    return Color.lerp(start, end, progress) ?? start;
  }

  /// Create a custom curve that bounces twice
  static double doubleBounce(double t) {
    if (t < 0.5) {
      return 2 * t * t;
    } else {
      return -1 + (4 - 2 * t) * t;
    }
  }
}

/// Custom curves for animations
class CustomCurves {
  static const Curve smoothStep = _SmoothStepCurve();
  static const Curve bounce = _BounceInOutCurve();
  static const Curve wave = _WaveCurve();
}

class _SmoothStepCurve extends Curve {
  const _SmoothStepCurve();

  @override
  double transform(double t) {
    return t * t * (3.0 - 2.0 * t);
  }
}

class _BounceInOutCurve extends Curve {
  const _BounceInOutCurve();

  @override
  double transform(double t) {
    if (t < 0.5) {
      return 0.5 * _bounceOut(1 - 2 * t);
    } else {
      return 0.5 * _bounceOut(2 * t - 1) + 0.5;
    }
  }

  double _bounceOut(double t) {
    if (t < 1 / 2.75) {
      return 7.5625 * t * t;
    } else if (t < 2 / 2.75) {
      return 7.5625 * (t -= 1.5 / 2.75) * t + 0.75;
    } else if (t < 2.5 / 2.75) {
      return 7.5625 * (t -= 2.25 / 2.75) * t + 0.9375;
    } else {
      return 7.5625 * (t -= 2.625 / 2.75) * t + 0.984375;
    }
  }
}

class _WaveCurve extends Curve {
  const _WaveCurve();

  @override
  double transform(double t) {
    return (1 + math.sin(6.28318 * t)) / 2;
  }
}
