// providers/expanded_chapter_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expandedChaptersProvider = StateProvider.family<Map<String, bool>, String>((ref, bookId) {
  return <String, bool>{};
});
