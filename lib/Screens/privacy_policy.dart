import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:optuae/Constants/colors.dart';
import '../Constants/Textstyles.dart';
import '../Widget/appbar.dart';
import '../services/Customloader.dart';
import '../services/api_urls.dart';
import '../services/webservices.dart';

class privacy_policy extends StatefulWidget {
  const privacy_policy({Key? key}) : super(key: key);

  @override
  State<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
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
    var res = await Webservices.getData(ApiUrls.privacypolicy);
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
        title: "Privacy Policy",
        titleStyle: MyStyle.black50016,
      ),

      body: load?CustomLoader(color: MyColors.black):SingleChildScrollView(
          child: Html(
            data: data,
          )
      ),
    );
  }


}
