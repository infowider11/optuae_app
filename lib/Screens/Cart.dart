import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Widget/appbar.dart';
import 'package:optuae/Widget/round_edged_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/notiUnread.dart';
import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../modal/cart_modal.dart';
import '../services/cart_manage.dart';
import '../services/custom_circular_image.dart';
import 'Checkout.dart';
import 'NeedDelivery.dart';
import 'notification.dart';

class Cart extends StatefulWidget {
  bool isbottombar=false;
  Cart({Key? key, required this.isbottombar}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List car = [
    {"img": MyImages.carDetail1},
    {"img": MyImages.carDetail2},
    {"img": MyImages.carDetail4},
  ];
  List<CartItem> carts = [];

  @override
  void initState() {
    // TODO: implement initState
    Cartmanage.loadCartItems();
    load_cart();
    super.initState();
  }

  load_cart() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getStringList(cartKey);
    print('cart item ===== ${cartData}');
    if(cartData!=null){
      carts = cartData.map((item) => CartItem.fromJson(jsonDecode(item) as Map<String, dynamic>)).toList().cast<CartItem>();
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar:
      widget.isbottombar == false?
      AppBar(
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
          InkWell(
            onTap: () {
              push(context: context, screen: notification());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 15, bottom: 15),
              child: Stack(
                children: [
                  Image.asset(MyImages.bell),
                  Positioned(
                    child: notiunreadCircle(),
                  ),
                ],
              ),
            ),
          )
        ],
      )
      : appBar(context: context, title: 'My Cart', titleStyle: MyStyle.black50016,),
      body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:size_width*0.045),
          child: Column(
              mainAxisSize:MainAxisSize.min,
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                SizedBox(height: size_height*0.02),
                widget.isbottombar == false?
                Text("My Cart" , style: MyStyle.black70030,): Container(),
                SizedBox(height: size_height*0.01),
                     // for(int index=0; index<car.length; index++)
                    if(carts.length>0)
                       Container(
                         height: !widget.isbottombar?390:500,
                         child: ListView.builder(
                           itemCount: carts.length,
                           itemBuilder:(context,index){
                             return Dismissible(
                               behavior: HitTestBehavior.translucent,
                               key: Key(carts[index].id),
                               direction: DismissDirection.endToStart,
                               onDismissed: (direction) {
                                 setState(() {
                                   Cartmanage.removeItem(carts[index].id);
                                   carts.removeAt(index);
                                 });
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                     content: Text('Item removed'),
                                     duration: Duration(seconds: 2),
                                   ),
                                 );
                               },
                               background: Container(
                                 decoration: BoxDecoration(
                                   color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                 ),
                                 margin: EdgeInsets.all(0),
                                 alignment: Alignment.center,
                                 padding: EdgeInsets.only(right: 0.0),
                                 child: Icon(
                                   Icons.delete,
                                   color: Colors.white,
                                 ),
                               ),
                               child: Padding(
                                 padding: EdgeInsets.only(bottom: size_height*0.001),
                                 child: Material(
                                   borderRadius: BorderRadius.circular(10),
                                   elevation: 3,
                                   child: Padding(
                                     padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                                     child: Row(
                                       children: [
                                         ClipRRect(
                                           borderRadius: BorderRadius.circular(10),
                                           child:CustomCircularImage(
                                             imageUrl: carts[index].photo,
                                             fileType: CustomFileType.network,
                                             fit: BoxFit.cover,
                                           )
                                           //Image.asset(, height: size_height*0.065),
                                         ),
                                         SizedBox(width: size_width*0.02,),
                                         Expanded(
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text('${carts[index].name}', style: MyStyle.black50015,),
                                               SizedBox(height: size_height*0.005,),
                                               Text('\$${carts[index].price}', style: MyStyle.black70018,),

                                             ],
                                           ),
                                         ),
                                         Spacer(),
                                         Container(
                                           height: 40,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(5),
                                               color: MyColors.primaryColor
                                           ),
                                           child: Padding(
                                             padding: EdgeInsets.symmetric(horizontal: size_width*0.02),
                                             child: Row(
                                               children: [
                                                 // Text('-', style: MyStyle.black60020,),
                                                 IconButton(
                                                     onPressed:() {
                                                      if(carts[index].qty>1){
                                                        carts[index].qty--;
                                                        setState(() {

                                                        });
                                                        Cartmanage.updateQuantity(carts[index].id,carts[index].qty);
                                                      } else {
                                                        Cartmanage.removeItem(carts[index].id);
                                                        carts.removeAt(index);
                                                        setState(() {

                                                        });
                                                      }
                                                     },
                                                     icon: Icon(
                                                       Icons.remove
                                                     ),
                                                 ),
                                                 // SizedBox(width: size_width*0.01,),
                                                 Text('${carts[index].qty}', style: MyStyle.black60015,),
                                                 IconButton(
                                                   onPressed:() {
                                                     carts[index].qty++;
                                                     setState(() {

                                                     });
                                                     Cartmanage.updateQuantity(carts[index].id,carts[index].qty);
                                                   },
                                                   icon: Icon(
                                                       Icons.add
                                                   ),

                                                 ),


                                               ],
                                             ),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             );
                           },
                         ),
                       ),
                      if(carts.length==0)
                        Center(
                          child: Text('No cart item.'),
                        ),
                if(carts.length>0)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                Text("Item Count", style: MyStyle.black50015,),
                                Text("${carts.length}", style: MyStyle.black50015,),
                              ],
                            ),
                            SizedBox(height: size_height*0.005),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total", style: MyStyle.black70015,),
                                Text("\$${Cartmanage.totalPrice}", style: MyStyle.black70015,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ),
      ),
      bottomNavigationBar: carts.length>0?Padding(
        padding: EdgeInsets.symmetric(horizontal: size_width*0.05, vertical: size_height*0.02),
        child: RoundEdgedButton(
          text: 'Checkout',
          height: size_height*0.07,
          onTap: (){
            // push(context: context, screen: Checkout());
            push(context: context, screen: NeedDelivery());
          },
        ),
      ):null,
    );
  }
}
