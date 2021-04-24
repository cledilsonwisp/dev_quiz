import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/quest_indicator_widget.dart';
import 'package:devquiz/challenge/quiz_widget.dart';
import 'package:devquiz/challenge/widget/next_button.dart';
import 'package:devquiz/model/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> question;
  ChallengePage({Key? key, required this.question}) : super(key: key);
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
    pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
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
                    onChange: nextPage,
                  ))
              .toList()),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
          child:  ValueListenableBuilder(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 Expanded(child: NextButtonWidget.white(label: "Pular", onTap: nextPage)),
                                if(value == widget.question.length)
                                SizedBox(
                                  width: 7,
                                ),
                                if(value == widget.question.length)
                                Expanded(
                                    child: NextButtonWidget.green(
                                  label: "Confirmar",
                                  onTap: () {},
                                ))
                              ],
                            )
                  )
        ),
      ),
    );
  }
}
