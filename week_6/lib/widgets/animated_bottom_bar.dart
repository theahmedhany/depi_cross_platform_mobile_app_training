import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomAnimatedBottomBar extends StatelessWidget {
  final NotchBottomBarController controller;
  final Function(int) onTap;

  const CustomAnimatedBottomBar({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: controller,
      onTap: onTap,
      kIconSize: 24.0,
      kBottomRadius: 28.0,
      color: Colors.grey[200]!,

      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(Icons.home_outlined, color: Colors.blueGrey),
          activeItem: Icon(Icons.home, color: Colors.blueAccent),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.favorite_border_outlined, color: Colors.blueGrey),
          activeItem: Icon(Icons.favorite, color: Colors.deepOrangeAccent),
          itemLabel: 'Favorites',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.search, color: Colors.blueGrey),
          activeItem: Icon(Icons.search, color: Colors.purpleAccent),
          itemLabel: 'Search',
        ),
      ],
    );
  }
}
