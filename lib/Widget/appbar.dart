import 'package:flutter/material.dart';
import '../constants/colors.dart';

AppBar appBar({String? title,
    bool showLogoutButton = false,
    Widget? leading,
    Widget? moreitem,
    bool implyLeading = true,
    double? toolbarHeight,
  TextStyle? titleStyle,
    Function()? onBackButtonTap,
      PreferredSizeWidget? bottom,
    required BuildContext context,
    List<Widget>? actions}) {
  return AppBar(
    toolbarHeight: toolbarHeight??55,
    automaticallyImplyLeading: false,
    titleSpacing: implyLeading ? 0 : 12,
    backgroundColor:MyColors.transparent,
    centerTitle: false,
    elevation: 0,
    bottom: bottom,
    title: title == null
        ? null
        : Text(title, style: titleStyle?? TextStyle(fontFamily: "poppins",fontSize: 14, fontWeight: FontWeight.w600, color: MyColors.black),
    ),
    leading: implyLeading
        ? IconButton(
            icon: const Icon(
              Icons.chevron_left_outlined,
                color: MyColors.black,
              size: 30,
            ),
            onPressed: onBackButtonTap != null
                ? onBackButtonTap
                : () {
                    Navigator.pop(context);
                  },
          )
        : leading,
    actions: showLogoutButton
        ? [
            Center(
              child: GestureDetector(
                onTap: ()async{

                },
                child: Text(
                  'logout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

          ]
        : actions,
    flexibleSpace: moreitem?? null,
  );
}

