import 'package:flutter/material.dart';

import '../widgets/animation_card.dart';

class AnimationBuilderScreen extends StatefulWidget {
  const AnimationBuilderScreen({super.key});

  @override
  State<AnimationBuilderScreen> createState() => _AnimationBuilderScreenState();
}

class _AnimationBuilderScreenState extends State<AnimationBuilderScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _waveController;
  late AnimationController _morphController;
  late AnimationController _multiController;

  late Animation<double> _pulseAnimation;
  late Animation<double> _waveAnimation;
  late Animation<double> _morphAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    // Pulse Animation
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Wave Animation
    _waveController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _waveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.easeInOut),
    );

    // Morph Animation
    _morphController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _morphAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _morphController, curve: Curves.elasticInOut),
    );

    // Multi Animation (Scale + Rotate)
    _multiController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _multiController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _rotateAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _multiController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _startAnimations();
  }

  void _startAnimations() {
    _pulseController.repeat(reverse: true);
    _waveController.repeat();
    _morphController.repeat(reverse: true);
    _multiController.repeat();
  }

  void _stopAnimations() {
    _pulseController.stop();
    _waveController.stop();
    _morphController.stop();
    _multiController.stop();
  }

  void _resetAnimations() {
    _pulseController.reset();
    _waveController.reset();
    _morphController.reset();
    _multiController.reset();
    _startAnimations();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    _morphController.dispose();
    _multiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBuilder Examples'),
        backgroundColor: Colors.green,
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
            colors: [Colors.green.withOpacity(0.1), Colors.white],
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
                    // Pulse Animation
                    AnimationCard(
                      title: 'Pulse Animation',
                      description: 'Simple scale pulse using AnimatedBuilder',
                      codeSnippet: '''
AnimatedBuilder(
  animation: pulseAnimation,
  builder: (context, child) {
    return Transform.scale(
      scale: pulseAnimation.value,
      child: child,
    );
  },
  child: Container(...),
)''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _pulseAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _pulseAnimation.value,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.favorite,
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

                    // Wave Animation
                    AnimationCard(
                      title: 'Wave Animation',
                      description: 'Sine wave animation with AnimatedBuilder',
                      codeSnippet: '''
AnimatedBuilder(
  animation: waveAnimation,
  builder: (context, child) {
    return Transform.translate(
      offset: Offset(
        0, 
        sin(waveAnimation.value * 2 * pi) * 20
      ),
      child: child,
    );
  },
)''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _waveAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                0,
                                (3.14159 * 2 * _waveAnimation.value).sin() * 20,
                              ),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.waves,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Morph Animation
                    AnimationCard(
                      title: 'Morph Animation',
                      description: 'Shape morphing with BorderRadius animation',
                      codeSnippet: '''
AnimatedBuilder(
  animation: morphAnimation,
  builder: (context, child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          morphAnimation.value * 50
        ),
      ),
    );
  },
)''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _morphAnimation,
                          builder: (context, child) {
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(
                                  _morphAnimation.value * 50,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Morph',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Multi Animation
                    AnimationCard(
                      title: 'Multi Animation',
                      description: 'Combined scale and rotation with intervals',
                      codeSnippet: '''
AnimatedBuilder(
  animation: multiController,
  builder: (context, child) {
    return Transform.scale(
      scale: scaleAnimation.value,
      child: Transform.rotate(
        angle: rotateAnimation.value * pi,
        child: child,
      ),
    );
  },
)''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _multiController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: Transform.rotate(
                                angle: _rotateAnimation.value * 3.14159,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.autorenew,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
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
}

extension on double {
  double sin() => 3.14159 * 2 * this;
}
