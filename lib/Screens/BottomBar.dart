import 'dart:async';

import 'package:flutter/material.dart';
import 'package:optuae/Screens/login.dart';
import 'package:optuae/constants/global_data.dart';
import 'package:optuae/Screens/Category.dart';
import 'package:optuae/Screens/MyAccount.dart';
import 'package:optuae/services/navigation_functions.dart';
import '../constants/colors.dart';
import '../constants/images_url.dart';
import '../services/api_urls.dart';
import '../services/auth.dart';
import '../services/webservices.dart';
import 'Cart.dart';
import 'Home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      print('pressed');
      _selectedIndex = index;
    });
  }



  interval() async{
    globel_timer =  Timer.periodic(new Duration(seconds: 5), (timer) async{
      var res = await Webservices.getMap(ApiUrls.interval+await getCurrentUserId());
      print('block status-----$res');
      if(res['status'].toString()=='0'){
        await logout(true,isDevice: false);
        pushAndRemoveUntil(context: context, screen: login());
      }
      // debugPrint(timer.tick.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    interval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: [
          Home(),
          Category(),
          MyAccount(),
          Cart(isbottombar: false,),
        ].elementAt(_selectedIndex),
      ),

      bottomNavigationBar: Container(
        height: size_height*0.09,
        child: BottomNavigationBar(
          backgroundColor:MyColors.black,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          elevation: 0,
          unselectedFontSize: 10,
          unselectedItemColor:MyColors.white.withOpacity(0.8),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(
                AssetImage(MyImages.home),
                size:25,
              ),
              activeIcon:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.primaryColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(
                    AssetImage(MyImages.home),
                    color: MyColors.black,
                    size:25,
                  ),
                ),
              ),
              backgroundColor: MyColors.white,
            ),
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(
                AssetImage(MyImages.Category),
                size:25,
              ),
              // icon: Icon(Icons.),
              activeIcon:Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.primaryColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(
                    AssetImage(MyImages.Category),
                    color: MyColors.black,
                    size:25,
                  ),
                ),
              ),
              backgroundColor: MyColors.white,
            ),
            BottomNavigationBarItem(
                label: '',

                icon: ImageIcon(
                  AssetImage(MyImages.myAccount),
                  size:25,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.primaryColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage(MyImages.myAccount),
                      color: MyColors.black,
                      size:25,
                    ),
                  ),
                ),
                backgroundColor: MyColors.white
            ),
            BottomNavigationBarItem(

              icon: ImageIcon(
                AssetImage(MyImages.cart),
                size:25,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.primaryColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(
                    AssetImage(MyImages.cart),
                    color: MyColors.black,
                    size:25,
                  ),
                ),
              ),
              label: '',
              backgroundColor:MyColors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: MyColors.primaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

/**/