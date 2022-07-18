import 'package:flutter/material.dart';
import 'package:survey_interface/routes_transitions.dart';

import 'routes/routes.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String surveyPage = '/survey';
  static const String thanksPage = '/thanks';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return FadePageRoute(
          navigateTo: const HomePage(),
        );

      case surveyPage:
        return FadePageRoute(
          navigateTo: const SurveyPage(),
        );

      case thanksPage:
        return FadePageRoute(
          navigateTo: const ThanksPage(),
        );

      default:
        throw const FormatException('Route not defined.');
    }
  }
}
