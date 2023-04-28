import 'package:flutter/material.dart';
import 'package:optuae/constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Functions/navigation_functions.dart';
import '../Widget/appbar.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';
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

              Text("Need delivery", style: MyStyle.black60030,),
              Text("To transport company", style: MyStyle.lb40016,),

              SizedBox(height: size_height * 0.02,),

              CustomTextField(
                controller: firstName,
                hintText: 'First Name',
                contentBottomPadding: 7,
                bgColor: MyColors.white,
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(
                height: size_height * 0.01,
              ),
              CustomTextField(
                controller: lastName,
                hintText: 'Last Name',
                contentBottomPadding: 7,
                bgColor: MyColors.white,
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(
                height: size_height * 0.01,
              ),
              CustomTextField(
                controller: city,
                hintText: 'City',
                contentBottomPadding: 7,
                bgColor: MyColors.white,
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(
                height: size_height * 0.01,
              ),
              CustomTextField(
                controller: email,
                hintText: 'Email Address',
                bgColor: MyColors.white,
                contentBottomPadding: 7,
                keyboardType: TextInputType.emailAddress,
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(
                height: size_height * 0.01,
              ),
              CustomTextField(
                controller: mobile,
                hintText: 'Mobile Number',
                bgColor: MyColors.white,
                contentBottomPadding: 7,
                keyboardType: TextInputType.number,
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(
                height: size_height * 0.01,
              ),


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
                          Text("\$2,868", style: MyStyle.black50015,),
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
              SizedBox(height: size_height * 0.02,),

              RoundEdgedButton(
                text: 'Checkout',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: size_height * 0.07,
                onTap: () {
                  push(context: context, screen: SelectAddress());
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
}
