

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:optuae/constants/global_data.dart';
import 'package:optuae/services/webservices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../Screens/notification.dart';
import 'api_urls.dart';
import 'navigation_functions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modal/user_modal.dart';

int unread_notification_count = 0;
int unread_chat_count = 0;
int is_hide = 0; // 0 =hide 1=show;
late Timer? globel_timer;
List content = [];

void updateUserDetails(details) async{
  userData = UserModal.fromJson(details);
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  String user = jsonEncode(details);

  shared_User.setString('user_details', user);
}

Future<Map<String, dynamic>> getUserDetails() async{
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  String userMap = await shared_User.getString('user_details')!;
  String userS = (userMap==null)?'':userMap;
  // log('this is uer'+userMap!);
  // if(userMap==null){
  //     return 0.toString();
  // }
  // else{
  // userMap;
  //  log('this is one '+userS);
  Map<String , dynamic> user = jsonDecode(userS) as  Map<String, dynamic>;
  // log('this is '+user['user_id']);
  return user;//.toString();
  // }
}

Future getCurrentUserId() async{
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  print('1');
  String? userMap = await shared_User.getString('user_details');
  print('2');
  String userS = (userMap==null)?'':userMap;
  print('3');
  // log('this is uer'+userMap!);
  // if(userMap==null){
  //     return 0.toString();
  // }
  // else{
  // userMap;
  //  log('this is one '+userS);
  Map<String , dynamic> user = jsonDecode(userS) as  Map<String, dynamic>;
  print('4');
  // log('this is '+user['user_id']);
  return user['id'].toString();//.toString();
  // }
}
void updateUserId(id) async{
  // await FlutterSession().set("user_id", id);
}

Future isUserLoggedIn() async{
  // log("checking 124");
  // // SharedPreferences? sharedUser = null;
  final  sharedUser = await SharedPreferences.getInstance();
  //
  // return false;


  String? user = await sharedUser.getString('user_details');
  log(user.toString());
  // var d = jsonDecode(user);
  if(user==null){
    return false;
  }
  else{
    return true;
    log('user is already logged in '+user);
  }
  // await FlutterSession().get("user_details", details);
}

Future logout(bool is_timer,{isDevice=true}) async{
  print("logout()");
  if(isDevice){
    Map<String, dynamic> request = {
      'user_id': await getCurrentUserId(),
      'device_id': ''
    };
    await Webservices.postData(apiUrl: ApiUrls.device_id,request:request);
  }
  SharedPreferences shared_User = await SharedPreferences.getInstance();
  SharedPreferences cart = await SharedPreferences.getInstance();
  await cart.clear();
  await shared_User.clear();
  // userData=null;
  // user=null;
  if(is_timer&&globel_timer!=null){
    globel_timer!.cancel();
  }
  return true;
}


Future update_cart(List lists) async{
  SharedPreferences cart = await SharedPreferences.getInstance();
  String carts = jsonEncode(lists);
  cart.setString('cart', carts);
}

 Future<bool>isAlreadyService(Map service) async{
  SharedPreferences cart = await SharedPreferences.getInstance();
  String? carts =  cart.getString('cart');
  if(carts!=null){
    List lists = jsonDecode(carts);
    for(int i=0;i<lists.length;i++){
      if(lists[i]['user_id'].toString()==service['user_id'].toString()&&lists[i]['id'].toString()==service['id'].toString()){
        return true;
      }
    }
  }
  return false;
}

Future<List> get_cart() async{
  SharedPreferences cart = await SharedPreferences.getInstance();
  String? carts =  cart.getString('cart');
  if(carts==null){
    return [];
  } else {
    List lists = jsonDecode(carts);
    return lists;
  }
}


notificationHandling(context,Map? data) {
  print('push data ----- ${data}');
  push(context: context, screen: notification(
    noti_id: data!['notification_id'].toString(),
  ));
}

launchURL(url,bool fb) async{
  String fb_url = 'https://facebook.com/';
  String insta_url = 'https://instagram.com/';
  final uri;
  if(fb){
  uri = Uri.parse(fb_url+url);
  } else {
    uri = Uri.parse(insta_url+url);
  }
  if (!await launchUrl(uri,mode: LaunchMode.externalApplication,)) {
    throw Exception('Could not launch $uri');
  }
}

launchURL2(url,bool fb) async{
  String fb_url = 'https://facebook.com/';
  String insta_url = 'https://instagram.com/';
  final uri;
  if(fb){
    uri = Uri.parse(fb_url+url);
  } else {
    uri = Uri.parse(insta_url+url);
  }
  if (!await launchUrl(uri,mode: LaunchMode.externalApplication,)) {
    throw Exception('Could not launch $url');
  }
}



String CalculateTravalerCost(double distance){
  double amount = 0;
  if(distance>30){
    double grater_amount = distance - 30;
    amount = (grater_amount*1.50)*2;
  }
  return amount.toStringAsFixed(1);
}

isDatepassed(DateTime date_time) {
  DateTime targetDateTime = date_time;//DateTime.parse(date_time);
  print('targetDateTime--- $targetDateTime');
  DateTime currentDateTime = DateTime.now();
  if (targetDateTime.isBefore(currentDateTime)) {
    print('The target date and time has already passed.');
    return true;
  }
  return false;
}


