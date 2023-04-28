import 'package:flutter/material.dart';
import 'package:optuae/constants/Textstyles.dart';
import 'package:optuae/constants/global_Keys.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/validation.dart';
import 'package:optuae/services/webservices.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';

class Forget_password extends StatefulWidget {
  const Forget_password({Key? key}) : super(key: key);

  @override
  State<Forget_password> createState() => _Forget_passwordState();
}

class _Forget_passwordState extends State<Forget_password> {

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SingleChildScrollView(
        child: Stack(
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
                      Text("Forgot Password", style: MyStyle.black50016,),
                    ],
                  ),
                  SizedBox(height: size_height * 0.25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Forgot Password", style: MyStyle.black60030,),
                      Text("Enter your email address", style: MyStyle.lb40016,),

                      SizedBox(height: size_height * 0.02,),


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
                        height: size_height * 0.02,
                      ),
                      RoundEdgedButton(
                        text: 'Send',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        height: size_height * 0.07,
                        onTap: () async{
                          print('ghhh ${MyGlobalKeys.navigatorKey.currentContext}');
                          if(validateEmail(email.text)==null){
                            Map<String,dynamic> data = {
                              'email':email.text,
                            };
                            loadingShow(context);
                            // var res = await Webservices.postData(apiUrl:ApiUrls.forget_password, request: data,showSuccessMessage: true);
                            var res = await Webservices.getMap(ApiUrls.forget_password+'?email=${email.text}');
                            loadingHide(context);
                            print('forgot $res');
                            if(res['status'].toString()=='1'){
                              Navigator.pop(context);
                              showSnackbar(res['message']);
                            } else {
                              showSnackbar(res['message']);
                            }
                          }
                        },
                      ),



                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
