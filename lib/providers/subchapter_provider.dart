import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/subchapter.dart';
import '../services/api_service.dart';

// Notifier untuk memuat dan menyimpan state SubChapter
class SubChapterNotifier extends StateNotifier<AsyncValue<SubChapter>> {
  final String subChapterId;
  final String subChapterTitle;

  SubChapterNotifier({
    required this.subChapterId,
    required this.subChapterTitle,
  }) : super(const AsyncValue.loading()) {
    _loadSubChapter();
  }

  Future<void> _loadSubChapter() async {
    try {
      final contents = await ApiService.getSubChapterContent(subChapterId);
      state = AsyncValue.data(
        SubChapter(
          id: subChapterId,
          title: subChapterTitle,
          contents: contents,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// Provider family untuk menyediakan SubChapter berdasarkan ID dan title
final subChapterProvider = StateNotifierProvider.family<
    SubChapterNotifier,
    AsyncValue<SubChapter>,
    (String subChapterId, String subChapterTitle)>((ref, tuple) {
  final (subChapterId, subChapterTitle) = tuple;
  return SubChapterNotifier(
    subChapterId: subChapterId,
    subChapterTitle: subChapterTitle,
  );
});
