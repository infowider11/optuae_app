import 'package:flutter/material.dart';
import '../modal/product_modal.dart';
import '../modal/user_modal.dart';
  double size_height = 0 ;
  double size_width = 0 ;
  UserModal userData = {} as UserModal;
 String cartKey = 'cartItems';
List<List<dynamic>> csvData = [];


List<ProductModal> totalProducts = [];
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


List<String> product_id_check_list = [];