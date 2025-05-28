// widgets/book_slider_widget.dart
import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_card_widget.dart';

class BookSlider extends StatelessWidget {
  final List<Book> books;

  const BookSlider({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookCard(
            book: books[index],
          );
        },
      ),
    );
  }
}