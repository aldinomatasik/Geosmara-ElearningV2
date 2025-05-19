import 'question.dart';

class Exercise {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });
}
