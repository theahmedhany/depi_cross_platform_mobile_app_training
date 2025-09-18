import 'package:flutter/material.dart';

import '../models/animation_example.dart';
import '../screens/animate_do_screen.dart';
import '../screens/animation_builder_screen.dart';
import '../screens/animation_controller_screen.dart';
import '../screens/implicit_animations_screen.dart';
import '../screens/tween_animation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AnimationExample> animationExamples = [
      AnimationExample(
        title: 'Tween Animations',
        description: 'Basic tween animations with different curves',
        icon: Icons.trending_up,
        color: Colors.blue,
        builder: (context) => const TweenAnimationScreen(),
      ),
      AnimationExample(
        title: 'Animation Builder',
        description: 'Custom animations using AnimatedBuilder',
        icon: Icons.build,
        color: Colors.green,
        builder: (context) => const AnimationBuilderScreen(),
      ),
      AnimationExample(
        title: 'Animation Controllers',
        description: 'Advanced control with AnimationController',
        icon: Icons.control_camera,
        color: Colors.purple,
        builder: (context) => const AnimationControllerScreen(),
      ),
      AnimationExample(
        title: 'Implicit Animations',
        description: 'AnimatedContainer, AnimatedOpacity, etc.',
        icon: Icons.auto_awesome,
        color: Colors.orange,
        builder: (context) => const ImplicitAnimationsScreen(),
      ),
      AnimationExample(
        title: 'Animate Do Package',
        description: 'Pre-built animations with animate_do',
        icon: Icons.animation,
        color: Colors.red,
        builder: (context) => const AnimateDoScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animations'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore Different Animation Types',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Tap on any card to see animation examples',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: animationExamples.length,
                  itemBuilder: (context, index) {
                    final example = animationExamples[index];
                    return _buildAnimationCard(context, example);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationCard(BuildContext context, AnimationExample example) {
    return Card(
      elevation: 8,
      shadowColor: example.color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: example.builder));
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                example.color.withOpacity(0.1),
                example.color.withOpacity(0.05),
              ],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: example.color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(example.icon, size: 32, color: example.color),
              ),
              const SizedBox(height: 16),
              Text(
                example.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                example.description,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
