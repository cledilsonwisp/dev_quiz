import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:devquiz/model/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this]!;
}
extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
         Level.medio: "medio",
         Level.dificil: "dificil",
         Level.perito: "perito"
      }[this]!;
}

class Model {
  final String title;
  final List<QuestionModel> question;
  final int questionAnswered;
  final String image;
  final Level level;

  Model(
      {required this.title,
      required this.question,
      this.questionAnswered = 0,
      required this.image,
      required this.level});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'question': question.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      title:  map['title'],
      question: List<QuestionModel>.from(
          map['question']?.map((x) => QuestionModel.fromMap(x))),
     questionAnswered: map['questionAnswered'],
     image: map['image'],
     level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) => Model.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Model(title: $title, question: $question, questionAnswered: $questionAnswered, image: $image, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Model &&
        other.title == title &&
        listEquals(other.question, question) &&
        other.questionAnswered == questionAnswered &&
        other.image == image &&
        other.level == level;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        question.hashCode ^
        questionAnswered.hashCode ^
        image.hashCode ^
        level.hashCode;
  }
}
