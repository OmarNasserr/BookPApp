import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constant/colors.dart';
import 'ChangeFieldValueButton.dart';
import 'CustText.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    required this.screenWidth,
    required this.screenHeight,
    required this.label,
    this.hintText = '',
    required this.validation,
    this.obscureText = false,
    this.textInputType = TextInputType.emailAddress,
    required this.initialValue,
    this.date = false,
    this.enableCopyAndPaste = true,
    this.withSuffixChangeButton = false,
    required this.icon,
    this.borderCircularRadius = 10,
    required this.inputFormatters,
    this.maxLength = 30,
    this.onPressed, this.onEditingComplete,
  });

  final double screenWidth;
  final double screenHeight;
  final String label;
  final String hintText;
  final Function(String?)? validation;
  final bool obscureText;
  final TextInputType textInputType;
  final String initialValue;
  final bool date;
  final bool enableCopyAndPaste;
  final bool withSuffixChangeButton;
  final IconData icon;
  final double borderCircularRadius;
  final List<TextInputFormatter> inputFormatters;
  final int maxLength;
  final VoidCallback? onPressed;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth / 1.14,
          // height: screenHeight / 15,
          child: TextFormField(
            onEditingComplete: onEditingComplete,
            maxLength: maxLength,
            enableInteractiveSelection: enableCopyAndPaste,
            initialValue: initialValue,
            keyboardType: textInputType,
            textAlign: TextAlign.end,
            obscureText: obscureText,
            textAlignVertical: TextAlignVertical.center,
            style: GoogleFonts.tajawal(
              textStyle: TextStyle(
                  color: textFormFieldTextColor, fontSize: screenWidth / 20),
            ),
            inputFormatters: inputFormatters,
            validator: (value) {
              var theReturn = validation!(value);
              return theReturn;
            },
            cursorColor: textFormFieldTextColor,
            decoration: InputDecoration(
              counterStyle: TextStyle(color: textFormFieldCounterColor),
              hintText: hintText,
              contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8),
              suffixIcon: SizedBox(
                  width: screenWidth / 6,
                  child: withSuffixChangeButton
                      ? ChangeFieldValueButton(
                          screenWidth: screenWidth,
                          labelToBeChanged: label,
                          screenHeight: screenHeight,
                          onPressed: onPressed??(){debugPrint("No onPressed was passes");},
                        )
                      : Icon(
                          icon,
                          color: textFormIconsColor,
                        )),
              floatingLabelAlignment: FloatingLabelAlignment.center,
              label: CustText(
                text: label,
                fontSize: screenWidth / 22,
                fontWeight: FontWeight.w500,
                color: textFormFieldLabelColor,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: textFormFieldFocusedBorderColor),
                  borderRadius: BorderRadius.circular(borderCircularRadius)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: textFormFieldBorderColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderCircularRadius)),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(borderCircularRadius),
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight / 30,
        ),
      ],
    );
  }
}
