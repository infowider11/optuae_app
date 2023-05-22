import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/Widget/showSnackbar.dart';
import 'package:optuae/constants/colors.dart';
import 'package:optuae/constants/global_data.dart';
import 'package:optuae/constants/images_url.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Screens/Cart.dart';
import 'package:optuae/Widget/round_edged_button.dart';
import 'package:optuae/modal/product_modal.dart';
import '../constants/Textstyles.dart';
import '../Widget/appbar.dart';
import '../Widget/custom_text_field.dart';
import 'Checkout.dart';

class Category_detail_page extends StatelessWidget {
  final ProductModal productDetails;
  const Category_detail_page({Key? key, required this.productDetails}) : super(key: key);

  // List car = [
  //   {"img": MyImages.carDetail1},
  //   {"img": MyImages.carDetail2},
  //   {"img": MyImages.carDetail3},
  //   {"img": MyImages.carDetail4},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(
        context: context,
        title: "Product Details",
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
                Text(
                  '${productDetails.name} ${productDetails.brand} ${productDetails.model}',
                  // "Nose cut BMW 1-Series F20",
                  style: MyStyle.black70022,
                ),
                SizedBox(
                  height: size_height * 0.01,
                ),
                Container(
                  width: size_width,
                  height: size_height / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(productDetails.images[0]), fit: BoxFit.cover)),
                ),
                SizedBox(height: size_height * 0.01,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for(int i=0; i<productDetails.images.length; i++)
                      Padding(
                        padding:  EdgeInsets.only(right: size_width*0.02),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(productDetails.images[i], height: size_height*0.05,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size_height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // '\$2,868',
                      '\$${productDetails.price}',
                      style: MyStyle.black70020,
                    ),
                    RoundEdgedButton(
                      // text: 'In stock'.toUpperCase(),
                      text: '${productDetails.stockStatus}'.toUpperCase(),
                      width: 90,
                      verticalPadding: 2,
                      fontSize: 8,
                      borderRadius: 2,
                      color: MyColors.black,
                      border_color: MyColors.black,
                      textColor: MyColors.white,
                    )
                  ],
                ),
                SizedBox(height: size_height * 0.02,),
                // Material(
                //   borderRadius: BorderRadius.circular(10),
                //   elevation: 3,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                //     child: Row(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: MyColors.black
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Image.asset(MyImages.Vector, height: size_height*0.025,),
                //           ),
                //         ),
                //         SizedBox(width: size_width*0.02,),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text('In stock in the ${productDetails.manufacturer}', style: MyStyle.black60013,),
                //             // Text('In stock in the UAE warehouse', style: MyStyle.black60013,),
                //             SizedBox(height: size_height*0.005),
                //             RoundEdgedButton(
                //               text: 'Контрактная',
                //               fontSize: 9,
                //               width: size_width*0.2,
                //               fontfamily: 'poppins',
                //               borderRadius: 30,
                //             )
                //           ],
                //         ),
                //
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: size_height * 0.02,),
                // Material(
                //   borderRadius: BorderRadius.circular(10),
                //   elevation: 3,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                //     child: Row(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: MyColors.black
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Image.asset(MyImages.call, height: size_height*0.025, width: size_width*0.05,),
                //           ),
                //         ),
                //         SizedBox(width: size_width*0.02,),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text('+ 97 156 247-29-06', style: MyStyle.black60013,),
                //             SizedBox(height: size_height*0.005,),
                //             RoundEdgedButton(
                //               text: 'Call now',
                //               fontSize: 9,
                //               width: size_width*0.16,
                //               fontfamily: 'poppins',
                //               borderRadius: 30,
                //             )
                //           ],
                //         ),
                //
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: size_height * 0.02,),
                if(productDetails.comment!='')
                Text("Comment from seller", style: MyStyle.black60016,),
                if(productDetails.comment!='')
                SizedBox(height: size_height * 0.005),
                if(productDetails.comment!='')
                Text("${productDetails.comment}", style: MyStyle.lb40016,),
                SizedBox(height: size_height * 0.02,),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.white
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size_width*0.03, vertical: size_height*0.015),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Product ID", style: MyStyle.black60015,),
                              Text("${productDetails.id}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Brand", style: MyStyle.black60015,),
                              Text("${productDetails.brand}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Model", style: MyStyle.black60015,),
                              Text("${productDetails.model}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Body", style: MyStyle.black60015,),
                              Text("${productDetails.body}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Manufacturer", style: MyStyle.black60015,),
                              Text("${productDetails.manufacturer}", style: MyStyle.lb40015,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size_height * 0.02,),

              ]),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          showSnackbar('Coming soon');
          push(context: context, screen: Cart(isbottombar: true,));
        },
        child: Container(
          height: size_height*0.07,
          alignment: Alignment.center,
          color: MyColors.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(MyImages.bag, height: size_height*0.03,),
              SizedBox(width: size_width*0.02),
              Text('Add To Cart', style: MyStyle.black60020,)
            ],
          ),
        ),
      ),
    );
  }
}
