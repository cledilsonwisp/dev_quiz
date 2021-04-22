import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/model/user_model.dart';
import 'package:devquiz/widgets/scorecard/score_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart' as Transparent;

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user})
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
                                    text: user.name,
                                    style: AppTextStyles.titleBold),
                                TextSpan(
                                    text: "!",
                                    style: AppTextStyles.titleBold),
                              ]),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: AppColors.purple,width: 2 )),
                            shape: BoxShape.circle
                          ),
                          child: ClipOval(child: FadeInImage.memoryNetwork(placeholder: Transparent.kTransparentImage, image:user.photo, fit: BoxFit.cover,)),
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
