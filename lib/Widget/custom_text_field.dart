
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/global_data.dart';



class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Color? textColor;
  final Color? labelColor;
  final BoxBorder? border;
  final bool horizontalPadding;
  final bool obscureText;
  final int? maxLines;
  final Color bgColor;
  final Color hintcolor;
  final double verticalPadding;
  final double fontsize;
  final double contentBottomPadding;
  final double contentTopPadding;
  final double borderRadius;
  final double? myheight;
  final double? headingBoxGap;
  final String? errorText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? headingText;
  final String? subHeading;
  final Function()? onTap;
  final Widget? suffix;
  final Widget? preffix;
  final String? prefixText;
  TextInputType? keyboardType;
  final bool enabled;
  final bool? isHeadingIcon;
  final String? suffixText;
  final bool enableInteractiveSelection;
  final bool textalign;
  final bool? autofocus;
  final FocusNode? focusNode;
  CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.headingBoxGap,
    this.labelColor,
    this.border,
    this.myheight,
    this.subHeading,
    this.isHeadingIcon,
    this.maxLines,
    this.autofocus=false,
    this.preffix,
    this.horizontalPadding = false,
    this.obscureText = false,
    this.bgColor = MyColors.black,
    this.hintcolor = MyColors.black,
    this.verticalPadding=0,
    this.fontsize = 15,
    this.contentBottomPadding = 0,
    this.contentTopPadding = 0,
    this.borderRadius = 18,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.headingText,
    this.enabled = true,
    this.suffix,
    this.suffixText,
    this.textColor,
    this.prefixText,
  this.focusNode,
  this.enableInteractiveSelection = true,
    this.onTap,
    this.textalign = false
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        headingText==null || subHeading==null ? Container() :
        Row(
          children: [
            isHeadingIcon==true?
            Text(headingText!+" ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: "trans_regular", color: MyColors.black), ):
            Text(headingText!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: "trans_regular", color: MyColors.black), ),

            Text("  "+subHeading!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: "nunito", color: MyColors.black.withOpacity(0.5)),
            ),
          ],
        ),

        SizedBox(height: headingBoxGap?? size_height*0.01,),

        Material(
        borderRadius: headingText==null ? BorderRadius.circular(8) : BorderRadius.circular(8) ,
          color:bgColor,
          elevation: 3,
          shadowColor: Color(0xffD7D7D7),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Container(
                  height: myheight?? size_height*0.07,
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    cursorColor: MyColors.black,
                    textInputAction: TextInputAction.done,
                    maxLines: maxLines ?? 1,
                    focusNode: focusNode,
                    textAlign: textalign? TextAlign.center: TextAlign.left,
                    controller: controller,
                    obscureText: obscureText,
                    keyboardType: keyboardType,
                    style: TextStyle(color: textColor, fontSize: fontsize, decoration: TextDecoration.none),
                    // autofocus: autofocus!,
                    textAlignVertical: TextAlignVertical.center,
                    enableInteractiveSelection: true,
                    enabled: enabled,
                    decoration: InputDecoration(
                      // suffix: suffix,
                      prefixIcon: preffix,
                      contentPadding: EdgeInsets.fromLTRB(10, contentTopPadding, 0, contentBottomPadding),
                      fillColor:  headingText!=null? Colors.transparent: bgColor,
                      filled: true,
                      // isDense: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: hintText,
                      suffixText: suffixText,
                      prefixText: prefixText,
                      prefixStyle: TextStyle(
                        fontSize: 16
                      ),
                      hintStyle: TextStyle(
                        color: hintcolor,
                        fontSize:15,
                        fontFamily: 'poppins',
                          decoration: TextDecoration.none
                      ),
                      labelStyle:  TextStyle(fontSize: 20, fontFamily: "poppins", color: labelColor?? MyColors.black, decoration: TextDecoration.none),
                      errorText: errorText,
                    ),
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                    onTap: onTap,
                  ),
                ),
                Positioned(right:15, top: 15, child: suffix??Container())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

