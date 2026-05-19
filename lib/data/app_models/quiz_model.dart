import '../app_database/database_class.dart';

class QuizModel {
  String question;
  int answer;
  String option1, option2, option3, option4;

  QuizModel({
    required this.question,
    required this.answer,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  });

  toQuizMap() {
    return {
      DatabaseClass.column_question: question,
      DatabaseClass.column_answer_option: answer,
      DatabaseClass.column_option1: option1,
      DatabaseClass.column_option2: option2,
      DatabaseClass.column_option3: option3,
      DatabaseClass.column_option4: option4,
    };
  }

  static toQuizModel(Map<String, dynamic> myMap) {
    return QuizModel(
      question: myMap[DatabaseClass.column_question],
      answer: myMap[DatabaseClass.column_answer_option],
      option1: myMap[DatabaseClass.column_option1],
      option2: myMap[DatabaseClass.column_option2],
      option3: myMap[DatabaseClass.column_option3],
      option4: myMap[DatabaseClass.column_option4],
    );
  }
}
