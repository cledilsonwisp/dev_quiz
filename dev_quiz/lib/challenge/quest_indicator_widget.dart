import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestIndicatorWidget extends StatelessWidget {
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
              Text("Questão 04",style: AppTextStyles.body15,),
              Text("De 10",style: AppTextStyles.body15,),
            ],
          ),
          SizedBox(height: 16,),
          ProgressIndicatorWidget(
            linearProgressBar: 0.7,
          )
        ],
      ),
    );
  }
}
