import 'package:flutter/material.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Widget/round_edged_button.dart';
import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Widget/appbar.dart';
import 'Checkout.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(
        context: context,
        title: "Confirm Order",
        titleStyle: MyStyle.black50016,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size_width*0.045),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: size_height*0.02),
                Text("Confirm your order" , style: MyStyle.black70030,),
                SizedBox(height: size_height*0.03),


                Text("Order Details" , style: MyStyle.black60018,),
                SizedBox(height: size_height*0.01),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.white
                  ),
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size_width*0.03, vertical: size_height*0.02),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(MyImages.carDetail1, height: size_height*0.07,)),
                            SizedBox(width: size_width*0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nose cut BMW 1-Series F20", style: MyStyle.black50015,),
                                SizedBox(height: size_height*0.005),
                                Text("\$2,868", style: MyStyle.black70018,),
                              ],
                            ),
                            Spacer(),
                            Text("x1", style: MyStyle.black70018,),
                          ],
                        ),
                        SizedBox(height: size_height*0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Item Total", style: MyStyle.black50015,),
                            Text("\$2806", style: MyStyle.black50015,),
                          ],
                        ),
                        SizedBox(height: size_height*0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total", style: MyStyle.black70015,),
                            Text("\$2806", style: MyStyle.black70015,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size_height*0.03),

                Text("Billing Details" , style: MyStyle.black60018,),
                SizedBox(height: size_height*0.01),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.white
                  ),
                  child:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size_width*0.03, vertical: size_height*0.02),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Name :  ", style: MyStyle.black60015,),
                            SizedBox(width: size_width*0.02),
                            Text("John Smith", style: MyStyle.lb40015,),
                          ],
                        ),
                        SizedBox(height: size_height*0.01),
                        Container(height: size_height*0.001, width: size_width, color: MyColors.lightgrey,),
                        SizedBox(height: size_height*0.01),

                        Row(
                          children: [
                            Text("Email :  ", style: MyStyle.black60015,),
                            SizedBox(width: size_width*0.02),
                            Text("Johnsmith@gmail.com", style: MyStyle.lb40015,),
                          ],
                        ),
                        SizedBox(height: size_height*0.01),
                        Container(height: size_height*0.001, width: size_width, color: MyColors.lightgrey,),
                        SizedBox(height: size_height*0.01),

                        Row(
                          children: [
                            Text("Mobile No. :  ", style: MyStyle.black60015,),
                            SizedBox(width: size_width*0.02),
                            Text("+91 545489754", style: MyStyle.lb40015,),
                          ],
                        ),
                        SizedBox(height: size_height*0.01),
                        Container(height: size_height*0.001, width: size_width, color: MyColors.lightgrey,),
                        SizedBox(height: size_height*0.01),

                        Row(
                          children: [
                            Text("Address :  ", style: MyStyle.black60015,),
                            SizedBox(width: size_width*0.02),
                            Text("Dummy address, 452, USA", style: MyStyle.lb40015,),
                          ],
                        ),



                      ],
                    ),
                  ),
                ),



              ]
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: size_width*0.05, vertical: size_height*0.02),
        child: RoundEdgedButton(
          text: 'Confirm',
          height: size_height*0.07,
          onTap: (){

          },
        ),
      ),
    );
  }
}
