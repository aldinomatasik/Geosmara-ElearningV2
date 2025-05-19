import 'option.dart';

class Question {
  final String id;
  final String question;
  final List<Option> options;
  final String correctOptionId;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionId,
  });
}