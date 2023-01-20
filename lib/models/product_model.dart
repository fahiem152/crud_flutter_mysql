import 'dart:convert';

ProductModel productFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String sproductToJson(ProductModel data) => json.encode(data.toJson());
List<ProductModel> productModelFromJson(List data) =>
    List<ProductModel>.from(data.map((x) => ProductModel.fromJson(x)));

class ProductModel {
  final int id;
  final String name;
  final String description;
  final int price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
