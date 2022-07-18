import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int questionNumber;
  final String questionText;
  final List<String> questionAnswers;

  const Question({
    required this.questionNumber,
    required this.questionText,
    required this.questionAnswers,
  });

  @override
  List<Object> get props => [questionNumber, questionText, questionAnswers];
}

class QuestionsModel {
  static List<Question> questions = const [
    Question(
      questionNumber: 1,
      questionText:
          'Do you typically fly for business, personal reasons, or some other reason?',
      questionAnswers: [
        'Business',
        'Personal',
        'Others',
      ],
    ),
    Question(
      questionNumber: 2,
      questionText: 'How many hours is your average flight?',
      questionAnswers: [
        'Less than 2 hours',
        'Between 2 and 5 hours',
        'Greater than 5 hours',
      ],
    ),
    Question(
      questionNumber: 3,
      questionText: 'Which airline do you prefer the most?',
      questionAnswers: [
        'US Airlines',
        'United Airlines',
        'Etihad Airlines',
      ],
    ),
  ];
}
