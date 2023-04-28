import 'package:flutter/material.dart';
import 'package:optuae/constants/colors.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Screens/welcome.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/auth.dart';
import 'package:optuae/services/navigation_functions.dart';
import 'package:optuae/services/webservices.dart';
import '../constants/images_url.dart';
import '../constants/global_data.dart';
import 'BottomBar.dart';
import '../modal/user_modal.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future<void> timer() async {
    Future.delayed(Duration(seconds: 3),(){
      // push(context: context, screen: Welcome());
      CheckSession();
    });
  }
  CheckSession() async{
    if(await isUserLoggedIn()){
      var res = await Webservices.getMap(ApiUrls.getUserDetails+await getCurrentUserId());
      print('splash session data $res');
      if(res!=null){
        updateUserDetails(res);
        userInfo = userData.fromJson(res);
        pushAndRemoveUntil(context: context, screen: BottomBar());
      }
    } else {
      pushAndRemoveUntil(context: context, screen: Welcome());
    }
  }
  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size_height = MediaQuery.of(context).size.height;
    size_width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: MyColors.primaryColor,
        body:Center(
          child: Image.asset(MyImages.logo,  width: size_width*0.4,),
        )

    );
  }
}
