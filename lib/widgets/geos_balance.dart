// widgets/minimal_geos_balance.dart
import 'package:flutter/material.dart';
import '../services/wallet_service.dart';

class GeosBalance extends StatefulWidget {
  const GeosBalance({super.key});

  @override
  _GeosBalanceState createState() => _GeosBalanceState();
}

class _GeosBalanceState extends State<GeosBalance> {
  final WalletService _walletService = WalletService();
  double _geosBalance = 0.0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBalance();
  }

  Future<void> _loadBalance() async {
    try {
      final balance = await _walletService.getGeosBalance();
      setState(() {
        _geosBalance = balance;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _geosBalance = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row( // Diperbaiki: padding dihapus dari sini
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon GEOS minimal
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.tealAccent,
            ),
            child: const Center(
              child: Text(
                'G',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          _isLoading
              ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
            ),
          )
              : Text(
            _geosBalance.toStringAsFixed(2),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'GEOS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.tealAccent,
            ),
          ),
        ],
      ),
    );
  }
}
