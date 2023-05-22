import 'dart:io';
import 'dart:convert' as convert;
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:windows1251/windows1251.dart';
import 'package:flutter/material.dart';
import 'package:optuae/constants/colors.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Screens/welcome.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/auth.dart';
import 'package:optuae/services/navigation_functions.dart';
import 'package:optuae/services/webservices.dart';
import '../constants/images_url.dart';
import '../constants/global_data.dart';
import '../modal/product_modal.dart';
import 'BottomBar.dart';
import '../modal/user_modal.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  getCsvData() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    File file = File(path + 'manish.csv');
    file.openWrite();
    final response = await http
        .get(Uri.parse("https://baz-on.ru/export/c2433/339e1/optuae-drom.csv"));
    // final response = await http.get(Uri.parse("https://baz-on.ru/export/c2433/339e1/optuae-drom.csv"));
    print('idkfk2 ${response.body}');

    String res = response.body;
    String finalRes = windows1251.decode(res.runes.toList());
    print('final res $finalRes');
    await file.writeAsString(res);
    Stream<List<int>> input = (file).openRead();
    csvData = await input
        .transform(convert.utf8.decoder)
        .transform(CsvToListConverter())
        .toList();
    print('the fields are $csvData');
    // setState(() {
    //
    // });
    convertCsvDataIntoProductModal();
  }

  convertCsvDataIntoProductModal() {
    productsByName.clear();
    // csvData.removeAt(0);
    for (int i = 1; i < csvData.length; i++) {
      List dataList = windows1251
          .decode(csvData[i][0].toString().runes.toList())
          .split(";");
      productsByName['${dataList[1]}'] = [
        // ...(productsByName['${dataList[1]}'] ?? []),
        ProductModal(
          id: dataList[0],
          name: dataList[1],
          brand: dataList[2],
          model: dataList[3],
          year: dataList[4],
          body: dataList[5]=='"'?'':dataList[5],
          engine: dataList[6],
          topBottom: dataList[7],
          frontRear: dataList[8],
          lionRight: dataList[9],
          color: dataList[10],
          partNumber: dataList[11],
          comment: dataList[12]=='"'?'':dataList[12],
          price: dataList[13],
          manufacturer: dataList[14],
          photo: dataList[15],
          newUsed: dataList[16],
          stockStatus: dataList[17],
          images: dataList[15].toString().split(", "),
        ),
        ...(productsByName['${dataList[1]}'] ?? []),
      ];
      productsByBrands['${dataList[2]}'] = [
        ...(productsByBrands['${dataList[2]}'] ?? []),
        ProductModal(
          id: dataList[0],
          name: dataList[1],
          brand: dataList[2],
          model: dataList[3],
          year: dataList[4],
          body: dataList[5]=='"'?'':dataList[5],
          engine: dataList[6],
          topBottom: dataList[7],
          frontRear: dataList[8],
          lionRight: dataList[9],
          color: dataList[10],
          partNumber: dataList[11],
          comment: dataList[12]=='"'?'':dataList[12],
          price: dataList[13],
          manufacturer: dataList[14],
          photo: dataList[15],
          newUsed: dataList[16],
          stockStatus: dataList[17],
          images: dataList[15].toString().split(", "),
        ),
      ];

    }
  }

  Future<void> timer() async {
    await getCsvData();
    Future.delayed(Duration(seconds: 1), () {
      // push(context: context, screen: Welcome());
      CheckSession();
    });
  }

  CheckSession() async {
    if (await isUserLoggedIn()) {
      var res = await Webservices.getMap(
          ApiUrls.getUserDetails + await getCurrentUserId());
      print('splash session data $res');
      if (res != null) {
        updateUserDetails(res);
        userData = UserModal.fromJson(res);
        pushAndRemoveUntil(context: context, screen: BottomBar());
      }
    } else {
      pushAndRemoveUntil(context: context, screen: Welcome());
    }
  }

  @override
  void initState() {

    timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size_height = MediaQuery.of(context).size.height;
    size_width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Center(
          child: Image.asset(
            MyImages.logo,
            width: size_width * 0.4,
          ),
        ));
  }
}
