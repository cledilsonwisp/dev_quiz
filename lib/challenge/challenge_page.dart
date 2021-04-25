import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/quest_indicator_widget.dart';
import 'package:devquiz/challenge/quiz_widget.dart';
import 'package:devquiz/challenge/widget/next_button.dart';
import 'package:devquiz/model/question_model.dart';
import 'package:devquiz/resultPage/result_page.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> question;
  final String title;
  ChallengePage({Key? key, required this.question, required this.title}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.question.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
  }
  void onSelected(bool value){
    if(value){
      controller.qtdAwnserRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: SafeArea(
            top: true,
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestIndicatorWidget(
                      curretPage: value,
                      lenght: widget.question.length,
                    ))),
      ),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.question
              .map((e) => QuizWidget(
                    question: e,
                    onSelected: onSelected,
                  ))
              .toList()),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (value < widget.question.length)  Expanded(
                            child: NextButtonWidget.white(
                                label: "Pular", onTap: nextPage)),
                       
                        if (value == widget.question.length)
                          Expanded(
                              child: NextButtonWidget.green(
                            label: "Confirmar",
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ResultPage(
                                title: widget.title,
                                result: controller.qtdAwnserRight,
                                length: widget.question.length,
                              )));
                            },
                          ))
                      ],
                    ))),
      ),
    );
  }
}
