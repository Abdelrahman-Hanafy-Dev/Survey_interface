import 'package:equatable/equatable.dart';
import 'package:survey_interface/models/question_model.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class AskingQuestions extends QuestionsState {
  final Question question;

  const AskingQuestions({required this.question});

  @override
  List<Object> get props => [question];
}

class FinishedQuestions extends QuestionsState {}
