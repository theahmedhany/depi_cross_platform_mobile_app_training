import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFF6B6B), Color(0xFFFFE66D), Color(0xFF4ECDC4)]),
            ),
          ),
          Positioned(top: 100, right: 50, child: Icon(Icons.favorite, size: 120, color: Colors.white.withValues(alpha: .2))),
          Positioned(top: 200, left: 30, child: Icon(Icons.favorite, size: 80, color: Colors.white.withValues(alpha: .15))),
          Positioned(bottom: 150, right: 80, child: Icon(Icons.favorite, size: 60, color: Colors.white.withValues(alpha: .3))),
          Positioned(bottom: 300, left: 60, child: Icon(Icons.favorite, size: 40, color: Colors.white.withValues(alpha: .4))),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .2), blurRadius: 20, offset: const Offset(0, 10))],
                  ),
                  child: const Icon(Icons.favorite, size: 64, color: Colors.deepOrangeAccent),
                ),
                const SizedBox(height: 24),
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black.withValues(alpha: .3), offset: const Offset(0, 2), blurRadius: 4)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
