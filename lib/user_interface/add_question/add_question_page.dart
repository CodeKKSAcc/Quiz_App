import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app_utility/app_routing/app_routes.dart';
import 'package:quiz_app/data/app_models/quiz_model.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_event.dart';
import 'package:quiz_app/user_interface/ui_components/field_decorstion.dart';


class AddQuestionPage extends StatefulWidget {
  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  TextEditingController questionController = TextEditingController();

  TextEditingController option1Controller = TextEditingController();

  TextEditingController option2Controller = TextEditingController();

  TextEditingController option3Controller = TextEditingController();

  TextEditingController option4Controller = TextEditingController();

  int answer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Quiz Page"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 27),
            TextField(
              controller: questionController,
              decoration: myDecor(
                hintText: "Enter the question here...",
                labelText: "Question",
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: option1Controller,
              decoration: myDecor(
                hintText: "Enter the first option here...",
                labelText: "Option 1",
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: option2Controller,
              decoration: myDecor(
                hintText: "Enter the second option here...",
                labelText: "Option 2",
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: option3Controller,
              decoration: myDecor(
                hintText: "Enter the third option here...",
                labelText: "Option 3",
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: option4Controller,
              decoration: myDecor(
                hintText: "Enter the fourth option here...",
                labelText: "Option 4",
              ),
            ),
            SizedBox(height: 27),
            Text(
              "Chose the correct option",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        answer = 1;
                        setState(() {});
                      },
                      child: Text("Option 1"),
                    ),
                    SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: () {
                        answer = 2;
                        setState(() {});
                      },
                      child: Text("Option 2"),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        answer = 3;
                        setState(() {});
                      },
                      child: Text("Option 3"),
                    ),
                    SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: () {
                        answer = 4;
                        setState(() {});
                      },
                      child: Text("Option 4"),
                    ),
                  ],
                ),
                SizedBox(height: 45),
                InkWell(
                  onTap: () {
                    context.read<QuizBloc>().add(
                      AddQuizEvent(
                        addQuiz: QuizModel(
                          question: questionController.text,
                          answer: answer,
                          option1: option1Controller.text,
                          option2: option2Controller.text,
                          option3: option3Controller.text,
                          option4: option4Controller.text,
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment(0, 0),
                    height: 63,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Text(
                      "Add Quiz",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
