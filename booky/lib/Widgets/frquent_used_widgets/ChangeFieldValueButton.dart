import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constant/colors.dart';
import 'CustText.dart';

class ChangeFieldValueButton extends StatelessWidget {
  const ChangeFieldValueButton({
    Key? key,
    required this.screenWidth,
    required this.labelToBeChanged, required this.screenHeight, required this.onPressed,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String labelToBeChanged;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: MaterialButton(
        onPressed:onPressed,
        padding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child:CustText(
                text: 'Change',
                fontSize: screenWidth / 36,
                color: textFormFieldChangeTextColor,
                decoration: TextDecoration.underline,
                fontType: GoogleFonts.dmSans,
                fontWeight: FontWeight.w500,
              ),
      ),
    );
  }
}
