import 'package:flutter/material.dart';

import '../widgets/animation_card.dart';

class TweenAnimationScreen extends StatefulWidget {
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _colorController;
  late AnimationController _rotationController;
  late AnimationController _slideController;

  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Size Animation Controller
    _sizeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Color Animation Controller
    _colorController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Rotation Animation Controller
    _rotationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Slide Animation Controller
    _slideController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Size Tween Animation
    _sizeAnimation = Tween<double>(begin: 50.0, end: 150.0).animate(
      CurvedAnimation(parent: _sizeController, curve: Curves.elasticOut),
    );

    // Color Tween Animation
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );

    // Rotation Tween Animation
    _rotationAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.bounceOut),
    );

    // Slide Tween Animation
    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: const Offset(1.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: _slideController,
            curve: Curves.easeInOutCubic,
          ),
        );

    // Start all animations
    _startAnimations();
  }

  void _startAnimations() {
    _sizeController.repeat(reverse: true);
    _colorController.repeat(reverse: true);
    _rotationController.repeat();
    _slideController.repeat(reverse: true);
  }

  void _stopAnimations() {
    _sizeController.stop();
    _colorController.stop();
    _rotationController.stop();
    _slideController.stop();
  }

  void _resetAnimations() {
    _sizeController.reset();
    _colorController.reset();
    _rotationController.reset();
    _slideController.reset();
    _startAnimations();
  }

  @override
  void dispose() {
    _sizeController.dispose();
    _colorController.dispose();
    _rotationController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animations'),
        backgroundColor: Colors.blue,
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
            colors: [Colors.blue.withOpacity(0.1), Colors.white],
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

            // Animation examples
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // Size Animation
                    AnimationCard(
                      title: 'Size Animation (Tween)',
                      description:
                          'Elastic scaling animation using Tween<double>',
                      codeSnippet: '''
Tween<double>(begin: 50.0, end: 150.0).animate(
  CurvedAnimation(
    parent: controller, 
    curve: Curves.elasticOut
  )
)''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _sizeAnimation,
                          builder: (context, child) {
                            return Container(
                              width: _sizeAnimation.value,
                              height: _sizeAnimation.value,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Color Animation
                    AnimationCard(
                      title: 'Color Animation (ColorTween)',
                      description: 'Color transition using ColorTween',
                      codeSnippet: '''
ColorTween(begin: Colors.blue, end: Colors.red).animate(
  CurvedAnimation(
    parent: controller, 
    curve: Curves.easeInOut
  )
)''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _colorAnimation,
                          builder: (context, child) {
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: _colorAnimation.value,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Rotation Animation
                    AnimationCard(
                      title: 'Rotation Animation (Transform)',
                      description: 'Rotation animation with Transform.rotate',
                      codeSnippet: '''
Tween<double>(begin: 0.0, end: 2.0).animate(
  CurvedAnimation(
    parent: controller, 
    curve: Curves.bounceOut
  )
)''',
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _rotationAnimation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _rotationAnimation.value * 3.14159,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.star,
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

                    // Slide Animation
                    AnimationCard(
                      title: 'Slide Animation (SlideTransition)',
                      description: 'Slide animation using Offset tween',
                      codeSnippet: '''
Tween<Offset>(
  begin: Offset(-1.0, 0.0), 
  end: Offset(1.0, 0.0)
).animate(
  CurvedAnimation(
    parent: controller, 
    curve: Curves.easeInOutCubic
  )
)''',
                      child: ClipRect(
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                'Slide',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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
