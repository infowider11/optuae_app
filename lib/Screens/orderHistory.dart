import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/constants/colors.dart';
import 'package:optuae/constants/global_data.dart';
import '../constants/Textstyles.dart';
import '../constants/images_url.dart';
import '../Widget/appbar.dart';

class orderHistory extends StatefulWidget {
  const orderHistory({Key? key}) : super(key: key);

  @override
  State<orderHistory> createState() => _orderHistoryState();
}

class _orderHistoryState extends State<orderHistory> {

 List alllist = [
   {"img": MyImages.carDetail1, 'status': 'Pending'},
   {"img": MyImages.carDetail2, 'status': 'Delivered'},
   {"img": MyImages.carDetail3, 'status': 'Pending'},
   {"img": MyImages.carDetail4, 'status': 'Cancelled'},
 ];

 List pendinglist = [
   {"img": MyImages.carDetail1, 'status': 'Pending'},
   {"img": MyImages.carDetail2, 'status': 'Pending'},
   {"img": MyImages.carDetail3, 'status': 'Pending'},
 ];

 List Shippedlist = [
   {"img": MyImages.carDetail1, 'status': 'Delivered'},
   {"img": MyImages.carDetail2, 'status': 'Delivered'},
 ];

 List Cancelledlist = [
   {"img": MyImages.carDetail1, 'status': 'Cancelled'},
   {"img": MyImages.carDetail2, 'status': 'Cancelled'},
   {"img": MyImages.carDetail4, 'status': 'Cancelled'},
 ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(
        context: context,
        title: "Order History",
        titleStyle: MyStyle.black50016,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size_width*0.045),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          SizedBox(height: size_height*0.01),
          DefaultTabController(
              length: 4, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[

                ///buttons
                Container(
                  child: ButtonsTabBar(
                    backgroundColor: MyColors.primaryColor,
                    unselectedBackgroundColor:  MyColors.white,
                    duration: 0,
                    borderColor: MyColors.primaryColor,
                    unselectedBorderColor:  MyColors.black,
                    borderWidth: 0,
                    labelStyle: TextStyle(fontSize: 14, fontFamily: "nunito", fontWeight: FontWeight.w700, color: MyColors.black),
                    unselectedLabelStyle: TextStyle(fontSize: 14, fontFamily: "nunito", fontWeight: FontWeight.w700, color: MyColors.black),
                    contentPadding: const EdgeInsets.only(left: 18,right: 18,top: 8,bottom: 8),
                    radius: 8,
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Pending'),
                      Tab(text: 'Shipped'),
                      Tab(text: 'Cancelled'),
                    ],
                  ),
                ),

                ///view
                Container(
                    height: size_height/1.2,

                    child: TabBarView(children: <Widget>[
                      allOrder(),
                      pendingOrder(),
                      shippedOrder(),
                      CancelledOrder(),
                      
                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }

  Widget allOrder(){
    return Column(
      children: [
        SizedBox(height: size_height*0.02,),

        for(int index=0; index<alllist.length; index++)
          Padding(
            padding: EdgeInsets.only(bottom: size_height*0.02),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(alllist[index]['img'], height: size_height*0.065),
                    ),
                    SizedBox(width: size_width*0.02,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nose cut BMW 1-Series F20', style: MyStyle.black50015,),
                        SizedBox(height: size_height*0.005,),
                        Text('\$2,868', style: MyStyle.black70018,),
                        SizedBox(height: size_height*0.005,),
                        Text('#CHH12345PLJ', style: MyStyle.lb40013,),

                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:
                          alllist[index]['status'] == 'Pending' ? MyColors.orange :
                          alllist[index]['status'] == 'Delivered' ? MyColors.green :
                          alllist[index]['status'] == 'Cancelled' ? MyColors.red :
                          MyColors.orange
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                        child:Text(alllist[index]['status'], style: MyStyle.white70012,)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

 Widget pendingOrder(){
   return Column(
     children: [
       SizedBox(height: size_height*0.02,),

       for(int index=0; index<pendinglist.length; index++)
         Padding(
           padding: EdgeInsets.only(bottom: size_height*0.02),
           child: Material(
             borderRadius: BorderRadius.circular(10),
             elevation: 3,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
               child: Row(
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(10),
                     child: Image.asset(pendinglist[index]['img'], height: size_height*0.065),
                   ),
                   SizedBox(width: size_width*0.02,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Nose cut BMW 1-Series F20', style: MyStyle.black50015,),
                       SizedBox(height: size_height*0.005,),
                       Text('\$2,868', style: MyStyle.black70018,),
                       SizedBox(height: size_height*0.005,),
                       Text('#CHH12345PLJ', style: MyStyle.lb40013,),

                     ],
                   ),
                   Spacer(),
                   Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color:
                         MyColors.orange
                     ),
                     child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                         child:Text(pendinglist[index]['status'], style: MyStyle.white70012,)
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
     ],
   );
 }

 Widget shippedOrder(){
   return Column(
     children: [
       SizedBox(height: size_height*0.02,),

       for(int index=0; index<Shippedlist.length; index++)
         Padding(
           padding: EdgeInsets.only(bottom: size_height*0.02),
           child: Material(
             borderRadius: BorderRadius.circular(10),
             elevation: 3,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
               child: Row(
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(10),
                     child: Image.asset(Shippedlist[index]['img'], height: size_height*0.065),
                   ),
                   SizedBox(width: size_width*0.02,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Nose cut BMW 1-Series F20', style: MyStyle.black50015,),
                       SizedBox(height: size_height*0.005,),
                       Text('\$2,868', style: MyStyle.black70018,),
                       SizedBox(height: size_height*0.005,),
                       Text('#CHH12345PLJ', style: MyStyle.lb40013,),

                     ],
                   ),
                   Spacer(),
                   Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color:
                         MyColors.green
                     ),
                     child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                         child:Text(Shippedlist[index]['status'], style: MyStyle.white70012,)
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
     ],
   );
 }

 Widget CancelledOrder(){
   return Column(
     children: [
       SizedBox(height: size_height*0.02,),

       for(int index=0; index<Cancelledlist.length; index++)
         Padding(
           padding: EdgeInsets.only(bottom: size_height*0.02),
           child: Material(
             borderRadius: BorderRadius.circular(10),
             elevation: 3,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
               child: Row(
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(10),
                     child: Image.asset(Cancelledlist[index]['img'], height: size_height*0.065),
                   ),
                   SizedBox(width: size_width*0.02,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Nose cut BMW 1-Series F20', style: MyStyle.black50015,),
                       SizedBox(height: size_height*0.005,),
                       Text('\$2,868', style: MyStyle.black70018,),
                       SizedBox(height: size_height*0.005,),
                       Text('#CHH12345PLJ', style: MyStyle.lb40013,),

                     ],
                   ),
                   Spacer(),
                   Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color: MyColors.red
                     ),
                     child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                         child:Text(Cancelledlist[index]['status'], style: MyStyle.white70012,)
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
     ],
   );
 }

}
