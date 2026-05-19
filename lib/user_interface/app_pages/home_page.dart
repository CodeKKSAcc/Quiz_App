import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/data/app_models/quiz_model.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuizModel> allData = [];

  int qNo = 0;

  int ansOption = 0;

  int score = 0;

  int answeredQuestions = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.lightBlue,
        actions: [
          OutlinedButton(onPressed: (){
            setState((){
              score = 0;
              answeredQuestions = 0;
              qNo = 0;
            });
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white
          ),
        child: Text("Reset"),)
        ],
      ),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {

          /*if (state is InitialQuizState) {
            return Center(child: Text("No Notes", style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),));
          }*/
          // When FetchQuizEvent( ) isn't done

          if (state is LoadingQuizState) {
            return Center(child: CircularProgressIndicator(color: Colors.blue));
          }

          if (state is ErrorQuizState) {
            return Center(
              child: Text(
                state.errorMsg,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            );
          }
          if (state is LoadedQuizState) {
            allData = state.allQuiz;

            return state.allQuiz.isNotEmpty
                ? StatefulBuilder(
                    builder: (context, sS) {
                      return qNo<allData.length ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 27,),
                                    Text("Score : $score / $answeredQuestions", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 27),
                                    Text("Question : ${state.allQuiz[qNo].question}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 27,),
                                    RadioListTile(
                                      title: Text(allData[qNo].option1),
                                      value: 1,
                                      groupValue: ansOption,
                                      onChanged: (answer){
                                        sS((){
                                          ansOption = answer!;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 15,),
                                    RadioListTile(
                                      title: Text(allData[qNo].option2),
                                      value: 2,
                                      groupValue: ansOption,
                                      onChanged: (answer){
                                        sS((){
                                          ansOption = answer!;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 15,),
                                    RadioListTile(
                                      title: Text(allData[qNo].option3),
                                      value: 3,
                                      groupValue: ansOption,
                                      onChanged: (answer){
                                        sS((){
                                          ansOption = answer??0;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 15,),
                                    RadioListTile(
                                      title: Text(allData[qNo].option4),
                                      value: 4,
                                      groupValue: ansOption,
                                      onChanged: (answer){
                                        sS((){
                                          ansOption = answer??0;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 120,),
                                    InkWell(
                                      onTap: qNo < allData.length? (){
                                        if(ansOption == allData[qNo].answer){
                                          sS(() {
                                            score++;
                                          });
                                        }
                                        answeredQuestions++;
                                        sS(() {
                                          qNo++;
                                        });
                                      }: null,
                                      child: Container(
                                        alignment: Alignment(0, 0),
                                        height: 63,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.circular(21)
                                        ),
                                        child: Text("Submit", style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ) : Center(child: Container(
                        padding: EdgeInsets.all(27),
                        decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 3.6)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quiz Completed...", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
                            SizedBox(height: 18,),
                            Text("Your Score: $score / $answeredQuestions", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),);
                    },
                  )
                : Center(
                    child: Text(
                      "No quiz available yet !!!",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
          }

          return Center(
            child: Text(
              "Some unknown issue",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
