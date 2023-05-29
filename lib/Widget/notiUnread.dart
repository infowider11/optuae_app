import 'package:flutter/material.dart';

import '../services/auth.dart';
import 'CustomTexts.dart';
// import 'CustomTexts.dart';

class notiunreadCircle extends StatefulWidget {
  notiunreadCircle({ Key? key}) : super(key: key);

  @override
  State<notiunreadCircle> createState() => _notiunreadCircleState();
}

class _notiunreadCircleState extends State<notiunreadCircle> {
  int count = 0;
  bool showCirlce = false;
  List carts=[];
  @override
  void initState() {
    // TODO: implement initState
    updateUi();
    super.initState();
  }

  updateUi() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        // showCirlce
        if (unread_notification_count > 0) {
          count = unread_notification_count;
          // print(count);
          showCirlce = true;
        } else {
          showCirlce = false;
        }
      });
      updateUi();
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
          color: Colors.red,
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
