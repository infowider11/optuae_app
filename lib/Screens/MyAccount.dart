import 'package:flutter/material.dart';
import 'package:optuae/constants/Textstyles.dart';
import 'package:optuae/Screens/login.dart';
import 'package:optuae/Screens/privacy_policy.dart';
import 'package:optuae/Screens/terms_condition.dart';
import 'package:optuae/services/auth.dart';
import 'package:optuae/services/navigation_functions.dart';

import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../services/custom_circular_image.dart';
import 'changePassword.dart';
import 'editProfile.dart';
import 'orderHistory.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        leadingWidth: size_width,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCircularImage(
                        imageUrl: userData.profileImage.toString(),
                        fileType: CustomFileType.network,
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Hello, ${userData.fName} ${userData.lName}",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "nunito",
                            fontWeight: FontWeight.w600,
                            color: MyColors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 15, bottom: 15),
            child: Image.asset(MyImages.bell),
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size_width*0.045),
        child: Column(
          children: [

            SizedBox(height: size_height*0.03),

            Row(
              children: [
                CustomCircularImage(
                  imageUrl: userData.profileImage.toString(),
                  fileType: CustomFileType.network,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
                SizedBox(width: size_width*0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${userData.fName} ${userData.lName}", style: MyStyle.black50015),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_rounded, size: size_height*0.02,),
                        Text("${userData.address??'-'}", style: MyStyle.grey50012),
                      ],
                    ),
                  ],
                ),

              ],
            ),

            SizedBox(height: size_height*0.05),

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.white
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size_width*0.04, vertical: size_height*0.02),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async{
                        await push(context: context, screen: EditProfile());
                        setState(() {

                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Edit Profile', style: MyStyle.black40013,),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    SizedBox(height: size_height*0.01,),
                    Container(height: size_height*0.001, width: size_width, color: MyColors.lightgrey,),
                    SizedBox(height: size_height*0.01,),
                    GestureDetector(
                      onTap: (){
                        push(context: context, screen: orderHistory());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order History', style: MyStyle.black40013,),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    SizedBox(height: size_height*0.01,),
                    Container(height: size_height*0.001, width: size_width, color: MyColors.lightgrey,),
                    SizedBox(height: size_height*0.01,),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        push(context: context, screen: changePassword());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Change Password', style: MyStyle.black40013,),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    SizedBox(height: size_height*0.01,),
                    Container(height: size_height*0.001, width: size_width, color: MyColors.lightgrey,),
                    SizedBox(height: size_height*0.01,),
                    GestureDetector(
                      onTap: (){
                        push(context: context, screen: terms_condition());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Terms & Conditions', style: MyStyle.black40013,),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    SizedBox(height: size_height*0.01,),
                    Container(height: size_height*0.001, width: size_width, color: MyColors.lightgrey,),
                    SizedBox(height: size_height*0.01,),
                    GestureDetector(
                      onTap: (){
                        push(context: context, screen: privacy_policy());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Privacy Policy', style: MyStyle.black40013,),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    SizedBox(height: size_height*0.01,),
                    Container(height: size_height*0.001, width: size_width, color: MyColors.lightgrey,),
                    SizedBox(height: size_height*0.01,),
                    GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            title: Text('Logout'),
                            content: Text('Are you sure?'),
                            actions: [
                              TextButton(
                                  onPressed: () async{
                                    await logout(true,isDevice: false);
                                    pushAndRemoveUntil(context: context, screen: login());
                                  },
                                  child: Text('Yes')
                              ),
                              TextButton(
                                  onPressed: () async{
                                    Navigator.pop(context);
                                  },
                                  child: Text('No')
                              ),
                            ],
                          );
                        });
                        // push(context: context, screen: login());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Log Out', style: MyStyle.black40013,),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),




                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
