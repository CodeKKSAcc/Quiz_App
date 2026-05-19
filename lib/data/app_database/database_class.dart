import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/data/app_models/quiz_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClass {
  DatabaseClass._();

  static DatabaseClass onlyInstance() {
    return DatabaseClass._();
  }

  Database? myDb;

  String dbName = "quizDb.db";

  String quiz_table = "quiz_table";

  static String column_quiz_id = "q_id";
  static String column_question = "question";
  static String column_answer_option = "answer_option";
  static String column_option1 = "option_one";
  static String column_option2 = "option_two";
  static String column_option3 = "option_three";
  static String column_option4 = "option_four";

  Future<Database> initializeDb() async {
    myDb = myDb ?? await openDb();
    return myDb!;
  }

  Future<Database> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    String path = join(appDir.path, dbName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (database, version) {
        database.execute(
          "create table $quiz_table("
          "$column_quiz_id integer primary key autoincrement,"
          "$column_question text,"
          "$column_answer_option integer,"
          "$column_option1 text,"
          "$column_option2 text,"
          "$column_option3 text,"
          "$column_option4 text)",
        );
      },
    );
  }

  Future<bool> addQuestion({required QuizModel myModel}) async{

    Database dbReference = await initializeDb();

    int rowsEff = await dbReference.insert(quiz_table, myModel.toQuizMap());
    return rowsEff > 0;
  }

  Future<List<QuizModel>> fetchQuestion() async{

    Database dbReference = await initializeDb();

    List<Map<String, dynamic>> allMap = await dbReference.query(quiz_table);

    List<QuizModel> allModel = [];

    for(Map<String, dynamic> myMap in allMap){
      allModel.add(QuizModel.toQuizModel(myMap));
    }

    return allModel;

  }
}
