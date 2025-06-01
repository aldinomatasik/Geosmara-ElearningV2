// providers/book_detail_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';
import '../services/api_service.dart';

final bookProvider = FutureProvider.family<Book?, String>((ref, bookId) async {
  return await ApiService.getBookDetail(bookId);
});
