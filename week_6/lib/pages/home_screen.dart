import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomCard(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.flutter_dash,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Welcome to Home Screen',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This app demonstrates custom widgets, form validation, orientation handling, and asset management.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (orientation == Orientation.portrait)
                  _buildPortraitFeatures(context)
                else
                  _buildLandscapeFeatures(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPortraitFeatures(BuildContext context) {
    return Column(
      children: [
        _buildFeatureCard(
          context,
          'Custom Widgets',
          'Reusable components for better code organization',
          Icons.widgets,
          Colors.blue,
        ),
        const SizedBox(height: 12),
        _buildFeatureCard(
          context,
          'Form Validation',
          'Input validation with custom error messages',
          Icons.verified_user,
          Colors.green,
        ),
        const SizedBox(height: 12),
        _buildFeatureCard(
          context,
          'Orientation Support',
          'Responsive layout for portrait and landscape',
          Icons.screen_rotation,
          Colors.orange,
        ),
        const SizedBox(height: 12),
        _buildFeatureCard(
          context,
          'Asset Management',
          'Images and resources properly configured',
          Icons.image,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildLandscapeFeatures(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildFeatureCard(
                context,
                'Custom Widgets',
                'Reusable components',
                Icons.widgets,
                Colors.blue,
              ),
              const SizedBox(height: 12),
              _buildFeatureCard(
                context,
                'Form Validation',
                'Input validation',
                Icons.verified_user,
                Colors.green,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            children: [
              _buildFeatureCard(
                context,
                'Orientation Support',
                'Responsive layout',
                Icons.screen_rotation,
                Colors.orange,
              ),
              const SizedBox(height: 12),
              _buildFeatureCard(
                context,
                'Asset Management',
                'Images and resources',
                Icons.image,
                Colors.purple,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return CustomCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
