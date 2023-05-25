class ProductModal{
  String id;
  String name;
  String brand;
  String model;
  String year;
  String body;
  String engine;
  String topBottom;
  String frontRear;
  String lionRight;
  String color;
  String partNumber;
  String comment;
  String price;
  String manufacturer;
  String photo;
  String newUsed;
  String stockStatus;
  // String? qty;
  List images;

  ProductModal({
    required this.id,
    required this.name,
    required this.brand,
    // this.qty='1',
    required this.model,
    required this.year,
    required this.body,
    required this.engine,
    required this.topBottom,
    required this.frontRear,
    required this.lionRight,
    required this.color,
    required this.partNumber,
    required this.comment,
    required this.price,
    required this.manufacturer,
    required this.photo,
    required this.newUsed,
    required this.stockStatus,
    required this.images,
  });


  // Map toJson(){
  //   return {
  //   "id": id,
  //   "name": name,
  //   "brand": brand,
  //   "model": model,
  //   "brand": brand,
  //   "year": year,
  //   "body": body,
  //   "engine": engine,
  //   "topBottom": topBottom,
  //   "frontRear": frontRear,
  //   "lionRight": lionRight,
  //   "color": color,
  //   "number": partNumber,
  //   "comment": comment,
  //   "manufacturer": manufacturer,
  //   "photo": photo??"",
  //   "newUsed": newUsed,
  //   "status": stockStatus,
  //   };
  // }
}



//   ProductModal(id: dataList[0], name: dataList[1], brand: dataList[2], model: dataList[3], year: dataList[4],
// body: dataList[5], engine: dataList[6], topBottom: dataList[7], frontRear: dataList[8], lionRight: dataList[9],
// color: dataList[10], number: dataList[11], comment: dataList[12], price: dataList[13],
// manufacturer: dataList[14], photo: dataList[15], newUsed: dataList[16], status: dataList[17],)];
///1 name,
///2 brand,
///3 model,
///4 year
///5 Body
///6 Engine
///7Top bottom
///8Front/Rear
///9Lion/Right
///0 Color
///1 Number
///12A comment
///13 Price
///14 Manufacturer
///15 Photo
///16 New/Used
///17 Status