import 'package:devquiz/challenge/quest_indicator_widget.dart';
import 'package:devquiz/challenge/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60),
      child: SafeArea(
        top: true,
        child: QuestIndicatorWidget()),),
        body: QuizWidget(title: "O que o Flutter faz em sua totalidade?"),
    );
  }
}