class SignUpInInputsValidations{

  static String? emailValidations(String? value) {
    if (!value!.contains('@')) {
      return 'Please enter a valid e-mail format';
    }else if(value!='user.email'){
      return 'Wrong e-mail';
    }else{
      return null;
    }
  }

  static String? phoneNuValidations(String? value) {
    if (!value!.startsWith('010')&&!value.startsWith('011')&&!value.startsWith('012')) {
      return 'برجاء ادخال رقم جوال صحيح';
    }else if(value.length!=11){
      return 'يجب ألا يقل رقم الجوال عن 11 رقم';
    }else{
      return null;
    }
  }

  static String? passwordValidations(String? value) {
    if (value!.length<8) {
      return 'يجب ألا تقل أحرف كلمة المرور عن ثمانية أحرف';
    }else{
      return null;
    }
  }
}
