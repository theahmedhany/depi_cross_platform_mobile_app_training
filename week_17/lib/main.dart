import 'package:flutter/material.dart';

import 'widgets/analytics_toggle_widget.dart';
import 'widgets/bottom_navigation_widget.dart';
import 'widgets/credit_card_widget.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/digital_wallet_balance_widget.dart';
import 'widgets/info_card_widget.dart';
import 'widgets/scan_card_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF5F5F8),
      ),
      home: const WalletScreen(),
    );
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            const CustomAppBar(title: 'Wallet'),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Credit Card
                    const CreditCardWidget(),

                    const SizedBox(height: 24),

                    // Income/Expense and Balance Row
                    const Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              // Income Card
                              InfoCardWidget(
                                title: 'Income',
                                amount: '\$ 5,455.21',
                                icon: Icons.arrow_downward,
                                gradientColors: [
                                  Color(0xFF9B8CD8),
                                  Color(0xFF8B7BC8),
                                ],
                              ),
                              SizedBox(height: 12),
                              // Expense Card
                              InfoCardWidget(
                                title: 'Expense',
                                amount: '\$ 8,002.55',
                                icon: Icons.arrow_upward,
                                gradientColors: [
                                  Color(0xFFFF9A9A),
                                  Color(0xFFFF8585),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        // Digital Wallet Balance
                        Expanded(child: DigitalWalletBalanceWidget()),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Analytics Section
                    const Text(
                      'Analytics',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1D3B),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Toggle Buttons
                    const AnalyticsToggleWidget(),

                    const SizedBox(height: 24),

                    // Scan Card Button
                    const ScanCardButton(),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar
            const BottomNavigationWidget(),
          ],
        ),
      ),
    );
  }
}
