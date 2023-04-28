import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/Functions/validation.dart';
import 'package:optuae/Widget/appbar.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/webservices.dart';
import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  TextEditingController ConfirmPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController NewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(
        context: context,
        title: 'Change Password',
        titleStyle: MyStyle.black50016,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: size_width * 0.04, right: size_width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size_height * 0.02),
              Text(
                "Change Password",
                style: MyStyle.black70030,
              ),
              Text(
                "Please enter the details.",
                style: MyStyle.lb40016,
              ),
              SizedBox(height: size_height * 0.025),
              CustomTextField(
                controller: password,
                hintText: 'Password',
                bgColor: MyColors.white,
                contentBottomPadding: 5,
                obscureText: true,
                suffix: Image.asset(MyImages.lock, height: size_height * 0.03),
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(
                height: size_height * 0.01,
              ),
              CustomTextField(
                controller: NewPassword,
                hintText: 'New Password',
                bgColor: MyColors.white,
                obscureText: true,
                contentBottomPadding: 5,
                suffix: Image.asset(MyImages.lock, height: size_height * 0.03),
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(
                height: size_height * 0.01,
              ),
              CustomTextField(
                controller: ConfirmPassword,
                hintText: 'Confirm Password',
                obscureText: true,
                bgColor: MyColors.white,
                contentBottomPadding: 5,
                suffix: Image.asset(MyImages.lock, height: size_height * 0.03),
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(height: size_height * 0.03),
              RoundEdgedButton(
                text: 'Update',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: size_height * 0.07,
                onTap: () async {
                  if (validateString(
                              password.text, 'Please enter old password.', context) ==
                          null &&
                      validateStrong_Password(NewPassword.text) ==
                          null &&
                      validatepassword_confirmpassword(
                              NewPassword.text,
                              ConfirmPassword.text,
                              'New password and confirm password should be same.',
                              context) ==
                          null) {
                    Map<String,dynamic> data = {
                      'id':userInfo.id.toString(),
                      'current_password':password.text,
                      'new_password':NewPassword.text,
                      'confirm_password':ConfirmPassword.text,
                    };
                    loadingShow(context);
                    var res = await Webservices.postData(apiUrl:ApiUrls.change_password, request:data);
                    loadingHide(context);
                    print('change pass $res');
                    if(res['status'].toString()=='1'){
                      Navigator.pop(context);
                      showSnackbar(res['message']);
                    }
                    else {
                    showSnackbar(res['message']);}
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
