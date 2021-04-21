
import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class LevelButtonStyle {
  Color backgroundColor;
  Color borderColor;
  Color textColor;

  LevelButtonStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
  });
}

final Map<String, LevelButtonStyle> levelButtonStyles = {
  "Fácil": LevelButtonStyle(
      backgroundColor: AppColors.levelButtonFacil,
      borderColor: AppColors.levelButtonBorderFacil,
      textColor: AppColors.levelButtonTextFacil),
  "Médio": LevelButtonStyle(
      backgroundColor: AppColors.levelButtonMedio,
      borderColor: AppColors.levelButtonBorderMedio,
      textColor: AppColors.levelButtonTextMedio),
  "Difícil": LevelButtonStyle(
      backgroundColor: AppColors.levelButtonDificil,
      borderColor: AppColors.levelButtonBorderDificil,
      textColor: AppColors.levelButtonTextDificil),
  "Perito": LevelButtonStyle(
      backgroundColor: AppColors.levelButtonPerito,
      borderColor: AppColors.levelButtonBorderPerito,
      textColor: AppColors.levelButtonTextPerito),
};