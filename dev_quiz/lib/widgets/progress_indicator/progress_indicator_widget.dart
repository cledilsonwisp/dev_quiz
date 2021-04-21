import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double? linearProgressBar;

  const ProgressIndicatorWidget({Key? key, this.linearProgressBar}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  LinearProgressIndicator(
                        value: linearProgressBar,
                        backgroundColor: AppColors.chartSecondary,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                      );
  }
}