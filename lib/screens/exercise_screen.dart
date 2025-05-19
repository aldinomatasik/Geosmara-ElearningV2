import 'package:flutter/material.dart';
import '../models/book.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;
  final String chapterTitle;

  const ExerciseScreen({
    Key? key,
    required this.exercise,
    required this.chapterTitle,
  }) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  // Track selected answers
  Map<String, String?> selectedAnswers = {};
  bool isSubmitted = false;
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    // Initialize selected answers
    for (var question in widget.exercise.questions) {
      selectedAnswers[question.id] = null;
    }
  }

  void _submitAnswers() {
    // Count correct answers
    correctAnswers = 0;
    for (var question in widget.exercise.questions) {
      if (selectedAnswers[question.id] == question.correctOptionId) {
        correctAnswers++;
      }
    }

    setState(() {
      isSubmitted = true;
    });

    // Show result dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Results'),
        content: Text(
          'You got $correctAnswers out of ${widget.exercise.questions.length} questions correct!',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isSubmitted = false;
                for (var question in widget.exercise.questions) {
                  selectedAnswers[question.id] = null;
                }
              });
              Navigator.of(context).pop();
            },
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.exercise.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Exercise header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            color: Colors.grey[900],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chapter: ${widget.chapterTitle}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.exercise.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[800]),

          // Questions
          Expanded(
            child: ListView.builder(
              itemCount: widget.exercise.questions.length,
              itemBuilder: (context, index) {
                final question = widget.exercise.questions[index];
                return _buildQuestionWidget(question, index);
              },
            ),
          ),

          // Submit button
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isSubmitted ? null : _submitAnswers,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
                foregroundColor: Colors.black87,
                padding: EdgeInsets.symmetric(vertical: 12),
                disabledBackgroundColor: Colors.grey,
              ),
              child: Text(
                isSubmitted ? 'Submitted' : 'Submit Answers',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionWidget(Question question, int index) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question number and text
          Text(
            'Question ${index + 1}',
            style: TextStyle(
              color: Colors.tealAccent,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          Text(
            question.question,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),

          // Options
          ...question.options.map((option) {
            final isSelected = selectedAnswers[question.id] == option.id;
            final isCorrect = isSubmitted && option.id == question.correctOptionId;
            final isWrong = isSubmitted && isSelected && !isCorrect;

            return RadioListTile<String>(
              title: Text(
                option.text,
                style: TextStyle(
                  fontSize: 14,
                  color: isCorrect
                      ? Colors.greenAccent
                      : isWrong
                      ? Colors.redAccent
                      : Colors.white,
                  fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              value: option.id,
              groupValue: selectedAnswers[question.id],
              onChanged: isSubmitted
                  ? null
                  : (value) {
                setState(() {
                  selectedAnswers[question.id] = value;
                });
              },
              activeColor: Colors.tealAccent,
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              selected: isSelected,
              selectedTileColor: Colors.tealAccent.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }).toList(),

          // Explanation (shown after submission)
          if (isSubmitted)
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selectedAnswers[question.id] == question.correctOptionId
                      ? Colors.greenAccent
                      : Colors.redAccent,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedAnswers[question.id] == question.correctOptionId
                        ? 'Correct!'
                        : 'Incorrect',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedAnswers[question.id] == question.correctOptionId
                          ? Colors.greenAccent
                          : Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'The correct answer is: ${question.options.firstWhere((opt) => opt.id == question.correctOptionId).text}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}