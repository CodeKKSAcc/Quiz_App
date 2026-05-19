


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/data/app_database/database_class.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_event.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState>{

  DatabaseClass myDb;

  QuizBloc({required this.myDb}) : super(InitialQuizState()){

    on<AddQuizEvent>((event, emit) async{

      emit(LoadingQuizState());

      bool isAdded = await myDb.addQuestion(myModel: event.addQuiz);
      if(isAdded){
       emit(LoadedQuizState(allQuiz: await myDb.fetchQuestion()));
      }
      else{
        emit(ErrorQuizState(errorMsg: "Error: Quiz didn't added"));
      }
    });

    on<FetchQuizEvent>((event, emit) async{

      emit(LoadingQuizState());

      emit(LoadedQuizState(allQuiz: await myDb.fetchQuestion()));

    });
  }
}