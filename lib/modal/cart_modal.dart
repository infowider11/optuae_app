class CartItem {
   late String id;
   late String name;
   late String photo;
   late double price;
   late  int qty;
   late   String brand;
   late  String model;
   late  String year;
   late  String body;
   late  String engine;
   late String topBottom;
   late String frontRear;
   late  String lionRight;
   late String color;
   late  String partNumber;
   late  String comment;
   late String manufacturer;
   late  String newUsed;
   late String stockStatus;
   late  List images;

  CartItem({
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
    required this.qty,
    required this.images,
    required this.stockStatus,
    required this.body,
    required this.year,
    required this.brand,
    required this.color,
    required this.comment,
    required this.engine,
    required this.frontRear,
    required this.lionRight,
    required this.manufacturer,
    required this.model,
    required this.newUsed,
    required this.partNumber,
    required this.topBottom,
  });

  CartItem.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    price = json['price'];
    qty = json['qty'];
    model = json['model']??'';
    images = json['images']??[];
    stockStatus = json['stockStatus'];
    body=json['body'];
    year=json['year'];
    brand=json['brand'];
    color=json['color'];
    comment=json['comment'];
    engine=json['engine'];
    frontRear=json['frontRear'];
    lionRight=json['lionRight'];
    manufacturer=json['manufacturer'];
    model=json['model'];
    newUsed=json['newUsed'];
    partNumber=json['partNumber'];
    topBottom=json['topBottom'];
  }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['id'] = this.id;
     data['name'] = this.name;
     data['photo'] = this.photo;
     data['price'] = this.price;
     data['qty'] = this.qty;
     data['model'] = this.model;
     data['images']=this.images;
     data['stockStatus']=this.stockStatus;
     data['body']=this.body;
     data['year']=this.year;
     data['brand']=this.brand;
     data['color']=this.color;
     data['comment']=this.comment;
     data['engine']=this.engine;
     data['frontRear']=this.frontRear;
     data['lionRight']=this.lionRight;
     data['manufacturer']=this.manufacturer;
     data['model']=this.model;
     data['newUsed']=this.newUsed;
     data['partNumber']=this.partNumber;
     data['topBottom']=this.topBottom;
     return data;
   }
}
