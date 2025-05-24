// widgets/book_card_widget.dart
import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_detail_screen.dart';
import '../services/wallet_service.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final double userBalance;

  const BookCard({
    Key? key,
    required this.book,
    required this.userBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletService = WalletService();
    final canAfford = walletService.canAfford(book.price, userBalance);

    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBookCover(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: _buildBookInfo(context, canAfford),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCover() {
    return Container(
      width: 120,
      height: double.infinity,
      child: Image.network(
        book.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBookInfo(BuildContext context, bool canAfford) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBookTitle(),
        SizedBox(height: 4),
        _buildAuthorName(),
        SizedBox(height: 8),
        _buildRating(),
        Spacer(),
        _buildPriceAndButton(context, canAfford),
      ],
    );
  }

  Widget _buildBookTitle() {
    return Text(
      book.title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAuthorName() {
    return Text(
      'by ${book.author}',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 18),
        SizedBox(width: 4),
        Text(
          book.rating.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndButton(BuildContext context, bool canAfford) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPriceColumn(canAfford),
        _buildViewButton(context, canAfford),
      ],
    );
  }

  Widget _buildPriceColumn(bool canAfford) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${book.price.toStringAsFixed(2)} GEOS',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.tealAccent,
          ),
        ),
        if (!canAfford)
          Text(
            'Insufficient balance',
            style: TextStyle(
              fontSize: 10,
              color: Colors.red[300],
            ),
          ),
      ],
    );
  }

  Widget _buildViewButton(BuildContext context, bool canAfford) {
    return ElevatedButton(
      onPressed: canAfford ? () => _navigateToBookDetail(context) : null,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12),
        minimumSize: Size(0, 32),
        backgroundColor: canAfford ? Colors.tealAccent : Colors.grey,
        foregroundColor: Colors.black87,
      ),
      child: Text('View'),
    );
  }

  void _navigateToBookDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailScreen(book: book),
      ),
    );
  }
}
