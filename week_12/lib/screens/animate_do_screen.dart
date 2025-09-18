import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../widgets/animation_card.dart';

class AnimateDoScreen extends StatefulWidget {
  const AnimateDoScreen({super.key});

  @override
  State<AnimateDoScreen> createState() => _AnimateDoScreenState();
}

class _AnimateDoScreenState extends State<AnimateDoScreen> {
  bool _showAnimations = false;
  int _animationIndex = 0;

  void _triggerAnimations() {
    setState(() {
      _showAnimations = !_showAnimations;
    });
  }

  void _resetAnimations() {
    setState(() {
      _showAnimations = false;
      _animationIndex = 0;
    });

    // Small delay to ensure reset, then trigger
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _showAnimations = true;
      });
    });
  }

  void _nextAnimation() {
    setState(() {
      _animationIndex = (_animationIndex + 1) % 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animate Do Package'),
        backgroundColor: Colors.red,
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
            colors: [Colors.red.withOpacity(0.1), Colors.white],
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
                    onPressed: _triggerAnimations,
                    icon: Icon(_showAnimations ? Icons.stop : Icons.play_arrow),
                    label: Text(_showAnimations ? 'Stop' : 'Start'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _showAnimations
                          ? Colors.red
                          : Colors.green,
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
                  ElevatedButton.icon(
                    onPressed: _nextAnimation,
                    icon: const Icon(Icons.skip_next),
                    label: const Text('Next'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
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
                    // Fade Animations
                    AnimationCard(
                      title: 'Fade Animations',
                      description: 'FadeIn, FadeOut, FadeInUp, FadeInDown',
                      codeSnippet: '''
import 'package:animate_do/animate_do.dart';

FadeIn(
  duration: Duration(seconds: 1),
  child: Container(...),
)

FadeInUp(
  duration: Duration(seconds: 1),
  child: Container(...),
)''',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _showAnimations
                              ? FadeIn(
                                  duration: const Duration(seconds: 1),
                                  child: _buildAnimatedBox(
                                    Colors.blue,
                                    Icons.visibility,
                                    'Fade In',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.visibility,
                                  'Fade In',
                                ),
                          _showAnimations
                              ? FadeInUp(
                                  duration: const Duration(seconds: 1),
                                  child: _buildAnimatedBox(
                                    Colors.green,
                                    Icons.arrow_upward,
                                    'Fade Up',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.arrow_upward,
                                  'Fade Up',
                                ),
                          _showAnimations
                              ? FadeInDown(
                                  duration: const Duration(seconds: 1),
                                  child: _buildAnimatedBox(
                                    Colors.orange,
                                    Icons.arrow_downward,
                                    'Fade Down',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.arrow_downward,
                                  'Fade Down',
                                ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Bounce Animations
                    AnimationCard(
                      title: 'Bounce Animations',
                      description: 'BounceIn, BounceInUp, BounceInDown',
                      codeSnippet: '''
BounceIn(
  duration: Duration(seconds: 1),
  child: Container(...),
)

BounceInUp(
  duration: Duration(seconds: 1),
  child: Container(...),
)''',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _showAnimations
                              ? BounceInUp(
                                  duration: const Duration(seconds: 1),
                                  child: _buildAnimatedBox(
                                    Colors.purple,
                                    Icons.sports_basketball,
                                    'Bounce',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.sports_basketball,
                                  'Bounce',
                                ),
                          _showAnimations
                              ? BounceInUp(
                                  duration: const Duration(milliseconds: 1200),
                                  child: _buildAnimatedBox(
                                    Colors.teal,
                                    Icons.trending_up,
                                    'Bounce Up',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.trending_up,
                                  'Bounce Up',
                                ),
                          _showAnimations
                              ? BounceInDown(
                                  duration: const Duration(milliseconds: 1200),
                                  child: _buildAnimatedBox(
                                    Colors.pink,
                                    Icons.trending_down,
                                    'Bounce Down',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.trending_down,
                                  'Bounce Down',
                                ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Slide Animations
                    AnimationCard(
                      title: 'Slide Animations',
                      description: 'SlideInLeft, SlideInRight, SlideInUp',
                      codeSnippet: '''
SlideInLeft(
  duration: Duration(seconds: 1),
  child: Container(...),
)

SlideInRight(
  duration: Duration(seconds: 1),
  child: Container(...),
)''',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _showAnimations
                              ? SlideInLeft(
                                  duration: const Duration(seconds: 1),
                                  child: _buildAnimatedBox(
                                    Colors.indigo,
                                    Icons.arrow_forward,
                                    'Slide Left',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.arrow_forward,
                                  'Slide Left',
                                ),
                          _showAnimations
                              ? SlideInRight(
                                  duration: const Duration(seconds: 1),
                                  child: _buildAnimatedBox(
                                    Colors.amber,
                                    Icons.arrow_back,
                                    'Slide Right',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.arrow_back,
                                  'Slide Right',
                                ),
                          _showAnimations
                              ? SlideInUp(
                                  duration: const Duration(seconds: 1),
                                  child: _buildAnimatedBox(
                                    Colors.cyan,
                                    Icons.keyboard_arrow_up,
                                    'Slide Up',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.keyboard_arrow_up,
                                  'Slide Up',
                                ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Zoom Animations
                    AnimationCard(
                      title: 'Zoom Animations',
                      description: 'ZoomIn, ZoomOut, Pulse',
                      codeSnippet: '''
ZoomIn(
  duration: Duration(seconds: 1),
  child: Container(...),
)

Pulse(
  duration: Duration(seconds: 1),
  infinite: true,
  child: Container(...),
)''',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _showAnimations
                              ? ZoomIn(
                                  duration: const Duration(seconds: 1),
                                  child: _buildAnimatedBox(
                                    Colors.deepOrange,
                                    Icons.zoom_in,
                                    'Zoom In',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.zoom_in,
                                  'Zoom In',
                                ),
                          _showAnimations
                              ? Pulse(
                                  duration: const Duration(seconds: 1),
                                  infinite: true,
                                  child: _buildAnimatedBox(
                                    Colors.red,
                                    Icons.favorite,
                                    'Pulse',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.favorite,
                                  'Pulse',
                                ),
                          _showAnimations
                              ? Flash(
                                  duration: const Duration(seconds: 1),
                                  infinite: true,
                                  child: _buildAnimatedBox(
                                    Colors.yellow,
                                    Icons.flash_on,
                                    'Flash',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.flash_on,
                                  'Flash',
                                ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Special Animations
                    AnimationCard(
                      title: 'Special Animations',
                      description: 'Spin, Swing, Dance, Roulette',
                      codeSnippet: '''
Spin(
  duration: Duration(seconds: 2),
  infinite: true,
  child: Container(...),
)

Dance(
  duration: Duration(seconds: 1),
  infinite: true,
  child: Container(...),
)''',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _showAnimations
                              ? Spin(
                                  duration: const Duration(seconds: 2),
                                  infinite: true,
                                  child: _buildAnimatedBox(
                                    Colors.blue,
                                    Icons.refresh,
                                    'Spin',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.refresh,
                                  'Spin',
                                ),
                          _showAnimations
                              ? Swing(
                                  duration: const Duration(seconds: 1),
                                  infinite: true,
                                  child: _buildAnimatedBox(
                                    Colors.green,
                                    Icons.accessibility,
                                    'Swing',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.accessibility,
                                  'Swing',
                                ),
                          _showAnimations
                              ? Dance(
                                  duration: const Duration(milliseconds: 800),
                                  infinite: true,
                                  child: _buildAnimatedBox(
                                    Colors.purple,
                                    Icons.music_note,
                                    'Dance',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.music_note,
                                  'Dance',
                                ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Sequential Animations
                    AnimationCard(
                      title: 'Sequential Animations',
                      description: 'Multiple animations with delays',
                      codeSnippet: '''
// Using delay parameter
FadeIn(
  delay: Duration(milliseconds: 200),
  child: Container(...),
)

FadeIn(
  delay: Duration(milliseconds: 400),
  child: Container(...),
)''',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _showAnimations
                              ? FadeInUp(
                                  duration: const Duration(milliseconds: 600),
                                  delay: const Duration(milliseconds: 0),
                                  child: _buildAnimatedBox(
                                    Colors.red,
                                    Icons.looks_one,
                                    '1st',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.looks_one,
                                  '1st',
                                ),
                          _showAnimations
                              ? FadeInUp(
                                  duration: const Duration(milliseconds: 600),
                                  delay: const Duration(milliseconds: 300),
                                  child: _buildAnimatedBox(
                                    Colors.orange,
                                    Icons.looks_two,
                                    '2nd',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.looks_two,
                                  '2nd',
                                ),
                          _showAnimations
                              ? FadeInUp(
                                  duration: const Duration(milliseconds: 600),
                                  delay: const Duration(milliseconds: 600),
                                  child: _buildAnimatedBox(
                                    Colors.green,
                                    Icons.looks_3,
                                    '3rd',
                                  ),
                                )
                              : _buildAnimatedBox(
                                  Colors.grey,
                                  Icons.looks_3,
                                  '3rd',
                                ),
                        ],
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

  Widget _buildAnimatedBox(Color color, IconData icon, String label) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
