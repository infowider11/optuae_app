import 'package:flutter/material.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Widget/appbar.dart';
import 'package:optuae/Widget/round_edged_button.dart';

import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../services/custom_circular_image.dart';
import 'Checkout.dart';

class Cart extends StatefulWidget {
  bool isbottombar=false;
  Cart({Key? key, required this.isbottombar}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List car = [
    {"img": MyImages.carDetail1},
    {"img": MyImages.carDetail2},
    {"img": MyImages.carDetail4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar:
      widget.isbottombar == false?
      AppBar(
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
                        imageUrl: userInfo.profileImage.toString(),
                        fileType: CustomFileType.network,
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Hello, ${userInfo.fName} ${userInfo.lName}",
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
      )
      : appBar(context: context, title: 'My Cart', titleStyle: MyStyle.black50016,),
      body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size_width*0.045),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: size_height*0.02),
                widget.isbottombar == false?
                Text("My Cart" , style: MyStyle.black70030,): Container(),
                SizedBox(height: size_height*0.01),

          
                     for(int index=0; index<car.length; index++)
                     Padding(
                       padding: EdgeInsets.only(bottom: size_height*0.02),
                       child: Material(
                         borderRadius: BorderRadius.circular(10),
                         elevation: 3,
                         child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                           child: Row(
                             children: [
                               ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.asset(car[index]['img'], height: size_height*0.065),
                               ),
                               SizedBox(width: size_width*0.02,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('Nose cut BMW 1-Series F20', style: MyStyle.black50015,),
                                   SizedBox(height: size_height*0.005,),
                                   Text('\$2,868', style: MyStyle.black70018,),

                                 ],
                               ),
                               Spacer(),
                               Container(
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(5),
                                     color: MyColors.primaryColor
                                 ),
                                 child: Padding(
                                   padding: EdgeInsets.symmetric(horizontal: size_width*0.02),
                                   child: Row(
                                     children: [
                                       Text('-', style: MyStyle.black60020,),
                                       SizedBox(width: size_width*0.01,),
                                       Text('1', style: MyStyle.black60010,),
                                       SizedBox(width: size_width*0.01,),
                                       Text('+', style: MyStyle.black60015,),
                                     ],
                                   ),
                                 ),
                               )
                             ],
                           ),
                         ),
                       ),
                     ),

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
                            Text("Item Count", style: MyStyle.black50015,),
                            Text("4", style: MyStyle.black50015,),
                          ],
                        ),
                        SizedBox(height: size_height*0.005),
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

              ]
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: size_width*0.05, vertical: size_height*0.02),
        child: RoundEdgedButton(
          text: 'Checkout',
          height: size_height*0.07,
          onTap: (){
            push(context: context, screen: Checkout());
          },
        ),
      ),
    );
  }
}
