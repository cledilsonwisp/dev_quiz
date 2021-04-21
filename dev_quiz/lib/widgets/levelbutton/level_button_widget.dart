import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/widgets/levelbutton/buttonstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;


  const LevelButtonWidget({Key? key, required this.label}) : super(key: key);


  LevelButtonStyle get butonStyle => levelButtonStyles[label]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical:6),
      decoration: BoxDecoration(
        color: butonStyle.backgroundColor,
        border: Border.fromBorderSide(
            BorderSide(color: butonStyle.borderColor)),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Text(label,
          style: GoogleFonts.notoSans(
              color:butonStyle.textColor, fontSize: 13)),
    );
  }
}
