import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/model/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnsorWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final VoidCallback onTap;
  final bool disable;

  const AwnsorWidget(
      {Key? key,
      required this.awnser,
      this.isSelected = false, required this.onTap,  this.disable = false})
      : super(key: key);

  Color get _selectedColorCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedIconColorRight =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedColorBorderCardRight =>
      awnser.isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: IgnorePointer(
        ignoring: disable,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                  awnser.title,
                  style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                )),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? _selectedIconColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(BorderSide(
                        color: isSelected
                            ? _selectedColorBorderCardRight
                            : AppColors.border)),
                  ),
                  child: isSelected
                      ? Icon(
                          _selectedIconRight,
                          size: 16,
                          color: AppColors.white,
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
