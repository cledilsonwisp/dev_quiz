import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/model/question_model.dart';
import 'package:devquiz/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestIndicatorWidget extends StatelessWidget {
  final int curretPage;
  final int lenght;
  QuestIndicatorWidget({required this.curretPage, required this.lenght});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: Column(
        
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.close),onPressed: (){
                Navigator.pop(context);              },),
              Text("Questão $curretPage",style: AppTextStyles.body15,),
              Text("De $lenght",style: AppTextStyles.body15,),
            ],
          ),
          SizedBox(height: 16,),
          ProgressIndicatorWidget(
            linearProgressBar: curretPage / lenght,
          )
        ],
      ),
    );
  }
}
