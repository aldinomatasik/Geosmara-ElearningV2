// services/wallet_service.dart
class WalletService {
  final String geosMintAddress = "mntPKoxsjp86DTRaf5EzsKXnzPqD1oLAFW5bfQQoLes";

  /// Fetches GEOS token balance from Solana blockchain
  Future<double> getGeosBalance() async {
    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 2));

      // In real implementation, this would:
      // 1. Connect to Solana devnet RPC
      // 2. Get token accounts for the wallet
      // 3. Filter by GEOS mint address
      // 4. Return the balance

      return 1250.75; // Mock balance
    } catch (e) {
      throw Exception('Failed to fetch GEOS balance: $e');
    }
  }

  /// Gets the current wallet address
  Future<String> getWalletAddress() async {
    try {
      // In real implementation, this would get the connected wallet address
      return "7xKX...9mP2"; // Mock truncated address
    } catch (e) {
      throw Exception('Failed to get wallet address: $e');
    }
  }

  /// Checks if user can afford a purchase
  bool canAfford(double price, double balance) {
    return balance >= price;
  }

  /// Mock transaction history
  List<Transaction> getTransactionHistory() {
    return [
      Transaction(
        type: 'Book Purchase',
        amount: -15.99,
        time: '2 hours ago',
        transactionId: 'tx_001',
      ),
      Transaction(
        type: 'Top Up',
        amount: 500.00,
        time: '1 day ago',
        transactionId: 'tx_002',
      ),
      Transaction(
        type: 'Book Purchase',
        amount: -24.50,
        time: '3 days ago',
        transactionId: 'tx_003',
      ),
    ];
  }
}

class Transaction {
  final String type;
  final double amount;
  final String time;
  final String transactionId;

  Transaction({
    required this.type,
    required this.amount,
    required this.time,
    required this.transactionId,
  });

  bool get isPositive => amount > 0;
}