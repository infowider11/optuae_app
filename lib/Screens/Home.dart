import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:optuae/constants/colors.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Screens/Category_2_page.dart';
import 'package:optuae/Screens/Category_detail_page.dart';
import 'package:optuae/Widget/CustomTexts.dart';
import 'package:optuae/Widget/custom_dropdown.dart';
import 'package:optuae/Widget/round_edged_button.dart';
import 'package:optuae/services/Customloader.dart';
import 'package:optuae/services/custom_circular_image.dart';
import 'package:windows1251/windows1251.dart';

import '../Widget/product_card.dart';
import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../Widget/custom_text_field.dart';
import '../constants/images_url.dart';
import '../constants/sized_box.dart';
import '../modal/product_modal.dart';
import '../services/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  bool isInStock = false;
  bool isOutOfStock = false;
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

  ValueNotifier<bool> loadNotifier = ValueNotifier(false);

  String? selectedBrand;


  buildData(){


    print('the ddd ${DateTime.now().millisecondsSinceEpoch}');
    List children = [];
    children.add(Container(
      margin: EdgeInsets.only(bottom: 10),
      width: size_width,
      height: size_height / 4.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(MyImages.home1),
              fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.only(
            left: size_width * 0.05, top: 20, bottom: 10),
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
    ),);
    tempProducts.forEach((key, value) {
      List productWidgets = [];
      children.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${key}',
            style: MyStyle.black60018,
          ),
          if(value.length>2)
          InkWell(
              onTap: () {
                push(context: context, screen: Category_2_page(categoryNameKey: key,));
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
      ));
      children.add(SizedBox(
        height: size_height * 0.02,
      ),);
      value.forEach((productDetails) {
        productWidgets.add(ProductCard(productDetails: productDetails,));
      });

      if(productWidgets.isEmpty){
        children.add(
            Container(
              height: 240,
              child: Center(
                child: ParagraphText('No Products Found'),
              )
            )
        );
      }else{
        children.add(
            Container(
              height: 240,
              child: ListView.builder(
                itemCount: productWidgets.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return productWidgets[index];
                },
              ),
            )
        );
      }

      children.add(SizedBox(
        height: size_height * 0.02,
      ),);

    });

    print('the ddd ${DateTime.now().millisecondsSinceEpoch}');
    return Expanded(
      child: ListView.builder(
        itemCount: children.length,
        // shrinkWrap: true,

        itemBuilder: (context, childIndex){
          return children[childIndex];
        },
      ),
    );

  }

  searchOnChanged(int length)async{
    await Future.delayed(Duration(seconds: 1)).then((value){
      if(length==searchController.text.length){
        // var request = {
        //   'keyword': searchController.text
        // };
        // print('serc if ${request}');
        updateHomePage(searchController.text);
      }
    });
  }

  Map<String, List<ProductModal>> tempProducts = {};

  updateHomePage(String keyword, {String? brand, bool showInstockOnly = false, bool showOutOfStockOnly = false})async{
    print('Inside Update Home Page with search key $keyword and brand ${brand}');
    tempProducts.clear();
    loadNotifier.value = true;
    if(brand!=null){


      productsByName.forEach((key, value) {
        value.forEach((element) {
          // log('the data is ${element.toJson()}');
          // if(element.number)
        });
        for(int i = 0;i<value.length;i++){
          bool otherCondition = true;
          if(showOutOfStockOnly){
            otherCondition = value[i].stockStatus!='В наличии';
          }else if(showInstockOnly){
            otherCondition = value[i].stockStatus=='В наличии';
          }else{
            // otherCondition = true;
          }
          if(value[i].name.contains(keyword) && value[i].brand==brand && otherCondition){
            if(tempProducts[key]==null){
              tempProducts[key]=[value[i]];
            }else{
              tempProducts[key]!.add(value[i]);
            }

            //     products['${dataList[1]}'] = [
            // ...(products['${dataList[1]}'] ?? []),
          }else{

          }
        }

      });
    }else{
      productsByName.forEach((key, value) {
        value.forEach((element) {
          // log('the data is ${element.toJson()}');
          // if(element.number)
        });
        for(int i = 0;i<value.length;i++){
          bool otherCondition = true;
          if(showOutOfStockOnly){
            otherCondition = value[i].stockStatus!='В наличии';
          }else if(showInstockOnly){
            otherCondition = value[i].stockStatus=='В наличии';
          }else{
            // otherCondition = true;
          }
          if(value[i].name.contains(keyword) && otherCondition){
            if(tempProducts[key]==null){
              tempProducts[key]=[value[i]];
            }else{
              tempProducts[key]!.add(value[i]);
            }

            //     products['${dataList[1]}'] = [
            // ...(products['${dataList[1]}'] ?? []),
          }else{

          }
        }

      });
    }


    loadNotifier.value = false;
  }


  sortData(){

  }


  @override
  void initState() {
    // TODO: implement initState
    searchOnChanged(0);
    super.initState();
  }

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
        padding: EdgeInsets.symmetric(horizontal: size_width * 0.045),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size_height * 0.02,
              ),
              GestureDetector(
                onTap: ()async{
                  print('Hello ddog');
                  // print('the data is $csvData');
                  print('the length is ${csvData.length}');
                  print('the profuc is ${tempProducts.length}');
                  // globel_timer?.cancel();

                },
                child: Text(
                  "Discover our store",
                  style: MyStyle.black70030,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: size_width / 1.31,
                    child: CustomTextField(
                      controller: searchController,
                      myheight: size_height * 0.06,
                      hintText: 'Enter part number or name',
                      bgColor: MyColors.white,
                      preffix: Icon(Icons.search),
                      onChanged: (val){
                        print(val);
                       searchOnChanged(val.length);
                      },
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
                              return Container(
                                height: 390,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size_width * 0.04,
                                    vertical: size_height * 0.03),
                                child: Column(
                                  // spacing: 10,
                                  // runSpacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // alignment: WrapAlignment.start,
                                  children: [
                                    Text(
                                      "Availability",
                                      style: MyStyle.black60016,
                                    ),
                                    vSizedBox,

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
                                                value: isInStock,
                                                onChanged: (bool? value) {

                                                    isInStock = value!;
                                                    if(isInStock){
                                                      isOutOfStock = false;
                                                    }
                                                    setState(() {
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
                                          'In stock',
                                          style: MyStyle.black50015,
                                        ),
                                        Spacer(),
                                        // Text(
                                        //   '(692)',
                                        //   style: MyStyle.black60015,
                                        // ),
                                      ],
                                    ),
                                    // vSizedBox8,
                                    vSizedBox05,
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
                                                value: isOutOfStock,
                                                onChanged: (bool? value) {

                                                    isOutOfStock = value!;
                                                    if(isOutOfStock){
                                                      isInStock = false;
                                                    }
                                                    setState(() {
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
                                          'Out of stock',
                                          style: MyStyle.black50015,
                                        ),
                                        Spacer(),
                                        // Text(
                                        //   '(304)',
                                        //   style: MyStyle.black60015,
                                        // ),
                                      ],
                                    ),
                                    vSizedBox2,
                                    Text(
                                      "Select Brand",
                                      style: MyStyle.black60016,
                                    ),
                                    // vSizedBox8,
                                    CustomDropdownButton( items: productsByBrands.keys.toList(), hint: 'Select Brand', selectedItem: selectedBrand,onChanged: (val){
                                      selectedBrand = val;
                                    },),
                                    // vSizedBox,
                                    // Text(
                                    //   "Price",
                                    //   style: MyStyle.black60016,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     SizedBox(
                                    //       width: size_width / 2.5,
                                    //       child: CustomTextField(
                                    //         controller: from,
                                    //         hintText: '\$ From',
                                    //         bgColor: MyColors.white,
                                    //         contentBottomPadding: 5,
                                    //         hintcolor: MyColors.lightblack
                                    //             .withOpacity(0.45),
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       width: size_width / 2.5,
                                    //       child: CustomTextField(
                                    //         controller: to,
                                    //         hintText: '\$ To',
                                    //         bgColor: MyColors.white,
                                    //         contentBottomPadding: 5,
                                    //         hintcolor: MyColors.lightblack
                                    //             .withOpacity(0.45),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    SizedBox(height: size_height * 0.015),
                                    RoundEdgedButton(
                                      text: 'Apply',
                                      fontSize: 20,
                                      height: size_height * 0.07,
                                      onTap: () {
                                        searchController.clear();
                                        // if(isInStock==true){
                                        //
                                        // }
                                        updateHomePage('', brand: selectedBrand, showInstockOnly: isInStock, showOutOfStockOnly: isOutOfStock);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    vSizedBox2,
                                    // SizedBox(height: size_height * 0.015),
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
              // if(products.length==0)
              // Container(
              //   width: size_width,
              //   height: size_height / 4.2,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       image: DecorationImage(
              //           image: AssetImage(MyImages.home1),
              //           fit: BoxFit.cover)),
              //   child: Padding(
              //     padding: EdgeInsets.only(
              //         left: size_width * 0.05, top: size_height * 0.03),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "We have the\nParts",
              //           style: MyStyle.white70026,
              //         ),
              //         SizedBox(
              //           height: size_height * 0.01,
              //         ),
              //         RoundEdgedButton(
              //           text: 'Order Now',
              //           fontSize: 10,
              //           width: size_width * 0.18,
              //           borderRadius: 5,
              //           onTap: () {},
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size_height * 0.02,
              ),

              ValueListenableBuilder<bool>(
                valueListenable: loadNotifier,
                builder: (context, load, child){
                  print(' i am getting reloaded with $tempProducts');
                  if(load){
                    return CustomLoader();
                  }
                  if(tempProducts.isEmpty){
                    return Center(
                      child: ParagraphText('No Products Found'),
                    );
                  }
                  return buildData();
              },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Nose cut',
              //       style: MyStyle.black60018,
              //     ),
              //     InkWell(
              //         onTap: () {
              //           push(context: context, screen: Category_2_page());
              //         },
              //         child: Text(
              //           'View All',
              //           style: TextStyle(
              //               fontSize: 13,
              //               fontFamily: "nunito",
              //               fontWeight: FontWeight.w400,
              //               color: MyColors.lightblack,
              //               decoration: TextDecoration.underline),
              //         )),
              //   ],
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         push(context: context, screen: Category_detail_page());
              //       },
              //       child: Material(
              //         elevation: 5,
              //         borderRadius: BorderRadius.circular(10),
              //         child: Container(
              //           width: size_width / 2.3,
              //           decoration: BoxDecoration(
              //             color: MyColors.white,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Stack(
              //                 children: [
              //                   Container(
              //                     height: size_height * 0.15,
              //                     width: size_width,
              //                     decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.only(
              //                             topLeft: Radius.circular(10),
              //                             topRight: Radius.circular(10)),
              //                         image: DecorationImage(
              //                             image: AssetImage(car[0]['img']),
              //                             fit: BoxFit.cover)),
              //                   ),
              //                   Positioned(
              //                       bottom: 10,
              //                       right: 5,
              //                       child: RoundEdgedButton(
              //                         text: 'Контрактная',
              //                         height: size_height * 0.02,
              //                         fontSize: 9,
              //                         width: size_width / 5,
              //                       ))
              //                 ],
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: size_width * 0.02,
              //                     vertical: size_height * 0.01),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Wrap(
              //                       children: [
              //                         SizedBox(
              //                             width: size_width / 2.5,
              //                             child: Text(
              //                               car[0]['title'],
              //                               style: MyStyle.black60013,
              //                             )),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: size_height * 0.005,
              //                     ),
              //                     Wrap(
              //                       children: [
              //                         SizedBox(
              //                             width: size_width / 2.5,
              //                             child: Text(
              //                               car[0]['subtitle'],
              //                               style: MyStyle.lb40009,
              //                             )),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: size_height * 0.005,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text(
              //                           car[0]['price'],
              //                           style: MyStyle.black60016,
              //                         ),
              //                         RoundEdgedButton(
              //                           text: 'In stock'.toUpperCase(),
              //                           width: size_width * 0.16,
              //                           verticalPadding: 2,
              //                           fontSize: 8,
              //                           borderRadius: 2,
              //                           color: MyColors.black,
              //                           border_color: MyColors.black,
              //                           textColor: MyColors.white,
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         push(context: context, screen: Category_detail_page());
              //       },
              //       child: Material(
              //         elevation: 5,
              //         borderRadius: BorderRadius.circular(10),
              //         child: Container(
              //           width: size_width / 2.3,
              //           decoration: BoxDecoration(
              //             color: MyColors.white,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Stack(
              //                 children: [
              //                   Container(
              //                     height: size_height * 0.15,
              //                     width: size_width,
              //                     decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.only(
              //                             topLeft: Radius.circular(10),
              //                             topRight: Radius.circular(10)),
              //                         image: DecorationImage(
              //                             image: AssetImage(car[1]['img']),
              //                             fit: BoxFit.cover)),
              //                   ),
              //                   Positioned(
              //                       bottom: 10,
              //                       right: 5,
              //                       child: RoundEdgedButton(
              //                         text: 'Контрактная',
              //                         height: size_height * 0.02,
              //                         fontSize: 9,
              //                         width: size_width / 5,
              //                       ))
              //                 ],
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: size_width * 0.02,
              //                     vertical: size_height * 0.01),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Wrap(
              //                       children: [
              //                         SizedBox(
              //                             width: size_width / 2.5,
              //                             child: Text(
              //                               car[1]['title'],
              //                               style: MyStyle.black60013,
              //                             )),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: size_height * 0.005,
              //                     ),
              //                     Wrap(
              //                       children: [
              //                         SizedBox(
              //                             width: size_width / 2.5,
              //                             child: Text(
              //                               car[1]['subtitle'],
              //                               style: MyStyle.lb40009,
              //                             )),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: size_height * 0.005,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text(
              //                           car[1]['price'],
              //                           style: MyStyle.black60016,
              //                         ),
              //                         RoundEdgedButton(
              //                           text: 'In stock'.toUpperCase(),
              //                           width: size_width * 0.16,
              //                           verticalPadding: 2,
              //                           fontSize: 8,
              //                           borderRadius: 2,
              //                           color: MyColors.black,
              //                           border_color: MyColors.black,
              //                           textColor: MyColors.white,
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: size_height * 0.02,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Nose cut',
              //       style: MyStyle.black60018,
              //     ),
              //     InkWell(
              //         onTap: () {
              //           push(context: context, screen: Category_2_page());
              //         },
              //         child: Text(
              //           'View All',
              //           style: TextStyle(
              //               fontSize: 13,
              //               fontFamily: "nunito",
              //               fontWeight: FontWeight.w400,
              //               color: MyColors.lightblack,
              //               decoration: TextDecoration.underline),
              //         )),
              //   ],
              // ),
              // SizedBox(
              //   height: size_height * 0.02,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         push(context: context, screen: Category_detail_page());
              //       },
              //       child: Material(
              //         elevation: 5,
              //         borderRadius: BorderRadius.circular(10),
              //         child: Container(
              //           width: size_width / 2.3,
              //           decoration: BoxDecoration(
              //             color: MyColors.white,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Stack(
              //                 children: [
              //                   Container(
              //                     height: size_height * 0.15,
              //                     width: size_width,
              //                     decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.only(
              //                             topLeft: Radius.circular(10),
              //                             topRight: Radius.circular(10)),
              //                         image: DecorationImage(
              //                             image: AssetImage(car[1]['img']),
              //                             fit: BoxFit.cover)),
              //                   ),
              //                   Positioned(
              //                       bottom: 10,
              //                       right: 5,
              //                       child: RoundEdgedButton(
              //                         text: 'Контрактная',
              //                         height: size_height * 0.02,
              //                         fontSize: 9,
              //                         width: size_width / 5,
              //                       ))
              //                 ],
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: size_width * 0.02,
              //                     vertical: size_height * 0.01),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Wrap(
              //                       children: [
              //                         SizedBox(
              //                             width: size_width / 2.5,
              //                             child: Text(
              //                               car[1]['title'],
              //                               style: MyStyle.black60013,
              //                             )),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: size_height * 0.005,
              //                     ),
              //                     Wrap(
              //                       children: [
              //                         SizedBox(
              //                             width: size_width / 2.5,
              //                             child: Text(
              //                               car[1]['subtitle'],
              //                               style: MyStyle.lb40009,
              //                             )),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: size_height * 0.005,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text(
              //                           car[1]['price'],
              //                           style: MyStyle.black60016,
              //                         ),
              //                         RoundEdgedButton(
              //                           text: 'In stock'.toUpperCase(),
              //                           width: size_width * 0.16,
              //                           verticalPadding: 2,
              //                           fontSize: 8,
              //                           borderRadius: 2,
              //                           color: MyColors.black,
              //                           border_color: MyColors.black,
              //                           textColor: MyColors.white,
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         push(context: context, screen: Category_detail_page());
              //       },
              //       child: Material(
              //         elevation: 5,
              //         borderRadius: BorderRadius.circular(10),
              //         child: Container(
              //           width: size_width / 2.3,
              //           decoration: BoxDecoration(
              //             color: MyColors.white,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Stack(
              //                 children: [
              //                   Container(
              //                     height: size_height * 0.15,
              //                     width: size_width,
              //                     decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.only(
              //                             topLeft: Radius.circular(10),
              //                             topRight: Radius.circular(10)),
              //                         image: DecorationImage(
              //                             image: AssetImage(car[0]['img']),
              //                             fit: BoxFit.cover)),
              //                   ),
              //                   Positioned(
              //                       bottom: 10,
              //                       right: 5,
              //                       child: RoundEdgedButton(
              //                         text: 'Контрактная',
              //                         height: size_height * 0.02,
              //                         fontSize: 9,
              //                         width: size_width / 5,
              //                       ))
              //                 ],
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: size_width * 0.02,
              //                     vertical: size_height * 0.01),
              //                 child: Column(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Wrap(
              //                       children: [
              //                         SizedBox(
              //                             width: size_width / 2.5,
              //                             child: Text(
              //                               car[0]['title'],
              //                               style: MyStyle.black60013,
              //                             )),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: size_height * 0.005,
              //                     ),
              //                     Wrap(
              //                       children: [
              //                         SizedBox(
              //                             width: size_width / 2.5,
              //                             child: Text(
              //                               car[0]['subtitle'],
              //                               style: MyStyle.lb40009,
              //                             )),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: size_height * 0.005,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text(
              //                           car[0]['price'],
              //                           style: MyStyle.black60016,
              //                         ),
              //                         RoundEdgedButton(
              //                           text: 'In stock'.toUpperCase(),
              //                           width: size_width * 0.16,
              //                           verticalPadding: 2,
              //                           fontSize: 8,
              //                           borderRadius: 2,
              //                           color: MyColors.black,
              //                           border_color: MyColors.black,
              //                           textColor: MyColors.white,
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: size_height * 0.02,
              ),
            ]),
      ),
    );
  }
}
