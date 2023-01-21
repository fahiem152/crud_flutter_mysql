import 'dart:convert';

import 'package:crud_flutter_database_mysql/models/product_model.dart';
import 'package:crud_flutter_database_mysql/utils/constanta.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const _baseUrl = '${baseUrl}api/product';

  static Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      // var jsonObject = ;
      var jsonObject = json.decode(response.body)['data'];
      // List data = (jsonObject as Map<String, dynamic>)['data'];
      List data = jsonObject;

      List<ProductModel> dataProducts = [];
      dataProducts = productModelFromJson(data);
      return dataProducts;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<ProductModel> addProduct(ProductModel productModel) async {
  //   final response = await http.post(
  //     Uri.parse(_baseUrl),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: productToJson(productModel),
  //   );
  //   if (response.statusCode == 200) {
  //     return productFromJson(response.body);
  //   } else {
  //     throw Exception('Failed to add data');
  //   }
  // }

  Future<http.Response> addProduct(ProductModel productModel) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: productToJson(productModel),
    );
    return response;
    // if (response.statusCode == 200) {
    //   return productFromJson(response.body);
    // } else {
    //   return false;
    // }
  }
}
