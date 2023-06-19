import 'package:flutter/material.dart';
import 'package:optuae/Widget/round_edged_button.dart';
import 'package:optuae/modal/product_modal.dart';

import '../Constants/Textstyles.dart';
import '../Constants/colors.dart';
import '../Functions/navigation_functions.dart';
import '../Screens/Category_detail_page.dart';
import '../constants/global_data.dart';
class ProductCard extends StatelessWidget {
  final ProductModal productDetails;
  const ProductCard({Key? key, required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: size_height/4.1,
      // margin: EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          push(context: context, screen: Category_detail_page(productDetails: productDetails,));
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
                              image: NetworkImage(productDetails.images[0]),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 5,
                        child: RoundEdgedButton(
                          text: '${productDetails.name}',
                          height: size_height * 0.02,
                          fontSize: 9,
                          width: 90,
                          // width: size_width / 5,
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
                                '${productDetails.name} ${productDetails.brand} ${productDetails.model}',
                                style: MyStyle.black60013,
                                overflow: TextOverflow.ellipsis,
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
                                '${productDetails.brand} ${productDetails.model} ${productDetails.stockStatus} ${productDetails.year}',
                                style: MyStyle.lb40009,
                                overflow: TextOverflow.ellipsis,
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
                            '\$${productDetails.price}',
                            style: MyStyle.black60016,
                          ),
                          RoundEdgedButton(
                            text: '${productDetails.stockStatus}'.toUpperCase(),
                            // text: 'In stock'.toUpperCase(),
                            width: 90,
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
    );
  }
}
