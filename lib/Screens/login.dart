import 'package:flutter/material.dart';
import 'package:optuae/constants/Textstyles.dart';
import 'package:optuae/Functions/validation.dart';
import 'package:optuae/modal/user_modal.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/auth.dart';
import 'package:optuae/services/webservices.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';
import '../services/navigation_functions.dart';
import 'BottomBar.dart';
import 'Forget_password.dart';
import 'SignUp.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(left:0, child: Image.asset(MyImages.login, height: size_height/2, width: size_width, fit: BoxFit.cover, opacity: AlwaysStoppedAnimation(0.06),)),
                Positioned(bottom:0, child: Image.asset(MyImages.login, height: size_height/2, width: size_width, fit: BoxFit.cover, opacity: AlwaysStoppedAnimation(0.06),)),
                Padding(
                  padding: EdgeInsets.only(left: size_width * 0.04, right: size_width * 0.04,),
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
                          Text("Login", style: MyStyle.black50016,),
                        ],
                      ),
                      SizedBox(height: size_height * 0.08),
                      Column(
                        children: [

                          Image.asset(
                            MyImages.logo,
                            width: size_width / 2.5,
                          ),
                          SizedBox(height: size_height * 0.05),
                          Text(
                            "Login Account",
                            style: MyStyle.black60030,
                          ),
                          Text("Hello welcome back to your account", style: MyStyle.lb40016,),
                          SizedBox(height: size_height * 0.02,),
                          CustomTextField(
                            controller: email,
                            hintText: 'Enter Email',
                            contentBottomPadding: 5,
                            bgColor: MyColors.white,
                            suffix: Image.asset(MyImages.user, height: size_height*0.03),
                            hintcolor: MyColors.lightblack.withOpacity(0.45),
                          ),
                          SizedBox(
                            height: size_height * 0.01,
                          ),
                          CustomTextField(
                            controller: pass,
                            hintText: 'Enter Password',
                            bgColor: MyColors.white,
                            contentBottomPadding: 5,
                            obscureText: true,
                            suffix: Image.asset(MyImages.lock, height: size_height*0.03),
                            hintcolor: MyColors.lightblack.withOpacity(0.45),
                          ),
                          SizedBox(
                            height: size_height * 0.02,
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: ()=> push(context: context, screen: Forget_password()),
                                child: Text(
                                  "Forgot Password?",
                                  style: MyStyle.lb30016,
                                ),
                              )),
                          SizedBox(
                            height: size_height * 0.02,
                          ),
                          RoundEdgedButton(
                            text: 'Login',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            height: size_height * 0.07,
                            onTap: () async{
                              if(validateEmail(email.text)==null&&validateString(pass.text,'Please enter password.', context)==null){
                                Map<String,dynamic> data = {
                                  'email':email.text,
                                  'password':pass.text
                                };
                                loadingShow(context);
                                var res = await Webservices.postData(apiUrl: ApiUrls.login, request: data,);
                                loadingHide(context);
                                print('login---- $res');
                                if(res['status'].toString()=='1'){
                                  updateUserDetails(res['data']);
                                  userInfo = userData.fromJson(res['data']);
                                  pushAndRemoveUntil(context: context, screen: BottomBar());
                                } else {
                                  showSnackbar(res['message']);
                                }
                              }
                              // push(context: context, screen: BottomBar());
                            },
                          ),
                          SizedBox(height: size_height * 0.05),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Container(height: size_height*0.001, width: size_width/7, color: MyColors.divider,),
                          //     Text("Or Sign in with social media", style: MyStyle.lb30015,),
                          //     Container(height: size_height*0.001, width: size_width/7, color: MyColors.divider,),
                          //   ],
                          // ),
                          //
                          // SizedBox(height: size_height * 0.035),
                          //
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: size_width * 0.15, right: size_width * 0.15),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       GestureDetector(
                          //           onTap: () {},
                          //           child: Image.asset(
                          //             MyImages.facebook,
                          //             height: size_height * 0.05,
                          //           )),
                          //       GestureDetector(
                          //           onTap: () {},
                          //           child: Image.asset(
                          //             MyImages.google,
                          //             height: size_height * 0.05,
                          //           )),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding:  EdgeInsets.only(bottom: size_height*0.02),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("If you don’t have an Account? ", style: MyStyle.grey30016),
      //
      //       GestureDetector(
      //         onTap: ()=> pushReplacement(context: context, screen: SignUp()),
      //         child: Text("Sign up", style: TextStyle(fontSize: 16, fontFamily: "nunito", fontWeight: FontWeight.w600, color: MyColors.greyText, decoration: TextDecoration.underline)),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
