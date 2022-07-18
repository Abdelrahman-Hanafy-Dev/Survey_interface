import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_interface/blocs/survey_bloc/survey_bloc_events.dart';
import 'package:survey_interface/blocs/survey_bloc/survey_bloc_states.dart';
import 'package:survey_interface/models/question_model.dart';

class QuestionBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionBloc()
      : super(AskingQuestions(question: QuestionsModel.questions[0])) {
    on<QuestionAnswered>((event, emit) {
      if (state is AskingQuestions) {
        final state = this.state as AskingQuestions;
        final question = state.question;
        if (question.questionNumber == QuestionsModel.questions.length) {
          emit(FinishedQuestions());
        } else {
          emit(AskingQuestions(
              question: QuestionsModel.questions[question.questionNumber]));
        }
      }
    });
  }
}
