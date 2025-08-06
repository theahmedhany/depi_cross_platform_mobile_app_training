import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/animated_bottom_bar.dart';
import 'favorites_page.dart';
import 'home_page.dart';
import 'search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  final List<Widget> _pages = const [HomePage(), FavoritesPage(), SearchPage()];

  void _onTabTapped(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController, children: _pages),
      bottomNavigationBar: CustomAnimatedBottomBar(controller: _controller, onTap: _onTabTapped),
    );
  }
}
