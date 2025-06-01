// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // TAMBAHKAN IMPORT INI
import '../providers/book_list_provider.dart';
import '../providers/book_provider.dart';
import '../widgets/book_slider_widget.dart';
import '../widgets/greeting_section_widget.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the recommended books provider
    final recommendedBooksState = ref.watch(recommendedBooksProvider);

    // Watch the best sellers provider
    final bestSellersState = ref.watch(bestSellersProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingSection(),
              SizedBox(height: 24),
              _buildSectionTitle('Recommended for you'),
              recommendedBooksState.when(
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(child: Text('Error loading books')),
                data: (books) {
                  if (books.isEmpty) {
                    return Center(child: Text('No books available'));
                  }
                  return BookSlider(books: books);
                },
              ),
              SizedBox(height: 24),
              _buildSectionTitle('Best Sellers'),
              bestSellersState.when(
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(child: Text('Error loading books')),
                data: (books) {
                  if (books.isEmpty) {
                    return Center(child: Text('No books available'));
                  }
                  return BookSlider(books: books);
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
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