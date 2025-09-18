import 'package:flutter/material.dart';

import '../widgets/animation_card.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  // AnimatedContainer properties
  double _containerWidth = 100;
  double _containerHeight = 100;
  Color _containerColor = Colors.blue;
  double _borderRadius = 8;

  // AnimatedOpacity
  double _opacity = 1.0;

  // AnimatedPositioned
  double _positionedTop = 20;
  double _positionedLeft = 20;

  // AnimatedAlign
  Alignment _alignment = Alignment.topLeft;

  // AnimatedPadding
  EdgeInsets _padding = const EdgeInsets.all(8.0);

  // AnimatedRotation
  double _rotation = 0.0;

  // AnimatedScale
  double _scale = 1.0;

  // AnimatedSwitcher
  bool _showFirst = true;

  void _toggleAnimations() {
    setState(() {
      // Toggle AnimatedContainer
      _containerWidth = _containerWidth == 100 ? 200 : 100;
      _containerHeight = _containerHeight == 100 ? 150 : 100;
      _containerColor = _containerColor == Colors.blue
          ? Colors.red
          : Colors.blue;
      _borderRadius = _borderRadius == 8 ? 50 : 8;

      // Toggle AnimatedOpacity
      _opacity = _opacity == 1.0 ? 0.3 : 1.0;

      // Toggle AnimatedPositioned
      _positionedTop = _positionedTop == 20 ? 80 : 20;
      _positionedLeft = _positionedLeft == 20 ? 80 : 20;

      // Toggle AnimatedAlign
      _alignment = _alignment == Alignment.topLeft
          ? Alignment.bottomRight
          : Alignment.topLeft;

      // Toggle AnimatedPadding
      _padding = _padding == const EdgeInsets.all(8.0)
          ? const EdgeInsets.all(32.0)
          : const EdgeInsets.all(8.0);

      // Toggle AnimatedRotation
      _rotation = _rotation == 0.0 ? 0.5 : 0.0;

      // Toggle AnimatedScale
      _scale = _scale == 1.0 ? 1.5 : 1.0;

      // Toggle AnimatedSwitcher
      _showFirst = !_showFirst;
    });
  }

  void _resetAnimations() {
    setState(() {
      _containerWidth = 100;
      _containerHeight = 100;
      _containerColor = Colors.blue;
      _borderRadius = 8;
      _opacity = 1.0;
      _positionedTop = 20;
      _positionedLeft = 20;
      _alignment = Alignment.topLeft;
      _padding = const EdgeInsets.all(8.0);
      _rotation = 0.0;
      _scale = 1.0;
      _showFirst = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
        backgroundColor: Colors.orange,
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
            colors: [Colors.orange.withOpacity(0.1), Colors.white],
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
                    onPressed: _toggleAnimations,
                    icon: const Icon(Icons.animation),
                    label: const Text('Animate'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
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
                    // AnimatedContainer
                    AnimationCard(
                      title: 'AnimatedContainer',
                      description:
                          'Automatic animation for container properties',
                      codeSnippet: '''
AnimatedContainer(
  duration: Duration(seconds: 1),
  width: _width,
  height: _height,
  decoration: BoxDecoration(
    color: _color,
    borderRadius: BorderRadius.circular(_radius),
  ),
)''',
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          width: _containerWidth,
                          height: _containerHeight,
                          decoration: BoxDecoration(
                            color: _containerColor,
                            borderRadius: BorderRadius.circular(_borderRadius),
                          ),
                          child: const Icon(
                            Icons.widgets,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // AnimatedOpacity
                    AnimationCard(
                      title: 'AnimatedOpacity',
                      description: 'Smooth fade in/out transitions',
                      codeSnippet: '''
AnimatedOpacity(
  duration: Duration(milliseconds: 800),
  opacity: _opacity,
  child: Container(...),
)''',
                      child: Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 800),
                          opacity: _opacity,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.visibility,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // AnimatedPositioned
                    AnimationCard(
                      title: 'AnimatedPositioned',
                      description: 'Smooth position changes in Stack',
                      codeSnippet: '''
Stack(
  children: [
    AnimatedPositioned(
      duration: Duration(seconds: 1),
      top: _top,
      left: _left,
      child: Container(...),
    ),
  ],
)''',
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              duration: const Duration(seconds: 1),
                              curve: Curves.elasticOut,
                              top: _positionedTop,
                              left: _positionedLeft,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // AnimatedAlign
                    AnimationCard(
                      title: 'AnimatedAlign',
                      description: 'Smooth alignment transitions',
                      codeSnippet: '''
AnimatedAlign(
  duration: Duration(seconds: 1),
  alignment: _alignment,
  child: Container(...),
)''',
                      child: AnimatedAlign(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        alignment: _alignment,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.my_location,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // AnimatedPadding
                    AnimationCard(
                      title: 'AnimatedPadding',
                      description: 'Animated padding changes',
                      codeSnippet: '''
AnimatedPadding(
  duration: Duration(milliseconds: 600),
  padding: _padding,
  child: Container(...),
)''',
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: AnimatedPadding(
                          duration: const Duration(milliseconds: 600),
                          padding: _padding,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.space_bar,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // AnimatedRotation
                    AnimationCard(
                      title: 'AnimatedRotation',
                      description: 'Smooth rotation animations',
                      codeSnippet: '''
AnimatedRotation(
  duration: Duration(seconds: 1),
  turns: _rotation, // 0.5 = 180°, 1.0 = 360°
  child: Container(...),
)''',
                      child: Center(
                        child: AnimatedRotation(
                          duration: const Duration(seconds: 1),
                          turns: _rotation,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // AnimatedScale
                    AnimationCard(
                      title: 'AnimatedScale',
                      description: 'Smooth scaling transitions',
                      codeSnippet: '''
AnimatedScale(
  duration: Duration(milliseconds: 800),
  scale: _scale,
  child: Container(...),
)''',
                      child: Center(
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 800),
                          scale: _scale,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.zoom_in,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // AnimatedSwitcher
                    AnimationCard(
                      title: 'AnimatedSwitcher',
                      description:
                          'Smooth transitions between different widgets',
                      codeSnippet: '''
AnimatedSwitcher(
  duration: Duration(milliseconds: 500),
  child: _showFirst 
    ? Container(key: ValueKey(1), ...)
    : Container(key: ValueKey(2), ...),
)''',
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _showFirst
                              ? Container(
                                  key: const ValueKey(1),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                )
                              : Container(
                                  key: const ValueKey(2),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.square,
                                    color: Colors.white,
                                    size: 50,
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
