import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:optuae/constants/colors.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Screens/Category_2_page.dart';
import 'package:optuae/Screens/Category_detail_page.dart';
import 'package:optuae/Widget/round_edged_button.dart';
import 'package:optuae/services/custom_circular_image.dart';

import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../Widget/custom_text_field.dart';
import '../constants/images_url.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  bool isChecked = false;
  bool isChecked2 = false;
  List car = [
    {
      "img": MyImages.homecar1,
      "title": "Nose cut BMW...",
      "subtitle": "Mercedes-Benz C-Class 2011-2014 W204",
      "price": "\$35.00"
    },
    {
      "img": MyImages.homecar2,
      "title": "Nose cut BMW...",
      "subtitle": "Mercedes-Benz C-Class 2011-2014 W204",
      "price": "\$35.00"
    },
  ];

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size_width * 0.045),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size_height * 0.02,
                ),
                Text(
                  "Discover our store",
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
                                                    (Set<MaterialState>
                                                        states) {
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
                                                          color:
                                                              MyColors.black);
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
                                                  unselectedWidgetColor:
                                                      MyColors
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
                                                    (Set<MaterialState>
                                                        states) {
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
                                                          color:
                                                              MyColors.black);
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
                                                  unselectedWidgetColor:
                                                      MyColors
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
                Container(
                  width: size_width,
                  height: size_height / 4.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(MyImages.home1),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size_width * 0.05, top: size_height * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "We have the\nParts",
                          style: MyStyle.white70026,
                        ),
                        SizedBox(
                          height: size_height * 0.01,
                        ),
                        RoundEdgedButton(
                          text: 'Order Now',
                          fontSize: 10,
                          width: size_width * 0.18,
                          borderRadius: 5,
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size_height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nose cut',
                      style: MyStyle.black60018,
                    ),
                    InkWell(
                        onTap: () {
                          push(context: context, screen: Category_2_page());
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w400,
                              color: MyColors.lightblack,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                SizedBox(
                  height: size_height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        push(context: context, screen: Category_detail_page());
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: size_width / 2.3,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size_height * 0.15,
                                    width: size_width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: AssetImage(car[0]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      right: 5,
                                      child: RoundEdgedButton(
                                        text: 'Контрактная',
                                        height: size_height * 0.02,
                                        fontSize: 9,
                                        width: size_width / 5,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size_width * 0.02,
                                    vertical: size_height * 0.01),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width / 2.5,
                                            child: Text(
                                              car[0]['title'],
                                              style: MyStyle.black60013,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_height * 0.005,
                                    ),
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width / 2.5,
                                            child: Text(
                                              car[0]['subtitle'],
                                              style: MyStyle.lb40009,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_height * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          car[0]['price'],
                                          style: MyStyle.black60016,
                                        ),
                                        RoundEdgedButton(
                                          text: 'In stock'.toUpperCase(),
                                          width: size_width * 0.14,
                                          verticalPadding: 2,
                                          fontSize: 8,
                                          borderRadius: 2,
                                          color: MyColors.black,
                                          border_color: MyColors.black,
                                          textColor: MyColors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        push(context: context, screen: Category_detail_page());
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: size_width / 2.3,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size_height * 0.15,
                                    width: size_width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: AssetImage(car[1]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      right: 5,
                                      child: RoundEdgedButton(
                                        text: 'Контрактная',
                                        height: size_height * 0.02,
                                        fontSize: 9,
                                        width: size_width / 5,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size_width * 0.02,
                                    vertical: size_height * 0.01),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width / 2.5,
                                            child: Text(
                                              car[1]['title'],
                                              style: MyStyle.black60013,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_height * 0.005,
                                    ),
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width / 2.5,
                                            child: Text(
                                              car[1]['subtitle'],
                                              style: MyStyle.lb40009,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_height * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          car[1]['price'],
                                          style: MyStyle.black60016,
                                        ),
                                        RoundEdgedButton(
                                          text: 'In stock'.toUpperCase(),
                                          width: size_width * 0.14,
                                          verticalPadding: 2,
                                          fontSize: 8,
                                          borderRadius: 2,
                                          color: MyColors.black,
                                          border_color: MyColors.black,
                                          textColor: MyColors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size_height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nose cut',
                      style: MyStyle.black60018,
                    ),
                    InkWell(
                        onTap: () {
                          push(context: context, screen: Category_2_page());
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w400,
                              color: MyColors.lightblack,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                SizedBox(
                  height: size_height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        push(context: context, screen: Category_detail_page());
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: size_width / 2.3,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size_height * 0.15,
                                    width: size_width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: AssetImage(car[1]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      right: 5,
                                      child: RoundEdgedButton(
                                        text: 'Контрактная',
                                        height: size_height * 0.02,
                                        fontSize: 9,
                                        width: size_width / 5,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size_width * 0.02,
                                    vertical: size_height * 0.01),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width / 2.5,
                                            child: Text(
                                              car[1]['title'],
                                              style: MyStyle.black60013,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_height * 0.005,
                                    ),
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width / 2.5,
                                            child: Text(
                                              car[1]['subtitle'],
                                              style: MyStyle.lb40009,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_height * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          car[1]['price'],
                                          style: MyStyle.black60016,
                                        ),
                                        RoundEdgedButton(
                                          text: 'In stock'.toUpperCase(),
                                          width: size_width * 0.14,
                                          verticalPadding: 2,
                                          fontSize: 8,
                                          borderRadius: 2,
                                          color: MyColors.black,
                                          border_color: MyColors.black,
                                          textColor: MyColors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        push(context: context, screen: Category_detail_page());
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: size_width / 2.3,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size_height * 0.15,
                                    width: size_width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: AssetImage(car[0]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      right: 5,
                                      child: RoundEdgedButton(
                                        text: 'Контрактная',
                                        height: size_height * 0.02,
                                        fontSize: 9,
                                        width: size_width / 5,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size_width * 0.02,
                                    vertical: size_height * 0.01),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width / 2.5,
                                            child: Text(
                                              car[0]['title'],
                                              style: MyStyle.black60013,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_height * 0.005,
                                    ),
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width / 2.5,
                                            child: Text(
                                              car[0]['subtitle'],
                                              style: MyStyle.lb40009,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_height * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          car[0]['price'],
                                          style: MyStyle.black60016,
                                        ),
                                        RoundEdgedButton(
                                          text: 'In stock'.toUpperCase(),
                                          width: size_width * 0.14,
                                          verticalPadding: 2,
                                          fontSize: 8,
                                          borderRadius: 2,
                                          color: MyColors.black,
                                          border_color: MyColors.black,
                                          textColor: MyColors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size_height * 0.02,
                ),
              ]),
        ),
      ),
    );
  }
}
