import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/homePage/home_repository.dart';
import 'package:devquiz/homePage/home_state.dart';
import 'package:devquiz/model/awnser_model.dart';
import 'package:devquiz/model/question_model.dart';
import 'package:devquiz/model/quiz_model.dart';
import 'package:devquiz/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;
  UserModel? user;
  List<Model>? quizzes;

  final reposity = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await reposity.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await reposity.getQuizzes();
    state = HomeState.sucess;
  }
   void fetchData() async {
    state = HomeState.loading;
    user = await reposity.getUser();
    quizzes = await reposity.getQuizzes();
    state = HomeState.sucess;
}
}
