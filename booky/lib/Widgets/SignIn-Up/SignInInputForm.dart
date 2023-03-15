import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Validations/ProfileInputsValidations.dart';
import '../frquent_used_widgets/CustomTextFormFormat.dart';

class SignInInputForm extends StatefulWidget {
  SignInInputForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.screenWidth,
    required this.screenHeight,
  })  : _key = formKey,
        super(key: key);

  final GlobalKey<FormState> _key;
  final double screenWidth;
  final double screenHeight;

  @override
  State<SignInInputForm> createState() => _SignInInputFormState();
}

class _SignInInputFormState extends State<SignInInputForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._key,
      child: Column(
        children: [
          CustomTextFormField(
            screenWidth: widget.screenWidth,
            screenHeight: widget.screenHeight,
            textInputType: TextInputType.phone,
            label: 'رقم الجوال',
            validation: SignUpInInputsValidations.phoneNuValidations,
            initialValue: '',
            icon: Icons.phone_android, inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 11,
          ),
          CustomTextFormField(
            screenWidth: widget.screenWidth,
            screenHeight: widget.screenHeight,
            textInputType: TextInputType.visiblePassword,
            label: 'كلمة المرور',
            obscureText: true,
            validation: SignUpInInputsValidations.passwordValidations,
            initialValue: '',
            enableCopyAndPaste: false,
            icon: Icons.password,
            inputFormatters: [],
          ),
        ],
      ),
    );
  }
}

