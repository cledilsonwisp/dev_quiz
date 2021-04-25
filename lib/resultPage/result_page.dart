import 'package:devquiz/challenge/widget/next_button.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatefulWidget {
  final String title;
  final int length;
  final int result;

  ResultPage({required this.title, required this.length, required this.result});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String image = AppImages.trophy;
  String texto = "Parabéns";
  @override
  void initState() {
    if (widget.result == 0) {
      image = AppImages.error;
      texto = "poxa...";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: Image.asset(image)),
              SizedBox(
                height: 24,
              ),
              Text(
                "$texto",
                style: AppTextStyles.heading40,
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Text(
                    "Você concluiu:",
                    style: AppTextStyles.body,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.title}",
                    style: AppTextStyles.bodyBold,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Com ${widget.result} de ${widget.length} acertos",
                    style: AppTextStyles.bodyBold,
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Expanded(
                      child: NextButtonWidget.purple(
                          label: "Compartilhar", onTap: () {
                                Share.share(
                                'Acertei ${widget.result} de ${widget.length} respostas no desafio ${widget.title} do app Dev Quiz!');
                            
                          })),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: NextButtonWidget.white(
                          label: "Voltar ao inincio",
                          onTap: () {
                            Navigator.pop(context);
                          })),
                ],
              )
            ],
          )),
    );
  }
}
