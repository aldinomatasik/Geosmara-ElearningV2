import 'content.dart';
import 'exercise.dart';

class Chapter {
  final String id;
  final String title;
  final List<Content> contents;
  final Exercise? exercise; // Adding exercise to each chapter

  Chapter({
    required this.id,
    required this.title,
    required this.contents,
    this.exercise,
  });
}
