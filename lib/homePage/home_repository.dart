import 'dart:convert';

import 'package:devquiz/model/quiz_model.dart';
import 'package:devquiz/model/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser()async{
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  } 
  Future<List<Model>> getQuizzes()async{
    final response = await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => Model.fromMap(e)).toList();
    return quizzes;

  } 
}