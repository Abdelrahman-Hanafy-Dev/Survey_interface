import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_interface/blocs/survey_bloc/survey_bloc.dart';
import 'package:survey_interface/blocs/survey_bloc/survey_bloc_states.dart';
import 'package:survey_interface/components/components.dart';
import 'package:survey_interface/components/page.dart' as p;
import 'package:survey_interface/constants.dart';
import 'package:survey_interface/routes/routes.dart';

import '../models/question_model.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<QuestionBloc, QuestionsState>(
        listener: (context, state) {
          if (state is FinishedQuestions) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ThanksPage(),
              ),
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: pageBackground,
          child: SafeArea(
            child: BlocBuilder<QuestionBloc, QuestionsState>(
                builder: (context, state) {
              if (state is AskingQuestions) {
                Question question = state.question;
                Widget page = p.Page(
                  key: Key('Page ${question.questionNumber}'),
                  questionNumber: question.questionNumber,
                  questionText: question.questionText,
                  questionAnswers: question.questionAnswers,
                );

                return Stack(
                  children: [
                    const Line(),
                    const Plane(),
                    const IconButtons(),
                    Positioned.fill(
                      top: 55.0,
                      left: 45.0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: page,
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ),
        ),
      ),
    );
  }
}
