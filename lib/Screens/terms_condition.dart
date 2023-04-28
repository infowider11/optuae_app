import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:optuae/Constants/colors.dart';
import 'package:optuae/services/Customloader.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/webservices.dart';
import '../Constants/Textstyles.dart';
import '../Widget/appbar.dart';

class terms_condition extends StatefulWidget {
  const terms_condition({Key? key}) : super(key: key);

  @override
  State<terms_condition> createState() => _terms_conditionState();
}

class _terms_conditionState extends State<terms_condition> {
@override
  void initState() {
    // TODO: implement initState
  get_content();
    super.initState();
  }

  bool load = false;
  String? data;

  get_content() async{
      setState(() {
        load = true;
      });
      var res = await Webservices.getData(ApiUrls.terms);
      var  jsonres = jsonDecode(res.body);
      print('term  $jsonres');
      if(jsonres['status'].toString()=='1'){
        data = jsonres['data'];
      }
      setState(() {
        load = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(
        context: context,
        title: "Terms & Conditions",
        titleStyle: MyStyle.black50016,
      ),

      body: load?CustomLoader(color: MyColors.black,):SingleChildScrollView(
        child: Html(
          data: data,
        )
      ),
    );
  }


}
