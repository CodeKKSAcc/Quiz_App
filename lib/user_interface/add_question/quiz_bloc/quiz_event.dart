

import 'package:quiz_app/data/app_models/quiz_model.dart';

abstract class QuizEvent {}

class AddQuizEvent extends QuizEvent{
  QuizModel addQuiz;
  AddQuizEvent({required this.addQuiz});
}

class FetchQuizEvent extends QuizEvent{}