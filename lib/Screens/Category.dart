import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';
import '../modal/product_modal.dart';
import '../services/custom_circular_image.dart';
import 'Category_2_page.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController search = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  bool isChecked = false;
  bool isChecked2 = false;

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
                    borderRadius: BorderRadius.circular(25)),
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
        padding: EdgeInsets.symmetric(horizontal: size_width * 0.045),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size_height * 0.02,
              ),
              Text(
                "Category List",
                style: MyStyle.black70030,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: size_width / 1.31,
                    child: CustomTextField(
                      controller: search,
                      myheight: size_height * 0.06,
                      hintText: 'Enter part number or name',
                      bgColor: MyColors.white,
                      preffix: Icon(Icons.search),
                      hintcolor: MyColors.lightblack.withOpacity(0.45),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: MyColors.lightgrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                          ),
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size_width * 0.04,
                                    vertical: size_height * 0.03),
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 5,
                                  alignment: WrapAlignment.start,
                                  children: [
                                    Text(
                                      "Availability",
                                      style: MyStyle.black60016,
                                    ),
                                    SizedBox(height: size_height * 0.02),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: size_height * 0.02,
                                          width: size_width * 0.06,
                                          child: Transform.scale(
                                            scale: 1.2,
                                            child: Theme(
                                              child: Checkbox(
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (Set<MaterialState> states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .selected)) {
                                                      return const BorderSide(
                                                          width: 1,
                                                          color:
                                                              MyColors.black);
                                                    }
                                                    return const BorderSide(
                                                        width: 1,
                                                        color: MyColors.black);
                                                  },
                                                ),
                                                checkColor: MyColors.black,
                                                activeColor:
                                                    MyColors.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                value: isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },
                                              ),
                                              data: ThemeData(
                                                unselectedWidgetColor: MyColors
                                                    .black, // Your color
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size_width * 0.02,
                                        ),
                                        Text(
                                          'In stock(692)',
                                          style: MyStyle.black50015,
                                        ),
                                        Spacer(),
                                        Text(
                                          '(692)',
                                          style: MyStyle.black60015,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: size_height * 0.02,
                                          width: size_width * 0.06,
                                          child: Transform.scale(
                                            scale: 1.2,
                                            child: Theme(
                                              child: Checkbox(
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (Set<MaterialState> states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .selected)) {
                                                      return const BorderSide(
                                                          width: 1,
                                                          color:
                                                              MyColors.black);
                                                    }
                                                    return const BorderSide(
                                                        width: 1,
                                                        color: MyColors.black);
                                                  },
                                                ),
                                                checkColor: MyColors.black,
                                                activeColor:
                                                    MyColors.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                value: isChecked2,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked2 = value!;
                                                  });
                                                },
                                              ),
                                              data: ThemeData(
                                                unselectedWidgetColor: MyColors
                                                    .black, // Your color
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size_width * 0.02,
                                        ),
                                        Text(
                                          'Out of stock(304)',
                                          style: MyStyle.black50015,
                                        ),
                                        Spacer(),
                                        Text(
                                          '(304)',
                                          style: MyStyle.black60015,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size_height * 0.025),
                                    Text(
                                      "Price",
                                      style: MyStyle.black60016,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size_width / 2.5,
                                          child: CustomTextField(
                                            controller: from,
                                            hintText: '\$ From',
                                            bgColor: MyColors.white,
                                            contentBottomPadding: 5,
                                            hintcolor: MyColors.lightblack
                                                .withOpacity(0.45),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size_width / 2.5,
                                          child: CustomTextField(
                                            controller: to,
                                            hintText: '\$ To',
                                            bgColor: MyColors.white,
                                            contentBottomPadding: 5,
                                            hintcolor: MyColors.lightblack
                                                .withOpacity(0.45),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size_height * 0.015),
                                    RoundEdgedButton(
                                      text: 'Apply',
                                      fontSize: 20,
                                      height: size_height * 0.07,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(height: size_height * 0.015),
                                    Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                                fontFamily: 'nunito',
                                                decoration:
                                                    TextDecoration.underline),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            });
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Image.asset(
                          MyImages.filter,
                          height: size_height * 0.04,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size_height * 0.02,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productsByName.keys.toList().length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        box('${productsByName.keys.toList()[index]}'),
                        SizedBox(
                          height: size_height * 0.02,
                        ),
                      ],
                    );
                  },
                ),
              ),
              // box(
              //   'Nose Cut',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'Heater',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'Hood Damper',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'Suspension Damper',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'Longitudinal beam under the internal\ncombustion engine',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'Bumper',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'Expansion tank',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'Washer reservoir',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'ABS block',
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // box(
              //   'Immobilizer block',
              // ),
              SizedBox(
                height: size_height * 0.02,
              ),
            ]),
      ),
    );
  }

  Widget box(String label, {List<ProductModal> products = const []}) {
    return GestureDetector(
      onTap: () {
        push(context: context, screen: Category_2_page(categoryNameKey: label,));
      },
      child: Container(
        height: size_height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: MyColors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size_width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: "poppins",
                    color: MyColors.black),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
