import 'package:devquiz/animations/itemfader.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String number;
  final String imgUlr;
  final double linearProgressBar;
  final VoidCallback? onTap;

  const QuizCardWidget({Key? key, required this.title, required this.number, required this.imgUlr, required this.linearProgressBar, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child:ItemFader(index:1,animationDuration:100, child: Image.asset(imgUlr)),
                ),
                SizedBox(height: 20,),
                Text(title,style: AppTextStyles.bodyBold,),
                 SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(number,style: AppTextStyles.body11,)),
                    Expanded(
                      flex: 2,
                      child: LinearProgressIndicator(
                        value: linearProgressBar,
                        backgroundColor: AppColors.chartSecondary,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                      ),
                    )
                  ],
                )
              ],
            ),
      ),
    );
  }
}
