import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:optuae/constants/Textstyles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Functions/navigation_functions.dart';
import '../Widget/appbar.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';
import '../modal/cart_modal.dart';
import '../services/api_urls.dart';
import '../services/cart_manage.dart';
import '../services/validation.dart';
import '../services/webservices.dart';
import 'SelectAddress.dart';

class NeedDelivery extends StatefulWidget {
  const NeedDelivery({Key? key}) : super(key: key);

  @override
  State<NeedDelivery> createState() => _NeedDeliveryState();
}

class _NeedDeliveryState extends State<NeedDelivery> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController city = TextEditingController();
  List<CartItem> carts = [];

  @override
  void initState() {
    // TODO: implement initState
    load_cart();
    firstName.text = userData.fName??'';
    lastName.text = userData.lName??'';
    mobile.text = userData.phone??'';
    email.text = userData.email??'';
    city.text = userData.address??'';
    super.initState();
  }

  load_cart() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getStringList(cartKey);
    print('cart item ===== ${cartData}');
    if(cartData!=null){
      carts = cartData.map((item) => CartItem.fromJson(jsonDecode(item) as Map<String, dynamic>)).toList().cast<CartItem>();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: appBar(
        context: context,
        title: "Check out",
        titleStyle: MyStyle.black50016,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: size_width * 0.04, right: size_width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size_height * 0.01),
              Text("Need Delivery", style: MyStyle.black60030,),
              Text("From stock", style: MyStyle.lb40016,),
              SizedBox(height: size_height * 0.02,),

              // CustomTextField(
              //   controller: firstName,
              //   hintText: 'First Name',
              //   contentBottomPadding: 7,
              //   bgColor: MyColors.white,
              //   hintcolor: MyColors.lightblack.withOpacity(0.45),
              // ),
              // SizedBox(
              //   height: size_height * 0.01,
              // ),
              // CustomTextField(
              //   controller: lastName,
              //   hintText: 'Last Name',
              //   contentBottomPadding: 7,
              //   bgColor: MyColors.white,
              //   hintcolor: MyColors.lightblack.withOpacity(0.45),
              // ),
              // SizedBox(
              //   height: size_height * 0.01,
              // ),
              // CustomTextField(
              //   controller: city,
              //   hintText: 'City',
              //   contentBottomPadding: 7,
              //   bgColor: MyColors.white,
              //   hintcolor: MyColors.lightblack.withOpacity(0.45),
              // ),
              // SizedBox(
              //   height: size_height * 0.01,
              // ),
              // CustomTextField(
              //   controller: email,
              //   hintText: 'Email Address',
              //   bgColor: MyColors.white,
              //   contentBottomPadding: 7,
              //   keyboardType: TextInputType.emailAddress,
              //   hintcolor: MyColors.lightblack.withOpacity(0.45),
              // ),
              // SizedBox(
              //   height: size_height * 0.01,
              // ),
              // CustomTextField(
              //   controller: mobile,
              //   hintText: 'Mobile Number',
              //   bgColor: MyColors.white,
              //   contentBottomPadding: 7,
              //   keyboardType: TextInputType.number,
              //   hintcolor: MyColors.lightblack.withOpacity(0.45),
              // ),
              // SizedBox(
              //   height: size_height * 0.01,
              // ),


              CustomTextField(
                controller: comment,
                hintText: 'Comment to the order',
                bgColor: MyColors.white,
                maxLines: 10,
                myheight: size_height*0.15,
                contentTopPadding: 10,
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),

              SizedBox(height: size_height * 0.02,),
              Text("Payment Summary" , style: MyStyle.black60018,),
              SizedBox(height: size_height*0.01),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.white
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: size_width*0.03, vertical: size_height*0.015),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Item Total", style: MyStyle.black50015,),
                          Text("\$${Cartmanage.totalPrice}", style: MyStyle.black50015,),
                        ],
                      ),
                      SizedBox(height: size_height*0.005),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: MyStyle.black70015,),
                          Text("\$${Cartmanage.totalPrice}", style: MyStyle.black70015,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size_height * 0.02,),
              RoundEdgedButton(
                text: 'Checkout',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: size_height * 0.07,
                onTap: () async{
                  if(validateString(firstName.text,'Please enter first name.', context)==null&&
                      validateString(lastName.text,'Please enter last name.', context)==null&&
                      validateString(city.text,'Please enter city/address.', context)==null&&
                      validateEmail(email.text)==null&&
                      validateString(mobile.text,'Please enter mobile number.', context)==null&&
                      validateString(comment.text,'Please enter comment.', context)==null
                  ){
                    Map<String,dynamic> files = {};
                    Map<String,dynamic> data = {
                      'fname':firstName.text,
                      'user_id':userData.id.toString(),
                      'lname':lastName.text,
                      'address':city.text,
                      'email':email.text,
                      'phone':mobile.text,
                      'comment':comment.text,
                      'total_amount':Cartmanage.totalPrice.toString(),
                    };
                    for(int i =0;i<carts.length;i++){
                      data['id[$i]']=carts[i].id.toString();
                      data['qty[$i]']=carts[i].qty.toString();
                      data['name[$i]']=carts[i].name.toString();
                      data['photo[$i]']=carts[i].photo.toString();
                      data['price[$i]']=carts[i].price.toString();
                      data['brand[$i]']=carts[i].brand.toString();
                      data['model[$i]']=carts[i].model.toString();
                      data['year[$i]']=carts[i].year.toString();
                      data['body[$i]']=carts[i].body.toString();
                      data['engine[$i]']=carts[i].engine.toString();
                      data['topBottom[$i]']=carts[i].topBottom.toString();
                      data['frontRear[$i]']=carts[i].frontRear.toString();
                      data['lionRight[$i]']=carts[i].lionRight.toString();
                      data['color[$i]']=carts[i].color.toString();
                      data['partNumber[$i]']=carts[i].partNumber.toString();
                      data['item_comment[$i]']=carts[i].comment.toString();
                      data['manufacturer[$i]']=carts[i].manufacturer.toString();
                      data['newUsed[$i]']=carts[i].newUsed.toString();
                      data['stockStatus[$i]']=carts[i].stockStatus.toString();
                      // for(int j=0;j<carts[i].images.length;j++){
                      //   data['images[$i][$j]']=carts[i].images[j].toString();
                      // }
                    }
                    loadingShow(context);
                    var res = await Webservices.postDataWithImageFunction(body:data,files:files,apiUrl:ApiUrls.booking);
                    loadingHide(context);
                    print('booking confirm $res');
                    if(res['status'].toString()=='1'){
                      success_popup(res['booking_id'].toString());
                    }
                  }
                  //push(context: context, screen: SelectAddress());
                },
              ),
              SizedBox(height: size_height * 0.01,),

              Text("By clicking the Checkout button, you agree to the privacy policy", style: MyStyle.grey30016),

              SizedBox(height: size_height * 0.01,),

            ],
          ),
        ),
      ),

    );
  }
  success_popup(String booking_id) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),

            icon: Icon(
              Icons.check_circle_rounded,
              color: MyColors.primaryColor,
              size: 150,
            ),
            title: Text(
              'Congratulations! Your booking has been done successfully.',
              style: TextStyle(color: Colors.black),
            ),
            // title: Text('Congratulations! Your booking has been done successfully.Your booking ID #${booking_id}',style: TextStyle(color: Colors.black),),
            actions: [
              TextButton(
                onPressed: () {
                  Cartmanage.clear();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text(
                  'Continue',
                  style: TextStyle(color: MyColors.primaryColor),
                ),
              ),
            ],
          );
        });
  }
}
