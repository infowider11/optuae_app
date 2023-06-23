import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/constants/colors.dart';
import 'package:optuae/constants/global_data.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/custom_circular_image.dart';
import 'package:optuae/services/webservices.dart';
import '../constants/Textstyles.dart';
import '../constants/images_url.dart';
import '../Widget/appbar.dart';
import '../services/Customloader.dart';
import 'orderDetail.dart';

class orderHistory extends StatefulWidget {
  const orderHistory({Key? key}) : super(key: key);

  @override
  State<orderHistory> createState() => _orderHistoryState();
}

class _orderHistoryState extends State<orderHistory> {
  List alllists = [];
  bool load = false;


 List pendinglist = [
 ];

 List Shippedlist = [
 ];

 List Cancelledlist = [
 ];

  List deliveredlist = [
  ];

  @override
  void initState() {
    // TODO: implement initState
    get_allbooking();
    super.initState();
  }

  get_allbooking() async{
    setState(() {
      load = true;
    });
    alllists = await Webservices.getList(ApiUrls.getBookinglist+userData.id.toString());
    for(int i=0;i<alllists.length;i++){
      if(alllists[i]['status'].toString()=='0'){
        pendinglist.add(alllists[i]);
      }
      if(alllists[i]['status'].toString()=='1'){
        Shippedlist.add(alllists[i]);
      }
      if(alllists[i]['status'].toString()=='2'){
        deliveredlist.add(alllists[i]);
      }
      if(alllists[i]['status'].toString()=='3'){
        Cancelledlist.add(alllists[i]);
      }
      // alllists = List.from(Shippedlist);
      setState(() {

      });
    }
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: MyColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: appBar(
        context: context,
        title: "Order History",
        titleStyle: MyStyle.black50016,
      ),
      body:load?CustomLoader():Container(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          clipBehavior: Clip.none,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            DefaultTabController(
                length:5, // length of tabs
                initialIndex:0,
                child: Column(
                  // crossAxisAlignment:CrossAxisAlignment.start,
                    children: <Widget>[
                      ///buttons
                      ButtonsTabBar(
                        backgroundColor:MyColors.primaryColor,
                        unselectedBackgroundColor:MyColors.white,
                        duration:0,
                        borderColor:MyColors.primaryColor,
                        unselectedBorderColor:MyColors.black,
                        borderWidth:0,
                        labelStyle:TextStyle(fontSize: 14, fontFamily: "nunito", fontWeight: FontWeight.w700, color: MyColors.black),
                        unselectedLabelStyle:TextStyle(fontSize: 14, fontFamily: "nunito", fontWeight: FontWeight.w700, color: MyColors.black),
                        contentPadding:const EdgeInsets.only(left: 18,right: 18,top: 8,bottom: 8),
                        radius: 8,
                        tabs: [
                          Tab(text: 'All'),
                          Tab(text: 'Pending'),
                          Tab(text: 'Shipped'),
                          Tab(text: 'Delivered'),
                          Tab(text: 'Cancelled'),
                        ],
                      ),
                      ///view
                      Container(
                          height:MediaQuery.of(context).size.height-150,// size_height/1.2,
                          child:TabBarView(
                              children:<Widget>[
                                allOrder(),
                                pendingOrder(),
                                shippedOrder(),
                                delivered(),
                                CancelledOrder(),
                              ])
                      )
                    ])
            )
          ],
        ),
      ),
    );
  }

  Widget allOrder(){
    return alllists.length>0?
    ListView.builder(
        itemCount: alllists.length,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        itemBuilder: (context,index){
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            push(context: context, screen: orderDetail(
              order_id: alllists[index]['id'].toString(),
            ));
          },
          child: Padding(
          padding: EdgeInsets.only(bottom: 5.0,),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCircularImage(
                    imageUrl: userData.profileImage!,//alllists[index]['booking_items'][0]['photo'],
                    fit: BoxFit.cover,
                    fileType: CustomFileType.network,
                  ),
                  // SizedBox(width: size_width*0.02,),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${alllists[index]['fname']} ${alllists[index]['lname']}', style: MyStyle.black50015,),
                        // SizedBox(height: size_height*0.005,),
                        Text('Total Cost: \$${alllists[index]['total_amount']}', style: MyStyle.black40013,),
                        // SizedBox(height: size_height*0.005,),
                        Text('Product: ${productnamewithid(alllists[index]['booking_items'])}'),
                        Text('Product count: ${alllists[index]['booking_items'].length}'),
                        // SizedBox(height: size_height*0.005,),
                        Text('Order Id: #${alllists[index]['display_id']??''}', style: MyStyle.lb40013,),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                        alllists[index]['status'].toString() == '0' ? MyColors.orange :
                        alllists[index]['status'].toString() == '2' ? MyColors.green :
                        alllists[index]['status'].toString() == '3' ? MyColors.red :
                        alllists[index]['status'].toString() == '1'?MyColors.primaryColor:null,
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                        child:Text(
                          alllists[index]['status'].toString() == '0' ?'Pendding':
                          alllists[index]['status'].toString() == '2' ? 'Delivered' :
                          alllists[index]['status'].toString() == '1' ? 'Shipped' :
                          alllists[index]['status'].toString() == '3'?'Cancelled':'Cancelled', style: MyStyle.white70012,)
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
        );
    }):Center(
      child: Text('No data found.'),
    );
  }

 Widget pendingOrder(){
   return pendinglist.length>0?
   ListView.builder(
       itemCount: pendinglist.length,
       padding: EdgeInsets.symmetric(vertical: 10.0),
       itemBuilder: (context,index){
         return GestureDetector(
           behavior: HitTestBehavior.translucent,
           onTap: (){
             push(context: context, screen: orderDetail(
               order_id: pendinglist[index]['id'].toString(),
             ));
           },
           child: Padding(
             padding: EdgeInsets.only(bottom: 5.0,),
             child: Material(
               borderRadius: BorderRadius.circular(10),
               elevation: 3,
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     CustomCircularImage(
                       imageUrl: userData.profileImage!,//alllists[index]['booking_items'][0]['photo'],
                       fit: BoxFit.cover,
                       fileType: CustomFileType.network,
                     ),
                     // SizedBox(width: size_width*0.02,),
                     Expanded(
                       flex: 6,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text('${pendinglist[index]['fname']} ${pendinglist[index]['lname']}', style: MyStyle.black50015,),
                           // SizedBox(height: size_height*0.005,),
                           Text('Total Cost: \$${pendinglist[index]['total_amount']}', style: MyStyle.black40013,),
                           // SizedBox(height: size_height*0.005,),
                           Text('Product: ${productnamewithid(pendinglist[index]['booking_items'])}'),
                           Text('Product count: ${pendinglist[index]['booking_items'].length}'),
                           // SizedBox(height: size_height*0.005,),
                           Text('Order Id: #${pendinglist[index]['display_id']??''}', style: MyStyle.lb40013,),

                         ],
                       ),
                     ),
                     Spacer(),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color:
                         pendinglist[index]['status'].toString() == '0' ? MyColors.orange :
                         pendinglist[index]['status'].toString() == '2' ? MyColors.green :
                         pendinglist[index]['status'].toString() == '3' ? MyColors.red :
                         pendinglist[index]['status'].toString() == '1'?MyColors.primaryColor:null,
                       ),
                       child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                           child:Text(
                             pendinglist[index]['status'].toString() == '0' ?'Pendding':
                             pendinglist[index]['status'].toString() == '2' ? 'Delivered' :
                             pendinglist[index]['status'].toString() == '1' ? 'Shipped' :
                             pendinglist[index]['status'].toString() == '3'?'Cancelled':'Cancelled', style: MyStyle.white70012,)
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
         );
       }):Center(
     child: Text('No data found.'),
   );
 }

 Widget shippedOrder(){
   return Shippedlist.length>0?
   ListView.builder(
       itemCount: Shippedlist.length,
       padding: EdgeInsets.symmetric(vertical: 10.0),
       itemBuilder: (context,index){
         return GestureDetector(
           behavior: HitTestBehavior.translucent,
           onTap: (){
             push(context: context, screen: orderDetail(
               order_id: Shippedlist[index]['id'].toString(),
             ));
           },
           child: Padding(
             padding: EdgeInsets.only(bottom: 5.0,),
             child: Material(
               borderRadius: BorderRadius.circular(10),
               elevation: 3,
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     CustomCircularImage(
                       imageUrl: userData.profileImage!,//alllists[index]['booking_items'][0]['photo'],
                       fit: BoxFit.cover,
                       fileType: CustomFileType.network,
                     ),
                     // SizedBox(width: size_width*0.02,),
                     Expanded(
                       flex: 6,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text('${Shippedlist[index]['fname']} ${Shippedlist[index]['lname']}', style: MyStyle.black50015,),
                           // SizedBox(height: size_height*0.005,),
                           Text('Total Cost: \$${Shippedlist[index]['total_amount']}', style: MyStyle.black40013,),
                           // SizedBox(height: size_height*0.005,),
                           Text('Product: ${productnamewithid(Shippedlist[index]['booking_items'])}'),
                           Text('Product count: ${Shippedlist[index]['booking_items'].length}'),
                           // SizedBox(height: size_height*0.005,),
                           Text('Order Id: #${Shippedlist[index]['display_id']??''}', style: MyStyle.lb40013,),

                         ],
                       ),
                     ),
                     Spacer(),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color:
                         Shippedlist[index]['status'].toString() == '0' ? MyColors.orange :
                         Shippedlist[index]['status'].toString() == '2' ? MyColors.green :
                         Shippedlist[index]['status'].toString() == '3' ? MyColors.red :
                         Shippedlist[index]['status'].toString() == '1'?MyColors.primaryColor:null,
                       ),
                       child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                           child:Text(
                             Shippedlist[index]['status'].toString() == '0' ?'Pendding':
                             Shippedlist[index]['status'].toString() == '2' ? 'Delivered' :
                             Shippedlist[index]['status'].toString() == '1' ? 'Shipped' :
                             Shippedlist[index]['status'].toString() == '3'?'Cancelled':'Cancelled', style: MyStyle.white70012,)
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
         );
       }):Center(
     child: Text('No data found.'),
   );
 }

 Widget CancelledOrder(){
   return Cancelledlist.length>0?
   ListView.builder(
       itemCount: Cancelledlist.length,
       padding: EdgeInsets.symmetric(vertical: 10.0),
       itemBuilder: (context,index){
         return GestureDetector(
           behavior: HitTestBehavior.translucent,
           onTap: (){
             push(context: context, screen: orderDetail(
               order_id: Cancelledlist[index]['id'].toString(),
             ));
           },
           child: Padding(
             padding: EdgeInsets.only(bottom: 5.0,),
             child: Material(
               borderRadius: BorderRadius.circular(10),
               elevation: 3,
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     CustomCircularImage(
                       imageUrl: userData.profileImage!,//alllists[index]['booking_items'][0]['photo'],
                       fit: BoxFit.cover,
                       fileType: CustomFileType.network,
                     ),
                     // SizedBox(width: size_width*0.02,),
                     Expanded(
                       flex: 6,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text('${Cancelledlist[index]['fname']} ${Cancelledlist[index]['lname']}', style: MyStyle.black50015,),
                           // SizedBox(height: size_height*0.005,),
                           Text('Total Cost: \$${Cancelledlist[index]['total_amount']}', style: MyStyle.black40013,),
                           // SizedBox(height: size_height*0.005,),
                           Text('Product: ${productnamewithid(Cancelledlist[index]['booking_items'])}'),
                           Text('Product count: ${Cancelledlist[index]['booking_items'].length}'),
                           // SizedBox(height: size_height*0.005,),
                           Text('Order Id: #${Cancelledlist[index]['display_id']??''}', style: MyStyle.lb40013,),

                         ],
                       ),
                     ),
                     Spacer(),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color:
                         Cancelledlist[index]['status'].toString() == '0' ? MyColors.orange :
                         Cancelledlist[index]['status'].toString() == '2' ? MyColors.green :
                         Cancelledlist[index]['status'].toString() == '3' ? MyColors.red :
                         Cancelledlist[index]['status'].toString() == '1'?MyColors.primaryColor:null,
                       ),
                       child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                           child:Text(
                             Cancelledlist[index]['status'].toString() == '0' ?'Pendding':
                             Cancelledlist[index]['status'].toString() == '2' ? 'Delivered' :
                             Cancelledlist[index]['status'].toString() == '1' ? 'Shipped' :
                             Cancelledlist[index]['status'].toString() == '3'?'Cancelled':'Cancelled', style: MyStyle.white70012,)
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
         );
       }):Center(
   child: Text('No data found.'),
   );
 }

 Widget delivered(){
   return deliveredlist.length>0?
   ListView.builder(
       itemCount: deliveredlist.length,
       padding: EdgeInsets.symmetric(vertical: 10.0),
       itemBuilder: (context,index){
         return GestureDetector(
           behavior: HitTestBehavior.translucent,
           onTap: (){
             push(context: context, screen: orderDetail(
               order_id: deliveredlist[index]['id'].toString(),
             ));
           },
           child: Padding(
             padding: EdgeInsets.only(bottom: 5.0,),
             child: Material(
               borderRadius: BorderRadius.circular(10),
               elevation: 3,
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.015),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     CustomCircularImage(
                       imageUrl: userData.profileImage!,//alllists[index]['booking_items'][0]['photo'],
                       fit: BoxFit.cover,
                       fileType: CustomFileType.network,
                     ),
                     // SizedBox(width: size_width*0.02,),
                     Expanded(
                       flex: 6,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text('${deliveredlist[index]['fname']} ${deliveredlist[index]['lname']}', style: MyStyle.black50015,),
                           // SizedBox(height: size_height*0.005,),
                           Text('Total Cost: \$${deliveredlist[index]['total_amount']}', style: MyStyle.black40013,),
                           // SizedBox(height: size_height*0.005,),
                           Text('Product: ${productnamewithid(deliveredlist[index]['booking_items'])}'),
                           Text('Product count: ${deliveredlist[index]['booking_items'].length}'),
                           // SizedBox(height: size_height*0.005,),
                           Text('Order Id: #${deliveredlist[index]['display_id']??''}', style: MyStyle.lb40013,),

                         ],
                       ),
                     ),
                     Spacer(),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color:
                         deliveredlist[index]['status'].toString() == '0' ? MyColors.orange :
                         deliveredlist[index]['status'].toString() == '2' ? MyColors.green :
                         deliveredlist[index]['status'].toString() == '3' ? MyColors.red :
                         deliveredlist[index]['status'].toString() == '1'?MyColors.primaryColor:null,
                       ),
                       child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: size_width*0.025, vertical: size_height*0.005),
                           child:Text(
                             deliveredlist[index]['status'].toString() == '0' ?'Pendding':
                             deliveredlist[index]['status'].toString() == '2' ? 'Delivered' :
                             deliveredlist[index]['status'].toString() == '1' ? 'Shipped' :
                             deliveredlist[index]['status'].toString() == '3'?'Cancelled':'Cancelled', style: MyStyle.white70012,)
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
         );
       }):Center(
   child: Text('No data found.'),
   );
 }

 String productnamewithid(List array) {
    List<String> outarr = [];
    for(int i=0;i<array.length;i++){
      var row = array[i]['name'] +'(${array[i]['item_id']})';
      outarr.add(row);
      // continue;
    }
    return outarr.join(',');
 }

}
