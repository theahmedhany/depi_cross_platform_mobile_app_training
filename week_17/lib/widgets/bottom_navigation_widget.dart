import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home_outlined, color: Colors.grey[400]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bar_chart_outlined, color: Colors.grey[400]),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.credit_card, color: Color(0xFFFF8585)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.grey[400]),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
