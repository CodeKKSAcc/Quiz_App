import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app_utility/app_routing/app_routes.dart';
import 'package:quiz_app/data/app_database/database_class.dart';
import 'package:quiz_app/user_interface/add_question/quiz_bloc/quiz_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context)=> QuizBloc(myDb: DatabaseClass.onlyInstance()), child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.dashboard_page,
      routes: AppRoutes.allRoutes,
    );
  }
}

