import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:windows1251/windows1251.dart';

import '../constants/global_data.dart';
import 'dart:convert' as convert;

import '../modal/product_modal.dart';
import 'api_urls.dart';

class MyCsvConversionServices{
  static Future   getCsvData() async {
    // String path = (await getApplicationDocumentsDirectory()).path;
    String path = (await getTemporaryDirectory()).path;
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

    await convertCsvDataIntoProductModal();
  }


  static convertCsvDataIntoProductModal() async{
    final response = await http.get(Uri.parse(ApiUrls.getAllBookingIds));
    var jsonResponse = convert.jsonDecode(response.body);
    print("response==${jsonResponse}");
    if(jsonResponse['status'].toString() == "1"){
      product_id_check_list = jsonResponse['data'].split(",");
    }
    print("product_id_check_list$product_id_check_list");

    productsByName.clear();
    // csvData.removeAt(0);
    for (int i = 1; i < csvData.length; i++) {
      List dataList = windows1251
          .decode(csvData[i][0].toString().runes.toList())
          .split(";");

      ProductModal productTemp =ProductModal(
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
      );
      print('printing_dataList[0]=====${dataList[0]}');

      if(!product_id_check_list.contains(productTemp.id)){

        /// jai shree ram
        // totalProducts.add(productTemp);
        totalProducts =[
          productTemp,
          ...totalProducts
        ];
        productsByName['${dataList[1]}'] = [
          productTemp,
          ...(productsByName['${dataList[1]}'] ?? []),
        ];
        productsByBrands['${dataList[2]}'] = [
          productTemp,
          ...(productsByBrands['${dataList[2]}'] ?? []),
        ];
      }



    }
  }
}