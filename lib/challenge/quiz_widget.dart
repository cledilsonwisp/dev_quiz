import 'package:devquiz/challenge/awnsor_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 64,),
        Text(title,style: AppTextStyles.heading),
        SizedBox(height: 24,),
        AwnsorWidget(title: "Kit de desenvolvimento de interface de usuário",isRight: false,isSelected: false,),
        AwnsorWidget(title: "Possibilita a criação de aplicativos compilados nativamente",isRight: true,isSelected: true,),
        AwnsorWidget(title: "Acho que é uma marca de café do Himalaia"),
        AwnsorWidget(title: "Possibilita a criação de desktops que são muito incríveis"),
      ],
      
    );
  }
}