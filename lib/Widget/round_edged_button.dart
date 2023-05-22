
import 'package:flutter/material.dart';

import '../constants/colors.dart';



class RoundEdgedButton extends StatelessWidget {
  final Color color;
  final Color border_color;
  final String text;
  final String fontfamily;
  final Function()? onTap;
  final FontWeight? fontWeight;
  final double horizontalMargin;
  final double? horizontalpad;
  final double verticalPadding;
  final double verticalMargin;
  final bool isSolid;
  final bool isWhite;
  final Color? textColor;
  final double? borderRadius;
  final bool isBold;
  final double? fontSize;
  final double? width;
  final double? height;
  final String? icon;
  final bool click1;



  const RoundEdgedButton(
      {Key? key,
        this.color = MyColors.primaryColor,
        this.border_color= MyColors.primaryColor,
        required this.text,
        this.isWhite = false,
        this.fontfamily = 'nunito',
        this.onTap,
        this.fontWeight,
        this.horizontalpad,
        this.horizontalMargin=0,
        this.textColor,
        this.height,
        this.borderRadius,
        this.isBold = false,
        this.verticalMargin = 0,
        this.verticalPadding =0,
        this.width,
        this.fontSize,
        this.icon,
        this.click1 = false,
        this.isSolid=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(borderRadius??8),
      color: color,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: height,
            margin: EdgeInsets.symmetric(horizontal: horizontalMargin,vertical: verticalMargin),
            width: width??(MediaQuery.of(context).size.width),
            padding: EdgeInsets.symmetric(horizontal: horizontalpad??8, vertical: verticalPadding),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius??8),
              border: Border.all(color: border_color),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(icon!=null)
                  Image.asset(icon!),
                if(icon!=null)
                  SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:textColor?? MyColors.black,
                        fontSize: fontSize??20,
                        fontFamily: fontfamily,
                        fontWeight: fontWeight,
                    ),
                  ),
                ),


              ],
            )
        ),
      ),
    );
  }
}
