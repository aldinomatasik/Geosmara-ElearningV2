// widgets/wallet_balance_widget.dart
import 'package:flutter/material.dart';
import '../services/wallet_service.dart';
import 'dialog/top_up.dart';
import 'dialog/transaction_history.dart';

class WalletBalanceWidget extends StatefulWidget {
  final Function(double)? onBalanceUpdated;

  const WalletBalanceWidget({
    Key? key,
    this.onBalanceUpdated,
  }) : super(key: key);

  @override
  _WalletBalanceWidgetState createState() => _WalletBalanceWidgetState();
}

class _WalletBalanceWidgetState extends State<WalletBalanceWidget> {
  final WalletService _walletService = WalletService();
  double geosBalance = 0.0;
  bool isLoadingBalance = true;
  String walletAddress = "";

  @override
  void initState() {
    super.initState();
    _loadWalletBalance();
  }

  Future<void> _loadWalletBalance() async {
    setState(() {
      isLoadingBalance = true;
    });

    try {
      final balance = await _walletService.getGeosBalance();
      final address = await _walletService.getWalletAddress();

      setState(() {
        geosBalance = balance;
        walletAddress = address;
        isLoadingBalance = false;
      });

      // Notify parent widget about balance update
      widget.onBalanceUpdated?.call(balance);
    } catch (e) {
      setState(() {
        isLoadingBalance = false;
        geosBalance = 0.0;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load wallet balance')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: _buildBalanceCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBalanceHeader(),
          SizedBox(height: 16),
          if (walletAddress.isNotEmpty) ...[
            Divider(color: Colors.grey[700]),
            SizedBox(height: 12),
            _buildWalletInfo(),
          ],
          SizedBox(height: 12),
          _buildActionButtons(),
        ],
      ),
    );
  }

  BoxDecoration _buildBalanceCardDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.tealAccent.withOpacity(0.1),
          Colors.teal.withOpacity(0.05),
        ],
      ),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Colors.tealAccent.withOpacity(0.3),
        width: 1,
      ),
    );
  }

  Widget _buildBalanceHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your GEOS Balance',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            _buildBalanceDisplay(),
          ],
        ),
        IconButton(
          onPressed: _loadWalletBalance,
          icon: Icon(Icons.refresh, color: Colors.tealAccent),
          tooltip: 'Refresh Balance',
        ),
      ],
    );
  }

  Widget _buildBalanceDisplay() {
    if (isLoadingBalance) {
      return Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Loading...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        _buildGeosIcon(),
        SizedBox(width: 12),
        Text(
          '${geosBalance.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.tealAccent,
          ),
        ),
        SizedBox(width: 8),
        Text(
          'GEOS',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildGeosIcon() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.tealAccent,
      ),
      child: Center(
        child: Text(
          'G',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildWalletInfo() {
    return Row(
      children: [
        Icon(Icons.account_balance_wallet, size: 16, color: Colors.grey[400]),
        SizedBox(width: 8),
        Text(
          'Wallet: $walletAddress',
          style: TextStyle(fontSize: 12, color: Colors.grey[400]),
        ),
        Spacer(),
        Text(
          'Solana Devnet',
          style: TextStyle(
            fontSize: 11,
            color: Colors.orange[300],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showTopUpDialog(),
            icon: Icon(Icons.add, size: 18),
            label: Text('Top Up'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.tealAccent,
              foregroundColor: Colors.black87,
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showTransactionHistory(),
            icon: Icon(Icons.history, size: 18),
            label: Text('History'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.tealAccent,
              side: BorderSide(color: Colors.tealAccent),
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  void _showTopUpDialog() {
    showDialog(
      context: context,
      builder: (context) => TopUpDialog(
        mintAddress: _walletService.geosMintAddress,
      ),
    );
  }

  void _showTransactionHistory() {
    showDialog(
      context: context,
      builder: (context) => TransactionHistoryDialog(),
    );
  }
}