import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/widgets/appbar/appbar.dart';
import 'package:devquiz/widgets/levelbutton/level_button_widget.dart';
import 'package:devquiz/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
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
                  children: [
                    QuizCardWidget(title: "Gerenciamento de Estado",imgUlr: AppImages.data, number: "3 de 10",linearProgressBar: 0.3,
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChallengePage()));
                    },),
                    QuizCardWidget(title: "Construindo Interfaces",imgUlr: AppImages.laptop,number: "10 de 10",linearProgressBar: 10.0,),
                    QuizCardWidget(title: "Integração Nativa",imgUlr: AppImages.hierarchy, number: "9 de 10",linearProgressBar: 0.9),
                    QuizCardWidget(title: "Widgets do Flutter", imgUlr: AppImages.blocks,number: "5 de 10",linearProgressBar: 0.5),

                  ],
                ),
              ),
            )
          ],
        ));
  }
}
