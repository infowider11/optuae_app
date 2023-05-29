import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../services/cart_manage.dart';
import 'CustomTexts.dart';
// import 'CustomTexts.dart';

class cartcountCircle extends StatefulWidget {
  cartcountCircle({Key? key}) : super(key: key);

  @override
  State<cartcountCircle> createState() => _cartcountCircleState();
}

class _cartcountCircleState extends State<cartcountCircle> {
  int count = 0;
  bool showCirlce = false;
  // List carts=[];
  @override
  void initState() {
    // TODO: implement initState
    updateUi();
    super.initState();
  }

  updateUi() {
    Future.delayed(Duration(milliseconds: 1000), ()async{
      try{
        setState((){

          // showCirlce
          if (Cartmanage.cartCount > 0) {

            count = Cartmanage.cartCount;
            // print(count);
            showCirlce = true;
          } else {
            showCirlce = false;
          }
        });

        updateUi();
      }
      catch(e){
        updateUi();
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return (showCirlce)
        ? Container(
        margin: EdgeInsets.only(left: 10),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: MyColors.red.withOpacity(.9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: ParagraphText(
                count.toString(),
                textAlign: TextAlign.end,
                color: Colors.white,
                fontSize: 10,
              ),
            )))
        : Container();
  }
}
