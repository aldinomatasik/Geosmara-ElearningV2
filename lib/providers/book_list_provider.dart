// providers/book_list_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';
import '../services/api_service.dart';

class RecommendedBooksNotifier extends StateNotifier<AsyncValue<List<Book>>> {
  RecommendedBooksNotifier() : super(const AsyncValue.loading()) {
    fetchRecommendedBooks();
  }

  Future<void> fetchRecommendedBooks() async {
    state = const AsyncValue.loading();
    try {
      final books = await ApiService.getRecommendedBooks();
      state = AsyncValue.data(books);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final recommendedBooksProvider = StateNotifierProvider<RecommendedBooksNotifier, AsyncValue<List<Book>>>(
      (ref) => RecommendedBooksNotifier(),
);

// Opsional: jika kamu masih ingin best sellers dummy
final bestSellersProvider = FutureProvider<List<Book>>((ref) async {
  return ApiService.getRecommendedBooks(); // atau getBestSellers()
});
