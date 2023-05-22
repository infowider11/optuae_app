import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/Widget/CustomTexts.dart';
import 'package:optuae/constants/colors.dart';
import 'package:optuae/constants/global_data.dart';
import 'package:optuae/constants/images_url.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Widget/Dropdown.dart';
import 'package:optuae/Widget/round_edged_button.dart';
import 'package:optuae/modal/product_modal.dart';
import 'package:optuae/services/Customloader.dart';
import '../Widget/custom_dropdown.dart';
import '../Widget/product_card.dart';
import '../constants/Textstyles.dart';
import '../Widget/appbar.dart';
import '../Widget/custom_text_field.dart';
import '../constants/sized_box.dart';
import 'Category_detail_page.dart';

class Category_2_page extends StatefulWidget {
  final String categoryNameKey;
  // final List<ProductModal> categoryName;
  const Category_2_page({Key? key, required this.categoryNameKey, required})
      : super(key: key);

  @override
  State<Category_2_page> createState() => _Category_2_pageState();
}

class _Category_2_pageState extends State<Category_2_page> {
  TextEditingController searchController = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  bool isInStock = false;
  bool isOutOfStock = false;
  List<ProductModal> categoryProducts = [];
  String? selectedValue;
  String? selectedBrand;

  ValueNotifier<bool> loadNotifier = ValueNotifier(true);

  searchOnChanged(int length) async {
    await Future.delayed(Duration(seconds: 1)).then((value) {
      if (length == searchController.text.length) {
        // var request = {
        //   'keyword': searchController.text
        // };
        // print('serc if ${request}');
        updateHomePage(searchController.text);
      }
    });
  }

  // Map<String, List<ProductModal>> tempProducts = {};

