import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/global_data.dart';



class DropDown extends StatefulWidget {
  final String label;
  final Color? labelcolor;
  final Color? buttoncolorColor;
  final Color? dropdownColor;
  final double? fontsize;
  final List<dynamic> items;
  final bool? islabel;
  final bool? isRight;
  final double? dropdownWidth;
  final double? buttonwidth;
  final double? dropdownwidth;
  final double? buttonheight;
  Color? iconColor;
  double? iconpadding;
  TextStyle? textStyle;
  TextStyle? textStylelist;
  double? boxBottomPadding;
  double? boxTopPadding;
  String? selectedValue;
  final Function(dynamic)? onChanged;

  DropDown({
    Key? key,
    required this.label ,
    this.labelcolor = MyColors.white,
    this.fontsize = 14,
    this.items = const [
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
    ],
    this.islabel = true,
    this.isRight = true,
    this.dropdownWidth,
    this.iconColor,
    this.iconpadding,
    this.boxBottomPadding,
    this.boxTopPadding,
    this.textStyle,
    this.textStylelist,
    this.buttoncolorColor= MyColors.white,
    this.dropdownColor,
    this.buttonwidth,
    this.buttonheight,
    this.dropdownwidth,
    this.selectedValue,
    this.onChanged,

  }) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  // String? selectedValue;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Padding(
              padding:  EdgeInsets.only(top: widget.boxTopPadding?? 0, bottom: widget.boxBottomPadding?? 0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isDense:true,
                  isExpanded: true,
                      hint: Text(
                        widget.label,
                        style: widget.textStyle?? TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: "poppins", color: MyColors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                  icon: Padding(
                    padding: EdgeInsets.only(right: widget.iconpadding??  size_width*0.02),
                    child: Icon( widget.isRight == true? CupertinoIcons.chevron_right : CupertinoIcons.chevron_down, size: 15, color: widget.iconColor?? MyColors.black,),
                  ),
                      items: widget.items
                          .map((item) => DropdownMenuItem<dynamic>(
                        alignment: AlignmentDirectional.centerStart,
                        value: item,
                        child:
                        Text(
                          item,
                          style: widget.textStylelist?? TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: "poppins", color: MyColors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                          .toList(),
                  value: widget.selectedValue,
                  onChanged: widget.onChanged,
                  // onChanged: (value) {
                  //   setState(() {
                  //     widget.selectedValue = value ;
                  //     print(widget.selectedValue);
                  //   });
                  // },
                  iconSize:25,
                  iconEnabledColor: MyColors.white,
                  iconDisabledColor: Colors.grey,
                  buttonHeight:widget.buttonheight?? size_height*0.06,
                  buttonWidth: widget.buttonwidth?? size_width,
                  buttonPadding: const EdgeInsets.only(left:10, right:0,top: 5),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color:widget.buttoncolorColor?? MyColors.white,
                  ),
                  buttonElevation: 0,
                  itemHeight: 30,
                  itemPadding: const EdgeInsets.only(left:10, right: 0,),
                  dropdownMaxHeight: 500,
                  dropdownWidth:widget.dropdownWidth?? widget.buttonwidth,
                  dropdownPadding:null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color:widget.dropdownColor?? MyColors.white,
                  ),
                  dropdownElevation: 0,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(0, 0),
                ),
              ),
            )

            ///full width dropdown
            // DropdownButtonHideUnderline(
            //   child: DropdownButton2(
            //     isExpanded: true,
            //     hint: Text(
            //       widget.items[0],
            //       style: TextStyle(
            //           fontSize: 15,
            //           color: Colors.white,
            //           fontFamily: 'Regular',
            //           fontWeight: FontWeight.w500
            //       ),
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //     items: widget.items
            //         .map((item) => DropdownMenuItem<dynamic>(
            //       value: item,
            //       child:
            //       // item,
            //       Text(
            //         item,
            //         style: const TextStyle(
            //           fontSize: 15,
            //           fontWeight: FontWeight.w500,
            //           fontFamily: 'Regular',
            //
            //           // fontWeight: FontWeight.bold,
            //           color: Colors.white,
            //         ),
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //     ))
            //         .toList(),
            //     value: selectedValue,
            //     onChanged: (value) {
            //       setState(() {
            //         selectedValue = value as String?;
            //       });
            //     },
            //     icon: const Icon(
            //       Icons.expand_more_outlined,
            //     ),
            //     iconSize:22,
            //     iconEnabledColor: MyColors.primaryColor,
            //     iconDisabledColor: Colors.grey,
            //     buttonHeight:widget.buttonheight,
            //     buttonWidth:widget.buttonwidth?? MediaQuery.of(context).size.width,
            //     buttonPadding: const EdgeInsets.only(left:18, right:10),
            //     buttonDecoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(
            //           color: MyColors.primaryColor,width: 0.5
            //       ),
            //       color:widget.buttoncolorColor,
            //     ),
            //     buttonElevation: 0,
            //     itemHeight: 30,
            //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
            //     dropdownMaxHeight: 200,
            //     dropdownWidth: widget.buttonwidth,
            //     dropdownPadding:null,
            //     dropdownDecoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5),
            //       color:MyColors.black,
            //       border: Border.all(
            //         color: MyColors.primaryColor,
            //       ),
            //     ),
            //     dropdownElevation: 0,
            //     scrollbarRadius: const Radius.circular(40),
            //     scrollbarThickness: 6,
            //     scrollbarAlwaysShow: true,
            //     offset: const Offset(0, 0),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}