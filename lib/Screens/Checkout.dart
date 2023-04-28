import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/constants/colors.dart';
import 'package:optuae/constants/global_data.dart';
import 'package:optuae/constants/images_url.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Screens/willPickUp.dart';
import '../constants/Textstyles.dart';
import '../Widget/appbar.dart';
import 'NeedDelivery.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  bool willPick=false;
  bool needDeliver=false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(
        context: context,
        title: "Check out",
        titleStyle: MyStyle.black50016,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size_width * 0.045),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size_height * 0.01,
                ),
                Text("Select the checkout method", style: MyStyle.black70030,),
                SizedBox(height: size_height * 0.01,),
                Text("When you place an order, you automatically book items from your shopping cart.", style: MyStyle.black50016,),
                SizedBox(height: size_height * 0.025),
                
                GestureDetector(
                  onTap: (){
                    setState(() {
                      willPick = true;
                      needDeliver = false;
                    });
                    push(context: context, screen: willPickUp());
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 3,
                    color: willPick==true ? MyColors.primaryColor : MyColors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size_width*0.05, vertical: size_height*0.015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("I'll pick it up myself", style: MyStyle.black60015,),
                              SizedBox(height: size_height*0.005,),
                              Text('from stock', style: MyStyle.lb40015,),

                            ],
                          ),
                          Icon(Icons.check_circle, color: willPick==true ? MyColors.black : MyColors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: size_height * 0.02),
                
                GestureDetector(
                  onTap: (){
                    setState(() {
                      willPick = false;
                      needDeliver = true;
                    });
                    push(context: context, screen: NeedDelivery());
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 3,
                    color : needDeliver==true ? MyColors.primaryColor : MyColors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size_width*0.05, vertical: size_height*0.015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Need Delivery", style: MyStyle.black60015,),
                              SizedBox(height: size_height*0.005,),
                              Text('from stock', style: MyStyle.lb40015,),

                            ],
                          ),
                          Icon(Icons.check_circle, color: needDeliver==true ? MyColors.black : MyColors.white, )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),

    );
  }
}
