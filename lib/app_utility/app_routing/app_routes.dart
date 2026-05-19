

import 'package:flutter/cupertino.dart';
import 'package:quiz_app/user_interface/add_question/add_question_page.dart';
import 'package:quiz_app/user_interface/app_pages/dashboard_page.dart';
import 'package:quiz_app/user_interface/app_pages/home_page.dart';
import 'package:quiz_app/user_interface/app_pages/profile_page.dart';

class AppRoutes {

  static String dashboard_page = "/";
  static String home_page = "home";
  static String add_page = "add";
  static String profile_page = "profile";

  static Map<String, WidgetBuilder> allRoutes = {
    dashboard_page : (context)=> DashboardPage(),
    home_page : (context)=> HomePage(),
    add_page : (context)=> AddQuestionPage(),
    profile_page : (context)=> ProfilePage()
  };
}