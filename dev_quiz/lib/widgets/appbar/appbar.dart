import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/widgets/scorecard/score_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart' as Transparent;

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 161,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Olá, ",
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: "Gabriela ",
                                    style: AppTextStyles.titleBold),
                                TextSpan(
                                    text: "!",
                                    style: AppTextStyles.titleBold),
                              ]),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          child: ClipOval(child: FadeInImage.memoryNetwork(placeholder: Transparent.kTransparentImage, image: "https://static.wixstatic.com/media/353a77_0d35b71af72b421894c2abb3e1d1fbee~mv2.jpg", fit: BoxFit.cover,)),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 1.0),
                    child: ScoreCardWidget())
                ],
              ),
            ));
}