  updateHomePage(String keyword,
      {String? brand,
      bool showInstockOnly = false,
      bool showOutOfStockOnly = false}) async {
    print('Inside Update Home Page with $productsByName');
    categoryProducts.clear();
    loadNotifier.value = true;
    if (brand != null) {
      if (productsByName['${widget.categoryNameKey}'] != null) {
        for (int i = 0;
            i < productsByName['${widget.categoryNameKey}']!.length;
            i++) {
          bool otherCondition = true;
          if (showOutOfStockOnly) {
            otherCondition =
                productsByName['${widget.categoryNameKey}']![i].stockStatus !=
                    'В наличии';
          } else if (showInstockOnly) {
            otherCondition =
                productsByName['${widget.categoryNameKey}']![i].stockStatus ==
                    'В наличии';
          } else {
// otherCondition = true;
          }
          if (productsByName['${widget.categoryNameKey}']![i]
                  .name
                  .contains(keyword) &&
              productsByName['${widget.categoryNameKey}']![i].brand == brand &&
              otherCondition) {
            categoryProducts
                .add(productsByName['${widget.categoryNameKey}']![i]);
          } else {}
        }
      }
    } else {
      if (productsByName['${widget.categoryNameKey}'] != null) {
        for (int i = 0;
            i < productsByName['${widget.categoryNameKey}']!.length;
            i++) {
          bool otherCondition = true;
          if (showOutOfStockOnly) {
            otherCondition =
                productsByName['${widget.categoryNameKey}']![i].stockStatus !=
                    'В наличии';
          } else if (showInstockOnly) {
            otherCondition =
                productsByName['${widget.categoryNameKey}']![i].stockStatus ==
                    'В наличии';
          } else {
// otherCondition = true;
          }
          if (productsByName['${widget.categoryNameKey}']![i]
                  .name
                  .contains(keyword) &&
              otherCondition) {
            categoryProducts
                .add(productsByName['${widget.categoryNameKey}']![i]);
          } else {}
        }
      }
    }

    loadNotifier.value = false;
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
      appBar: appBar(
        context: context,
        title: "${widget.categoryNameKey}",
        titleStyle: MyStyle.black50016,
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
                "${widget.categoryNameKey}",
                // "Nose Cuts",
                style: MyStyle.black70030,
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
                      onChanged: (val) {
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
                                                value: isInStock,
                                                onChanged: (bool? value) {
                                                  isInStock = value!;
                                                  if (isInStock) {
                                                    isOutOfStock = false;
                                                  }
                                                  setState(() {});
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
                                                value: isOutOfStock,
                                                onChanged: (bool? value) {
                                                  isOutOfStock = value!;
                                                  if (isOutOfStock) {
                                                    isInStock = false;
                                                  }
                                                  setState(() {});
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
                                    CustomDropdownButton(
                                      items: productsByBrands.keys.toList(),
                                      hint: 'Select Brand',
                                      selectedItem: selectedBrand,
                                      onChanged: (val) {
                                        selectedBrand = val;
                                      },
                                    ),
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
                                        updateHomePage('',
                                            brand: selectedBrand,
                                            showInstockOnly: isInStock,
                                            showOutOfStockOnly: isOutOfStock);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${widget.categoryNameKey}',
                      style: MyStyle.black60018,
                    ),
                  ),
                  DropDown(
                    label: 'Sort By',
                    buttonwidth: size_width * 0.3,
                    buttonheight: size_height * 0.035,
                    isRight: false,
                    selectedValue: selectedValue,
                    items: sortByList,
                  )
                ],
              ),
              SizedBox(
                height: size_height * 0.02,
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: loadNotifier,
                    builder: (context, load, child) {
                      if (load) {
                        return CustomLoader();
                      }
                      if (categoryProducts.isEmpty) {
                        return Center(
                          child: ParagraphText('No Products Found'),
                        );
                      }
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 0,
                            childAspectRatio: 0.72),
                        itemCount: categoryProducts.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ProductCard(
                                productDetails: categoryProducts[index],
                                // products[widget.categoryNameKey]![index],
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ),

//               Expanded(
//                 child: GridView(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 5,
//                       crossAxisSpacing: 0,
//                       childAspectRatio: 0.72),
//                   //
//                   children: [
//                     for (int index = 0; index < products[widget.categoryNameKey]!.length; index++)
// Column(
//   children: [
//         ProductCard(productDetails: products[widget.categoryNameKey]![index],),
//   ],
// ),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     // push(context: context, screen: Category_detail_page());
//                       //   },
//                       //   child: Material(
//                       //     elevation: 5,
//                       //     borderRadius: BorderRadius.circular(10),
//                       //     child: Container(
//                       //       decoration: BoxDecoration(
//                       //         color: MyColors.white,
//                       //         borderRadius: BorderRadius.circular(10),
//                       //       ),
//                       //       child: Column(
//                       //         mainAxisSize: MainAxisSize.min,
//                       //         crossAxisAlignment: CrossAxisAlignment.start,
//                       //         children: [
//                       //           Stack(
//                       //             children: [
//                       //               Container(
//                       //                 height: size_height * 0.15,
//                       //                 width: size_width,
//                       //                 decoration: BoxDecoration(
//                       //                     borderRadius: BorderRadius.only(
//                       //                         topLeft: Radius.circular(10),
//                       //                         topRight: Radius.circular(10)),
//                       //                     image: DecorationImage(
//                       //                         image:
//                       //                             AssetImage(car[index]['img']),
//                       //                         fit: BoxFit.cover)),
//                       //               ),
//                       //               Positioned(
//                       //                   bottom: 10,
//                       //                   right: 5,
//                       //                   child: RoundEdgedButton(
//                       //                     text: 'Контрактная',
//                       //                     height: size_height * 0.02,
//                       //                     fontSize: 9,
//                       //                     width: size_width / 5,
//                       //                   ))
//                       //             ],
//                       //           ),
//                       //           Padding(
//                       //             padding: EdgeInsets.symmetric(
//                       //                 horizontal: size_width * 0.02,
//                       //                 vertical: size_height * 0.01),
//                       //             child: Column(
//                       //               mainAxisSize: MainAxisSize.min,
//                       //               children: [
//                       //                 Wrap(
//                       //                   children: [
//                       //                     SizedBox(
//                       //                         width: size_width / 2.5,
//                       //                         child: Text(
//                       //                           car[index]['title'],
//                       //                           style: MyStyle.black60013,
//                       //                         )),
//                       //                   ],
//                       //                 ),
//                       //                 SizedBox(
//                       //                   height: size_height * 0.005,
//                       //                 ),
//                       //                 Wrap(
//                       //                   children: [
//                       //                     SizedBox(
//                       //                         width: size_width / 2.5,
//                       //                         child: Text(
//                       //                           car[0]['subtitle'],
//                       //                           style: MyStyle.lb40009,
//                       //                         )),
//                       //                   ],
//                       //                 ),
//                       //                 SizedBox(
//                       //                   height: size_height * 0.005,
//                       //                 ),
//                       //                 Row(
//                       //                   mainAxisAlignment:
//                       //                       MainAxisAlignment.spaceBetween,
//                       //                   children: [
//                       //                     Text(
//                       //                       car[index]['price'],
//                       //                       style: MyStyle.black60016,
//                       //                     ),
//                       //                     RoundEdgedButton(
//                       //                       text: 'In stock'.toUpperCase(),
//                       //                       width: size_width * 0.14,
//                       //                       verticalPadding: 2,
//                       //                       fontSize: 8,
//                       //                       borderRadius: 2,
//                       //                       color: MyColors.black,
//                       //                       border_color: MyColors.black,
//                       //                       textColor: MyColors.white,
//                       //                     )
//                       //                   ],
//                       //                 )
//                       //               ],
//                       //             ),
//                       //           ),
//                       //         ],
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                   ],
//                 ),
//               ),
              SizedBox(
                height: size_height * 0.02,
              ),
            ]),
      ),
    );
  }
}
