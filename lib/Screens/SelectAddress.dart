import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/constants/Textstyles.dart';
import 'package:optuae/constants/images_url.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../Functions/navigation_functions.dart';
import '../Widget/appbar.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';
import 'ConfirmOrder.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({Key? key}) : super(key: key);

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  TextEditingController address = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: appBar(
        context: context,
        title: "Select Address",
        titleStyle: MyStyle.black50016,
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: size_width * 0.04, right: size_width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size_height * 0.01),
            Text(
              "Select Address",
              style: MyStyle.black60030,
            ),
            Text("Select address where to deliver the product.", style: MyStyle.lb40016,),
            SizedBox(height: size_height * 0.025),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size_width * 0.03,
                    vertical: size_height * 0.02),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: MyColors.black,
                        ),
                        SizedBox(
                          width: size_width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Office",
                              style: MyStyle.black60016,
                            ),
                            Text(
                              "14, lorem ipsum - CANADA",
                              style: MyStyle.lb40016,
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          MyImages.menubtn,
                          height: size_height * 0.02,
                        )
                      ],
                    ),
                    SizedBox(
                      height: size_height * 0.01,
                    ),
                    Container(
                      height: size_height * 0.001,
                      width: size_width,
                      color: MyColors.black.withOpacity(0.15),
                    ),
                    SizedBox(
                      height: size_height * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: MyColors.black,
                        ),
                        SizedBox(
                          width: size_width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Home",
                              style: MyStyle.black60016,
                            ),
                            Text(
                              "14, lorem ipsum - CANADA",
                              style: MyStyle.lb40016,
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          MyImages.menubtn,
                          height: size_height * 0.02,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size_height * 0.02),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: MyColors.lightgrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    builder: (context) {
                     return StatefulBuilder(builder: (BuildContext context,
                          StateSetter setState) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: size_width*0.04, vertical: size_height*0.03),
                          child: Wrap(
                            spacing: 10,
                            children: [
                              Text("Address", style: MyStyle.black60016,),
                              SizedBox(height: size_height * 0.01),

                              CustomTextField(
                                controller: address,
                                hintText: 'Address Title',
                                bgColor: MyColors.white,
                                contentBottomPadding: 5,
                                hintcolor: MyColors.lightblack.withOpacity(0.45),
                              ),

                              CustomTextField(
                                controller: houseNo,
                                hintText: 'House Number',
                                bgColor: MyColors.white,
                                contentBottomPadding: 5,
                                hintcolor: MyColors.lightblack.withOpacity(0.45),
                              ),

                              CustomTextField(
                                controller: street,
                                hintText: 'Street',
                                bgColor: MyColors.white,
                                contentBottomPadding: 5,
                                hintcolor: MyColors.lightblack.withOpacity(0.45),
                              ),

                              CustomTextField(
                                controller: city,
                                hintText: 'City',
                                bgColor: MyColors.white,
                                contentBottomPadding: 5,
                                hintcolor: MyColors.lightblack.withOpacity(0.45),
                              ),

                              CustomTextField(
                                controller: state,
                                hintText: 'State',
                                bgColor: MyColors.white,
                                contentBottomPadding: 5,
                                hintcolor: MyColors.lightblack.withOpacity(0.45),
                              ),

                              CustomTextField(
                                controller: country,
                                hintText: 'Country',
                                bgColor: MyColors.white,
                                contentBottomPadding: 5,
                                hintcolor: MyColors.lightblack.withOpacity(0.45),
                              ),

                              CustomTextField(
                                controller: pincode,
                                hintText: 'Pin Code',
                                bgColor: MyColors.white,
                                keyboardType: TextInputType.number,
                                contentBottomPadding: 5,
                                hintcolor: MyColors.lightblack.withOpacity(0.45),
                              ),
                              SizedBox(height: size_height * 0.02),

                              RoundEdgedButton(
                                  text: 'Add Address',
                                fontSize: 20,
                                height: size_height*0.07,
                                onTap: (){
                                  Navigator.pop(context);
                                },
                              ),


                            ],
                          ),
                        );
                      });
                    });
              },
              child: Container(
                width: size_width / 3,
                height: size_height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add address',
                      style: MyStyle.black60015,
                    ),
                    Text(
                      ' +',
                      style: MyStyle.black60020,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: size_height * 0.02,
            ),
            Text(
              "Payment Summary",
              style: MyStyle.black60018,
            ),
            SizedBox(height: size_height * 0.01),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size_width * 0.03,
                    vertical: size_height * 0.015),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item Total",
                          style: MyStyle.black50015,
                        ),
                        Text(
                          "\$2,868",
                          style: MyStyle.black50015,
                        ),
                      ],
                    ),
                    SizedBox(height: size_height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: MyStyle.black70015,
                        ),
                        Text(
                          "\$2806",
                          style: MyStyle.black70015,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size_height * 0.02,
            ),
            RoundEdgedButton(
              text: 'Next',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: size_height * 0.07,
              onTap: () {
                push(context: context, screen: ConfirmOrder());
              },
            ),
            SizedBox(
              height: size_height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
