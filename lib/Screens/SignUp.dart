import 'package:flutter/material.dart';
import 'package:optuae/constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Functions/navigation_functions.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(left:0, child: Image.asset(MyImages.login, height: size_height/2, width: size_width, fit: BoxFit.cover, opacity: AlwaysStoppedAnimation(0.06),)),
          Positioned(bottom:0, child: Image.asset(MyImages.login, height: size_height/2, width: size_width, fit: BoxFit.cover, opacity: AlwaysStoppedAnimation(0.06),)),
          Padding(
            padding: EdgeInsets.only(left: size_width * 0.04, right: size_width * 0.04),
            child: Column(
              children: [
                SizedBox(height: size_height * 0.05),
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.chevron_left, color: MyColors.black, size: 30,)),
                    Text("Sign up", style: MyStyle.black50016,),
                  ],
                ),
                SizedBox(height: size_height * 0.08),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Sign up", style: MyStyle.black60030,),
                    Text("Please enter the details.", style: MyStyle.lb40016,),

                    SizedBox(height: size_height * 0.02,),

                    CustomTextField(
                      controller: firstName,
                      hintText: 'First Name',
                      bgColor: MyColors.white,
                      contentBottomPadding: 5,
                      suffix: Image.asset(MyImages.user, height: size_height*0.03),
                      hintcolor: MyColors.lightblack.withOpacity(0.45),
                    ),
                    SizedBox(
                      height: size_height * 0.01,
                    ),
                    CustomTextField(
                      controller: lastName,
                      hintText: 'Last Name',
                      bgColor: MyColors.white,
                      contentBottomPadding: 5,
                      suffix: Image.asset(MyImages.user, height: size_height*0.03),
                      hintcolor: MyColors.lightblack.withOpacity(0.45),
                    ),
                    SizedBox(
                      height: size_height * 0.01,
                    ),
                  CustomTextField(
                      controller: email,
                      hintText: 'Email Address',
                      bgColor: MyColors.white,
                    contentBottomPadding: 5,
                    keyboardType: TextInputType.emailAddress,
                      suffix: Image.asset(MyImages.mail, height: size_height*0.03),
                      hintcolor: MyColors.lightblack.withOpacity(0.45),
                    ),
                    SizedBox(
                      height: size_height * 0.01,
                    ),
                    CustomTextField(
                      controller: mobile,
                      hintText: 'Mobile Number',
                      bgColor: MyColors.white,
                      contentBottomPadding: 5,
                      keyboardType: TextInputType.number,
                      suffix: Image.asset(MyImages.phone, height: size_height*0.03),
                      hintcolor: MyColors.lightblack.withOpacity(0.45),
                    ),
                    SizedBox(
                      height: size_height * 0.01,
                    ),
                    CustomTextField(
                      controller: pass,
                      hintText: 'Password',
                      contentBottomPadding: 5,
                      bgColor: MyColors.white,
                      obscureText: true,
                      suffix: Image.asset(MyImages.lock, height: size_height*0.03),
                      hintcolor: MyColors.lightblack.withOpacity(0.45),
                    ),
                    SizedBox(
                      height: size_height * 0.01,
                    ),


                    CustomTextField(
                      controller: confirmPass,
                      hintText: 'Confirm Password',
                      bgColor: MyColors.white,
                      contentBottomPadding: 5,
                      obscureText: true,
                      suffix: Image.asset(MyImages.lock, height: size_height*0.03),
                      hintcolor: MyColors.lightblack.withOpacity(0.45),
                    ),

                    SizedBox(
                      height: size_height * 0.02,
                    ),

                    RoundEdgedButton(
                      text: 'Sign Up',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      height: size_height * 0.07,
                      onTap: () {},
                    ),



                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(bottom: size_height*0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("If you already have an Account? ", style: MyStyle.grey30016),

            GestureDetector(
              onTap: ()=> pushReplacement(context: context, screen: login()),
              child: Text("Login", style: TextStyle(fontSize: 16, fontFamily: "nunito", fontWeight: FontWeight.w600, color: MyColors.greyText, decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ),
    );
  }
}
