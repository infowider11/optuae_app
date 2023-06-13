import 'package:carousel_slider/carousel_slider.dart';
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
import '../Widget/imageZoom.dart';
import '../constants/Textstyles.dart';
import '../Widget/appbar.dart';
import '../Widget/custom_text_field.dart';
import '../modal/cart_modal.dart';
import '../services/cart_manage.dart';
import 'Checkout.dart';

class Category_detail_page extends StatefulWidget {
  final ProductModal productDetails;
  const Category_detail_page({Key? key, required this.productDetails}) : super(key: key);

  @override
  State<Category_detail_page> createState() => _Category_detail_pageState();
}

class _Category_detail_pageState extends State<Category_detail_page> {
  final CarouselController carouselcontroller = CarouselController();

  // List car = [
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
                  '${widget.productDetails.name} ${widget.productDetails.brand} ${widget.productDetails.model}',
                  // "Nose cut BMW 1-Series F20",
                  style: MyStyle.black70022,
                ),
                SizedBox(
                  height: size_height * 0.01,
                ),

                CarouselSlider(
                   carouselController: carouselcontroller,
                  options: CarouselOptions(
                      height: size_height / 5,
                      initialPage: 0,
                      // aspectRatio: ,
                      pageSnapping: false,
                      autoPlay: true,
                    // aspectRatio: 1/1,
                  ),
                  items: widget.productDetails.images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: (){
                            push(context: context, screen: ImageZoomerScreen(imageUrl: i,));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(i), fit: BoxFit.cover),
                              ),
                              child: null,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                // Container(
                //   width: size_width,
                //   height: size_height / 5,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       image: DecorationImage(
                //           image: NetworkImage(productDetails.images[0]), fit: BoxFit.cover)),
                // ),
                SizedBox(height: size_height * 0.01,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for(int i=0; i<widget.productDetails.images.length; i++)
                      InkWell(
                        onTap: (){
                          carouselcontroller.jumpToPage(i);
                          // push(context: context, screen: ImageZoomerScreen(imageUrl: widget.productDetails.images[i],));
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(right: size_width*0.02),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(widget.productDetails.images[i], height: size_height*0.05,),
                          ),
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
                      '\$${widget.productDetails.price}',
                      style: MyStyle.black70020,
                    ),
                    RoundEdgedButton(
                      // text: 'In stock'.toUpperCase(),
                      text: '${widget.productDetails.stockStatus}'.toUpperCase(),
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
                if(widget.productDetails.comment!='')
                Text("Comment from seller", style: MyStyle.black60016,),
                if(widget.productDetails.comment!='')
                SizedBox(height: size_height * 0.005),
                if(widget.productDetails.comment!='')
                Text("${widget.productDetails.comment}", style: MyStyle.lb40016,),
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
                              Text("${widget.productDetails.id}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Part Number", style: MyStyle.black60015,),
                              Text("${widget.productDetails.partNumber}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Brand", style: MyStyle.black60015,),
                              Text("${widget.productDetails.brand}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Model", style: MyStyle.black60015,),
                              Text("${widget.productDetails.model}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Body", style: MyStyle.black60015,),
                              Text("${widget.productDetails.body}", style: MyStyle.lb40015,),
                            ],
                          ),
                          SizedBox(height: size_height * 0.005),
                          Container(height: size_height*0.001, width: size_width, color: MyColors.black.withOpacity(0.15),),
                          SizedBox(height: size_height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Manufacturer", style: MyStyle.black60015,),
                              Text("${widget.productDetails.manufacturer}", style: MyStyle.lb40015,),
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
      bottomNavigationBar:widget.productDetails.stockStatus=='В наличии'?
          GestureDetector(
        onTap: ()async{
          print('product item   ${widget.productDetails}');
           Cartmanage.addItem(CartItem(
             color: widget.productDetails.color,
             body: widget.productDetails.body,
             brand: widget.productDetails.brand,
             comment: widget.productDetails.comment,
             engine: widget.productDetails.engine,
             frontRear: widget.productDetails.frontRear,
             images: widget.productDetails.images,
             lionRight: widget.productDetails.lionRight,
             manufacturer: widget.productDetails.manufacturer,
             model: widget.productDetails.model,
             newUsed: widget.productDetails.newUsed,
             partNumber: widget.productDetails.partNumber,
             stockStatus: widget.productDetails.stockStatus,
             topBottom: widget.productDetails.topBottom,
             year: widget.productDetails.year,
             id:widget.productDetails.id,
             name:widget.productDetails.name,
             price:double.parse(widget.productDetails.price.toString()),
             photo:widget.productDetails.images.length==0?widget.productDetails.photo:widget.productDetails.images[0],
             qty:1,
           ));
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
      )
          :Container(
        height: size_height*0.07,
        alignment: Alignment.center,
        color: MyColors.greyText,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MyImages.bag, height: size_height*0.03,),
            SizedBox(width: size_width*0.02),
            Text('Sold Out', style: MyStyle.black60020,)
          ],
        ),
      ),
    );
  }
}
