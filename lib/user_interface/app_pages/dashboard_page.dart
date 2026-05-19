import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/user_interface/add_question/add_question_page.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_event.dart';
import 'package:quiz_app/user_interface/app_pages/home_page.dart';
import 'package:quiz_app/user_interface/app_pages/profile_page.dart';

import '../../app_utility/app_routing/app_routes.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(FetchQuizEvent());
  }

  List<Widget> pages = [HomePage(), AddQuestionPage(), ProfilePage()];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          if(index==1){
            Navigator.pushNamed(context, AppRoutes.add_page);
          }
          else{
            pageIndex = index;
          }
          setState(() {
          });
        },
        currentIndex: pageIndex,
        iconSize: 30,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outlined), label: "Add Quiz"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: "Profile"),
        ],
      ),
    );
  }
}