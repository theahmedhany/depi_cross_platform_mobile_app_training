import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../widgets/animation_card.dart';

class AnimationControllerScreen extends StatefulWidget {
  const AnimationControllerScreen({super.key});

  @override
  State<AnimationControllerScreen> createState() =>
      _AnimationControllerScreenState();
}

class _AnimationControllerScreenState extends State<AnimationControllerScreen>
    with TickerProviderStateMixin {
  late AnimationController _sequenceController;
  late AnimationController _springController;
  late AnimationController _customController;
  late AnimationController _chainController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _springAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Sequence Animation Controller
    _sequenceController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    // Spring Animation Controller
    _springController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Custom Curve Animation Controller
    _customController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Chain Animation Controller
    _chainController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    // Sequence animations with intervals
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _sequenceController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _sequenceController,
            curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _sequenceController,
        curve: const Interval(0.6, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Spring animation
    _springAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _springController, curve: Curves.elasticOut),
    );

    // Custom curve with color
    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(_customController);

    _rotationAnimation = Tween<double>(begin: 0.0, end: 4.0).animate(
      CurvedAnimation(parent: _customController, curve: const _CustomCurve()),
    );
  }

  void _startAnimations() {
    _sequenceController.repeat();
    _springController.repeat(reverse: true);
    _customController.repeat();
    _chainController.repeat();
  }

  void _stopAnimations() {
    _sequenceController.stop();
    _springController.stop();
    _customController.stop();
    _chainController.stop();
  }

  void _resetAnimations() {
    _sequenceController.reset();
    _springController.reset();
    _customController.reset();
    _chainController.reset();
    _startAnimations();
  }

  @override
  void dispose() {
    _sequenceController.dispose();
    _springController.dispose();
    _customController.dispose();
    _chainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Controllers'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _resetAnimations,
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset Animations',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.withOpacity(0.1), Colors.white],
          ),
        ),
        child: Column(
          children: [
            // Control Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _startAnimations,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _stopAnimations,
                    icon: const Icon(Icons.stop),
                    label: const Text('Stop'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _resetAnimations,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Animation Examples
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // Sequence Animation
                    AnimationCard(
                      title: 'Sequence Animation',
                      description: 'Multiple animations with intervals',
                      codeSnippet: '''
// Fade: 0.0-0.3, Slide: 0.3-0.6, Scale: 0.6-1.0
Animation<double> fadeAnimation = Tween<double>(
  begin: 0.0, end: 1.0
).animate(CurvedAnimation(
  parent: controller,
  curve: Interval(0.0, 0.3, curve: Curves.easeIn),
));''',
                      child: AnimatedBuilder(
                        animation: _sequenceController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _fadeAnimation.value,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.timeline,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Spring Animation
                    AnimationCard(
                      title: 'Spring Animation',
                      description: 'Elastic bouncing effect',
                      codeSnippet: '''
Animation<double> springAnimation = Tween<double>(
  begin: 0.0, end: 1.0
).animate(CurvedAnimation(
  parent: controller,
  curve: Curves.elasticOut,
));''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _springAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: 0.5 + (_springAnimation.value * 0.5),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(
                                    _springAnimation.value * 50,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.sports_basketball,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Custom Curve Animation
                    AnimationCard(
                      title: 'Custom Curve Animation',
                      description: 'Custom animation curve implementation',
                      codeSnippet: '''
class CustomCurve extends Curve {
  @override
  double transform(double t) {
    return t < 0.5 
      ? 2 * t * t 
      : -1 + (4 - 2 * t) * t;
  }
}''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _customController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _rotationAnimation.value * math.pi,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: _colorAnimation.value,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.tune,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Chain Animation
                    AnimationCard(
                      title: 'Chain Animation',
                      description: 'Multiple overlapping animations',
                      codeSnippet: '''
// Multiple controllers working together
AnimationController controller1, controller2, controller3;
// Start them with delays for chain effect
controller1.forward();
Timer(Duration(milliseconds: 500), () => controller2.forward());
Timer(Duration(seconds: 1), () => controller3.forward());''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _chainController,
                          builder: (context, child) {
                            final progress = _chainController.value;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildChainCircle(0, progress, Colors.red),
                                _buildChainCircle(1, progress, Colors.green),
                                _buildChainCircle(2, progress, Colors.blue),
                              ],
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChainCircle(int index, double progress, Color color) {
    final delay = index * 0.3;
    final adjustedProgress = math.max(0.0, math.min(1.0, progress - delay));
    final scale = 0.5 + (adjustedProgress * 0.5);

    return Transform.scale(
      scale: scale,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(adjustedProgress),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '${index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Custom curve implementation
class _CustomCurve extends Curve {
  const _CustomCurve();

  @override
  double transform(double t) {
    // Custom easing function (ease-in-out with bounce)
    if (t < 0.5) {
      return 2 * t * t;
    } else {
      return -1 + (4 - 2 * t) * t;
    }
  }
}
