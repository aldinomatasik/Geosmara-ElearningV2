import 'exercise.dart';
import 'subchapter.dart';

class Chapter {
  final String id;
  final String title;
  final List<SubChapter> subChapters;
  final Exercise? exercise;

  Chapter({
    required this.id,
    required this.title,
    required this.subChapters,
    this.exercise,
  });
}