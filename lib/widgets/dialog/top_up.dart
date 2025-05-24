// widgets/top_up_dialog.dart
import 'package:flutter/material.dart';

class TopUpDialog extends StatelessWidget {
  final String mintAddress;

  const TopUpDialog({
    Key? key,
    required this.mintAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        'Top Up GEOS',
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Send GEOS tokens to your wallet address:',
            style: TextStyle(color: Colors.grey[300]),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Mint Address:',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  mintAddress,
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 11,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ],
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
