// widgets/transaction_history_dialog.dart
import 'package:flutter/material.dart';
import '../../services/wallet_service.dart';

class TransactionHistoryDialog extends StatelessWidget {
  final WalletService _walletService = WalletService();

  @override
  Widget build(BuildContext context) {
    final transactions = _walletService.getTransactionHistory();

    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        'Transaction History',
        style: TextStyle(color: Colors.white),
      ),
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: transactions.map((transaction) {
            return TransactionItem(transaction: transaction);
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Close',
            style: TextStyle(color: Colors.tealAccent),
          ),
        ),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            transaction.isPositive ? Icons.add_circle : Icons.remove_circle,
            color: transaction.isPositive ? Colors.green : Colors.red,
            size: 20,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.type,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  transaction.time,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.isPositive ? '+' : ''}${transaction.amount.toStringAsFixed(2)} GEOS',
            style: TextStyle(
              color: transaction.isPositive ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}