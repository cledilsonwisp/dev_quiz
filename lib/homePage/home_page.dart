import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/challenge/quiz_widget.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/homePage/home_state.dart';
import 'package:devquiz/widgets/appbar/appbar.dart';
import 'package:devquiz/widgets/levelbutton/level_button_widget.dart';
import 'package:devquiz/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'home_controller.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
    void initState() {
      super.initState();
      controller.fetchData();
      controller.stateNotifier.addListener(() {
      setState(() {});
    });
    }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    if (controller.state == HomeState.sucess){
    return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.extent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: controller.quizzes!.map((e) => QuizCardWidget(
                    title: e.title,
                    imgUlr: AppImages.blocks,
                    number: "${e.questionAnswered}/${e.question.length}",
                    linearProgressBar: e.questionAnswered / e.question.length,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChallengePage(
                        question: e.question,
                      )));
                    },
                  )).toList()
                ),
              ),
            )
          ],
        ));
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator(backgroundColor: AppColors.chartSecondary,
            valueColor: AlwaysStoppedAnimation(AppColors.chartPrimary),),),
          );
        }
  }
}
