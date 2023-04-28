
import 'package:flutter/material.dart';

import '../constants/global_Keys.dart';

Map<String,RegExp> regex =
{
  "EMAIL":RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
  "PHONE":RegExp(r'(^(?:[+0]9)?[0-9]{9,12}$)'),
  "USERNAME":RegExp(r"^[a-zA-Z0-9_.-]{4,20}$"),
  "PASS":RegExp(r'(^(?:[+0]9)?[0-9]{6,12}$)'),
};


// Map messages = {
//   "email":"Please Enter Valid Mail"
// };

showSnackbar( String text,{int? time=1500}){
  ScaffoldMessenger.of(MyGlobalKeys.navigatorKey.currentContext!).showSnackBar(
      SnackBar(content: Text(text),
        duration: Duration(milliseconds: time!),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        behavior: SnackBarBehavior.floating,
      )
  );
}

int validateMap(data){
  int r = 1;
  try {
    (data as Map<dynamic, dynamic>).forEach((key, value) {
      if (value['type'] != "NO") {
        print('email error--11-'+value['value']);
        if (regex[value['type']] != null) {
          print('email error--22-'+value['value']);
          bool? c = regex[value['type']]?.hasMatch(value['value']);
          print('email error--33-'+value['value']);
          if (c == false || c == null) {
            print('email error--44-'+value['value']);
            showSnackbar(value['valid_msg']);
            print('email error--55-'+value['value']);
            r = 0;
            throw "";
          }
        }
      }
      // else if(value['type'] !='PASS'){
      //   if(value['value'].)
      // }
      else {
        if (value['msg'] != "") {
          if(value['value']=="" || value['value']==null) {
            showSnackbar(value['msg']);
            r = 0;
            throw "";
          };


        }
        else {
          r = 1;
        }
      }
    });
  }
  catch(e){
    print('throw ho gaha');
    return r;
  }
  return r;
}



String? validateEmail(String email) {
  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  if (emailValid == false || email == null) {
    showSnackbar('Enter a valid email address');
    return 'err';
  }
  else
    return null;
}

String? validateStrong_Password(String pass) {
  bool passValid = new RegExp(r'[0-9a-zA-Z]{6,}').hasMatch(pass);
  // bool passValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$').hasMatch(pass);
  if(pass==''){
    showSnackbar('Please enter password.');
    return 'err';
  } else
  if (passValid == false) {
    showSnackbar('Password must contain at least 6 characters.');
    //showSnackbar(time: 3500,'Password must contain at least 6 characters. The password must include at least 1 uppercase, 1 lowercase, 1 special character and 1 number.');
    return 'err';
  }
  else
    return null;
}



String? validateString(String? str, String message, BuildContext context){
  String? value = (str==null)?"":str.trim();
  if(value==null || value==''){
    showSnackbar(message);
    return "err";
  }
  else{
    return null;
  }
}

String? validatepassword_confirmpassword(String? str,String? str2,String message, BuildContext context){
  String? value = (str==null)?"":str.trim();
  String? value2 = (str2==null)?"":str2.trim();
  if(value!=value2){
    showSnackbar(message);
    return "err";
  }
  else{
    return null;
  }
}