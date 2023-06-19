import 'dart:async';

import 'package:flutter/material.dart';
import 'package:optuae/Screens/login.dart';
import 'package:optuae/constants/global_data.dart';
import 'package:optuae/Screens/Category.dart';
import 'package:optuae/Screens/MyAccount.dart';
import 'package:optuae/services/navigation_functions.dart';
import '../Widget/cartcount.dart';
import '../constants/colors.dart';
import '../constants/images_url.dart';
import '../services/api_urls.dart';
import '../services/auth.dart';
import '../services/cart_manage.dart';
import '../services/onesignal.dart';
import '../services/webservices.dart';
import 'Cart.dart';
import 'Home.dart';
import 'new_home_page.dart';

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
      unread_notification_count = int.parse(res['unread_notification_count'].toString());
      if(res['status'].toString()=='0'){
        await logout(true,isDevice: true);
        pushAndRemoveUntil(context: context, screen: login());
      }
      // debugPrint(timer.tick.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    setNotificationHandler(context);
    Cartmanage.loadCartItems();
    interval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: [
          NewHomePage(),
          Category(),
          MyAccount(),
          Cart(isbottombar: false,),
        ].elementAt(_selectedIndex),
      ),

      bottomNavigationBar: Container(
        height: size_height*0.11,
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

              icon: Stack(
                children: [
                  ImageIcon(
                    AssetImage(MyImages.cart),
                    size:25,
                  ),
                  Positioned(
                      top: 0,
                      bottom: 5,
                      right: 0,
                      child: cartcountCircle(),
                  )
                ],
              ),
              activeIcon: Stack(
                children: [
                  Container(
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
                  Positioned(
                    top: 0,
                    bottom: 20,
                    right: 0,
                    child: cartcountCircle(),
                  )
                ],
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