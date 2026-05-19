

import 'package:quiz_app/data/app_models/quiz_model.dart';

abstract class QuizState {}

class InitialQuizState extends QuizState{}

class LoadingQuizState extends QuizState{}

class LoadedQuizState extends QuizState{
  List<QuizModel> allQuiz;
  LoadedQuizState({required this.allQuiz});
}

class ErrorQuizState extends QuizState{
  String errorMsg;
  ErrorQuizState({required this.errorMsg});
}