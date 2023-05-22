import 'package:flutter/material.dart';
import '../modal/product_modal.dart';
import '../modal/user_modal.dart';
  double size_height = 0 ;
  double size_width = 0 ;
  UserModal userData = {} as UserModal;
List<List<dynamic>> csvData = [];

Map<String, List<ProductModal>> productsByName= {

};
Map<String, List<ProductModal>> productsByBrands= {

};

List sortByList =  [
  // 'Recommended',
  // 'Hot selling',
  // 'From A to Z',
  // 'From Z to A',
  'Ascending Price',
  'Descending Price',
  // 'Old one first',
  // 'New one first'
];