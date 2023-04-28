import 'package:flutter/material.dart';
import 'package:optuae/constants/Textstyles.dart';
import 'package:optuae/constants/images_url.dart';
import 'package:optuae/Screens/SignUp.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../Functions/navigation_functions.dart';
import '../Widget/round_edged_button.dart';
import 'login.dart';



class pre_login extends StatefulWidget {
  const pre_login({Key? key}) : super(key: key);

  @override
  State<pre_login> createState() => _pre_loginState();
}

class _pre_loginState extends State<pre_login> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Positioned(left: 0, child: Image.asset(MyImages.prelogin1, width: size_width/2, opacity: const AlwaysStoppedAnimation(.2))),
          Positioned(right: 0, child: Image.asset(MyImages.prelogin2, width: size_width/2, height: size_height/2.5,opacity: const AlwaysStoppedAnimation(.2))),

          Padding(
            padding:  EdgeInsets.only(left: size_width*0.04, right: size_width*0.04, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome!", style: MyStyle.black70030,),
                Text("Please Login", style: MyStyle.grey40018,),

                SizedBox(height: size_height*0.03,),

                RoundEdgedButton(
                  text: 'Login',
                  fontWeight:  FontWeight.w700,
                  textColor: MyColors.lightblack,
                  height: size_height*0.07,
                  color:  MyColors.white,
                  border_color:  MyColors.white,
                  onTap: (){
                    push(context: context, screen: login());
                  },
                ),
                // SizedBox(height: size_height*0.03,),
                //
                // RoundEdgedButton(
                //   text: 'Sign Up',
                //   fontWeight: FontWeight.w500,
                //   height: size_height*0.063,
                //   color: MyColors.primaryColor,
                //   textColor: MyColors.lightblack,
                //   border_color: MyColors.primaryColor,
                //   verticalMargin: 3,
                //   onTap: (){
                //     push(context: context, screen: SignUp());
                //     },
                // ),

              ],
            ),
          ),

          Positioned(left: 0, bottom: 0, child: Image.asset(MyImages.prelogin3, width: size_width/2, height: size_height/3,opacity: const AlwaysStoppedAnimation(.2))),
          Positioned(right: 0, bottom: 0, child: Image.asset(MyImages.prelogin4, width: size_width/2, opacity: const AlwaysStoppedAnimation(.2))),
        ],
      ),
    );

  }
}
