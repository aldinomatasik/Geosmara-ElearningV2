// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../data_dummy/list_book_dummy.dart';
import '../widgets/wallet_balance_widget.dart';
import '../widgets/book_slider_widget.dart';
import '../widgets/greeting_section_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentBalance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingSection(),
              WalletBalanceWidget(
                onBalanceUpdated: _updateBalance,
              ),
              SizedBox(height: 24),
              _buildSectionTitle('Recommended for you'),
              BookSlider(
                books: getRecommendedBooks(),
                userBalance: currentBalance,
              ),
              SizedBox(height: 24),
              _buildSectionTitle('The newest books'),
              BookSlider(
                books: getNewestBooks(),
                userBalance: currentBalance,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _updateBalance(double newBalance) {
    setState(() {
      currentBalance = newBalance;
    });
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

